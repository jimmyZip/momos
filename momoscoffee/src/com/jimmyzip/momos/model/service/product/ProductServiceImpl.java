package com.jimmyzip.momos.model.service.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jimmyzip.momos.common.FileManager;
import com.jimmyzip.momos.exception.DeleteFailException;
import com.jimmyzip.momos.exception.EditFailException;
import com.jimmyzip.momos.exception.RegistFailException;
import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.ProductImage;
import com.jimmyzip.momos.model.repository.product.ProductDAO;
import com.jimmyzip.momos.model.repository.product.ProductImageDAO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	@Autowired
	@Qualifier("mybatisProductDAO")
	private ProductDAO productDAO;
	
	@Autowired
	@Qualifier("mybatisProductImageDAO")
	private ProductImageDAO productImageDAO;
	
	@Autowired
	FileManager fileManager;
	
	public Product select(int product_id) {
		Product p = productDAO.select(product_id);
		List<ProductImage> prodImgList = productImageDAO.selectAllByFk(product_id);
		
		p.setProductImage(prodImgList);
		return p;
	}
	public List<Product> selectAll() {
		return productDAO.selectAll();
	}
	public List<Product> selectAllByFk(int subcategory_id){
		System.out.println("productServiceImple에서 확인한 넘겨받은 sub_id : "+subcategory_id);
		List<Product> productList = productDAO.selectAllByFk(subcategory_id);
		System.out.println("serviceImpl에서 productList 사이즈 확인 : "+productList.size());
		
		for(int i=0;i<productList.size();i++) {
			Product p = productList.get(i);
			List<ProductImage> prodImgList = productImageDAO.selectAllByFk(p.getProduct_id());
			//prodImgList.addAll(productImageDAO.selectAllByFk(p.getProduct_id()));
			System.out.println("serviceImpl에서 확인한 prodImgList 사이즈 : "+prodImgList.size());		
			p.setProductImage(prodImgList);
			System.out.println("product 에 imgList가 담겼나 0번째로 확인 : "+p.getProductImage().get(0).getProd_img());
		}
		return productList;
	}
	
	////////////////////////////////////////제품등록 1건//////////////////////////////////////////////////////////
	public void insert(Product product, ProductImage productImage, String path) throws RegistFailException{
		MultipartFile[] myFile = productImage.getMyFile();
		List<String> filenameList = new ArrayList<String>();
		File originFile = null;
		
		int result = productDAO.insert(product);
		productImage.setProduct(product);
		
		int result2=0;//productImageDAO의 결과값 담을 변수
		for(int i=0;i<myFile.length;i++) {
			filenameList.add(myFile[i].getOriginalFilename());
			String filename = filenameList.get(i);
			originFile = new File(path+"/"+filename);
			
			try {
				myFile[i].transferTo(originFile);
				//filename = fileManager.renameByDate(originFile, path);
					//admin에서 업로드한 이미지파일을 클라이언트에서도 파일명으로 골라쓰기 위해 rename안하기로함
				if(filename!=null) {
					productImage.setProd_img(filename);
					result2 = productImageDAO.insert(productImage);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(result==0) {
			throw new RegistFailException("상품등록 실패. 정보를 확인해주세요.");
		}
		if(result2==0) {
			throw new RegistFailException("이미지 등록 실패.");
		}
	}
	
	//////////////////////////////////제품명 중복체크////////////////////////////////////
	public Product nameDoubleCheck(Product product) {
		return productDAO.nameDoubleCheck(product);
	}
	
	//////////////////////////////가격으로 제품조회/////////////////////////////////////
	public List<Product> selectByPrice(int price){
		return productDAO.selectByPrice(price);
	}
	
	
	//////////////////////////////////////////상품정보 수정//////////////////////////////////////////////
	public void update(Product product,ProductImage productImage,String path) throws EditFailException{
		System.out.println("상품정보 수정 시 넘겨받은 productImage확인 : "+productImage.getMyFile());
		System.out.println("상품정보 수정 때 넘겨받은 productImage중 delFile확인 : "+productImage.getDeleteFile());
		int deleteResult=0;//기존 이미지 파일 삭제할 경우 업로드된 파일 삭제
		int result1=0;//기존 이미지 파일 삭제할 경우 db에서도 삭제
		int result2=0;//이미지 업데이트 결과
		int result3=0;//최종 수정update결과
		
		//기존이미지 삭제
		if(productImage.getDeleteFile()!=null) {
			for(int i=0;i<productImage.getDeleteFile().length;i++) {
				String delFile=productImage.getDeleteFile()[i];
				System.out.println("삭제할 기존 이미지파일명 : "+delFile);
				String delFile2 = fileManager.separateFile(productImage.getDeleteFile()[i]);
				File file = new File(path+"/"+delFile2);
				
				if(file.delete()) {
					deleteResult=1;
					productImage.setProd_img(delFile2);
					result1 = productImageDAO.deleteFile(productImage);
					System.out.println("기존 프로덕트 이미지 삭제결과 : "+result1);
				}else {
					deleteResult=0;
				}
			}
		}else {
			result1=2;
			System.out.println("삭제할 기존파일 없음 "+result1);
		}
		
		//새로 추가된 이미지 처리
		MultipartFile[] myFile = productImage.getMyFile();//새로 선택한 파일 목록
		List<String> filenameList = new ArrayList<String>();//기존 파일 이름 담을 리스트
		System.out.println("productServiceImpl 새로 선택한 파일목록 사이즈확인 : "+myFile.length);
		if(result1==1) {
			File originFile = null;//파일 업로드를 위한 파일 생성
			if(myFile.length>0) {
				for(int i=0;i<myFile.length;i++) {
					filenameList.add(myFile[i].getOriginalFilename());
					System.out.println("fileLameList에 myFile.getOriginalFilename잘 담기나 확인 : "+filenameList.get(i));
					String filename = filenameList.get(i);
					System.out.println("담은 파일명 : "+filename);
					originFile = new File(path+"/"+filenameList.get(i));
					try {
						myFile[i].transferTo(originFile);
						//String filename = fileManager.renameByDate(originFile, path);
						if(filename!=null) {
							productImage.setProd_img(filename);
							productImage.setProduct(product);
							
							//result2=productImageDAO.update(productImage);
							result2=productImageDAO.updateFile(productImage);
							System.out.println("프로덕트 이미지 수정 수행결과 : "+result2);
						}
					} catch (IllegalStateException e) {
						System.out.println("왜 이미지 수정 수행결과줄 쌩까지?");
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else {
				result2=1;
			}
		}else {
			result2=1;
		}
		
		
		//제품 변경처리
			
		result3=productDAO.update(product);
		
	
		if(result1==0) {
			throw new EditFailException("기존 이미지 삭제실패. 정보를 확인해주세요.");
		}
		
		if(result2==0) {
			throw new RegistFailException("새로운 이미지 등록실패");
		}
		
		if(result3==0) {
			throw new EditFailException("제품정보 변경 실패");
		}
	}
	
	//////////////////////////////////////상품삭제////////////////////////////////////////////////
	//public void delete(int product_id,String path) throws DeleteFailException{
	public void delete(List<Integer> deleteArray, String path) throws DeleteFailException{
		List<ProductImage> imgList = new ArrayList<ProductImage>();
		//List<ProductImage> imgList = productImageDAO.selectAllByFk(product_id);
		for(int i=0;i<deleteArray.size();i++) {
			int product_id = deleteArray.get(i);
			//imgList.add(i, (ProductImage)productImageDAO.selectAllByFk(product_id));
			imgList.addAll(productImageDAO.selectAllByFk(product_id));
		}
		
		int result=0;//업로드 되어있는 이미지 삭제 관련
		int result2=0;//db에서 이미지 삭제
		int result3=0;//제품삭제
		for(int i=0;i<imgList.size();i++) {
			ProductImage img = imgList.get(i);
			String filename = img.getProd_img();
			File file = new File(path+"/"+filename);
			
			if(file.delete()) {
				result=1;
			}else {
				result=0;
			}
		}
		if(result==1) {
			//해당 제품의 키로 딸려있는 이미지 전부 삭제
			for(int i=0;i<deleteArray.size();i++) {
				int product_id = deleteArray.get(i);
				result2=productImageDAO.deleteAllByFk(product_id);
			}
			
		}
		
		for(int i=0;i<deleteArray.size();i++) {
			int product_id = deleteArray.get(i);			
			result3 = productDAO.delete(product_id);
		}
		
		if(result==0) {
			throw new DeleteFailException("업로드 이미지 삭제 실패");
		}
		if(result2==0) {
			throw new DeleteFailException("게시 이미지 삭제 실패");
		}
		if(result3==0) {
			throw new DeleteFailException("제품 삭제 실패");
		}
	}
	
	//////////////////////////////////////상품 검색//////////////////////////////
	public List<Product> search(String searchWord){
		System.out.println("productServiceImpl에서 검색요청 받아 수행");
		return productDAO.search(searchWord);
	}
	
	//////////////////////////////수정하려는 이미지 리스트 얻기////////////////////////////////////////////
	public List<ProductImage> getImg(){
		List<ProductImage> prodImgList = productImageDAO.selectAll();
		JSONArray imgArray = new JSONArray(); 
		for(ProductImage img:prodImgList) {
			JSONObject obj = new JSONObject();  
			obj.put("prod_img", img.getProd_img());
			obj.put("product_id", img.getProduct().getProduct_id());
			imgArray.add(obj);
		}
		return imgArray;
	}
}
