package com.jimmyzip.momos.model.service.branch;

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
import com.jimmyzip.momos.model.domain.branch.Branch;
import com.jimmyzip.momos.model.domain.branch.BranchImage;
import com.jimmyzip.momos.model.repository.branch.BranchDAO;
import com.jimmyzip.momos.model.repository.branch.BranchImageDAO;
@Service
@Transactional
public class BranchServiceImpl implements BranchService{
	@Autowired
	@Qualifier("mybatisBranchDAO")
	private BranchDAO branchDAO;
	
	@Autowired
	@Qualifier("mybatisBranchImageDAO")
	private BranchImageDAO branchImageDAO;
	
	@Autowired
	FileManager fileManager;
	
	public Branch select(int branch_id) {
		Branch b = branchDAO.select(branch_id);
		List<BranchImage> branchImgList = branchImageDAO.selectAllByFk(branch_id);
		b.setBranchImage(branchImgList);
		return b;
	}

	public List<Branch> selectAll() {
		List<Branch> branchList = branchDAO.selectAll();
		List<BranchImage> branchImgList = new ArrayList<BranchImage>();
		for(Branch b:branchList) {
			branchImgList = branchImageDAO.selectAllByFk(b.getBranch_id());
			b.setBranchImage(branchImgList);
		}
		return branchList;
	}
	
	//지점 1건 등록
	public void insert(Branch branch, BranchImage branchImage, String path) throws RegistFailException{
		MultipartFile[] branchFile = branchImage.getBranchFile();
		List<String> filenameList = new ArrayList<String>();
		File originFile = null;
		
		int result = branchDAO.insert(branch);
		branchImage.setBranch(branch);
		
		int result2=0;//branchImageDAO의 결과값 담을 변수
		for(int i=0;i<branchFile.length;i++) {
			filenameList.add(branchFile[i].getOriginalFilename());
			String filename = filenameList.get(i);
			originFile = new File(path+"/"+filename);
			
			try {
				branchFile[i].transferTo(originFile);
				//filename = fileManager.renameByDate(originFile, path);
				if(filename!=null) {
					branchImage.setBranch_img(filename);
					result2=branchImageDAO.insert(branchImage);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(result==0) {
			throw new RegistFailException("지점등록 실패. 정보를 확인해주세요.");
		}
		if(result2==0) {
			throw new RegistFailException("이미지 등록 실패.");
		}
	}

	//지점명 중복체크
	public Branch nameDoubleCheck(Branch branch) {
		return branchDAO.nameDoubleCheck(branch);
	}
	
	//지점정보 수정
	public void update(Branch branch, BranchImage branchImage, String path) throws EditFailException{
		System.out.println("지점정보 수정 시 넘겨받은 branchImage확인 : "+branchImage.getBranchFile());
		System.out.println("지점정보 수정 시 넘겨받은 branchImage 중 delFile확인 : "+branchImage.getDeleteFile());
		
		int deleteResult=0;
		int result1=0;//기존 지점이미지 파일 삭제할 경우 업로드 파일 삭제 결과
		int result2=0;//이미지 업데이트 결과
		int result3=0;//최종 업데이트 결과
		
		//기존 이미지 삭제
		if(branchImage.getDeleteFile()!=null) {
			for(int i=0;i<branchImage.getDeleteFile().length;i++) {
				String delFile=branchImage.getDeleteFile()[i];
				String delFile2 = fileManager.separateFile(branchImage.getDeleteFile()[i]);
				File file = new File(path+"/"+delFile2);
				
				if(file.delete()) {
					deleteResult=1;
					branchImage.setBranch_img(delFile2);
					result1=branchImageDAO.deleteFile(branchImage);
					System.out.println("기존 지점 이미지 삭제결과 : "+result1);
				}else {
					deleteResult=0;
				}
			}
		}else {
			result1=2;
			System.out.println("삭제할 기존파일 없음 : "+result1);
		}
		
		//새로 추가된 이미지 처리
		MultipartFile[] branchFile = branchImage.getBranchFile();//새로 선택한 파일 목록
		List<String> filenameList = new ArrayList<String>();//기존 파일 이름 담을 공간
		System.out.println("branchServiceImpl 새로 선택한 파일목록 사이즈확인 : "+branchFile.length);
		if(result1==1) {
			
			File originFile = null;//파일 업로드를 위한 파일 생성
			if(branchFile.length>0) {
				for(int i=0;i<branchFile.length;i++) {
					filenameList.add(branchFile[i].getOriginalFilename());
					String filename = filenameList.get(i);
					System.out.println("담은 파일명 : "+filename);
					originFile = new File(path+"/"+filenameList.get(i));
					try {
						branchFile[i].transferTo(originFile);
						//String filename = fileManager.renameByDate(originFile, path);
						if(filename!=null) {
							branchImage.setBranch_img(filename);
							branchImage.setBranch(branch);
							
							result2=branchImageDAO.update(branchImage);
							System.out.println("지점 이미지 수정 수행결과 : "+result2);
						}
					} catch (IllegalStateException e) {
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
		
		//지점정보 변경 처리
		result3=branchDAO.update(branch);
	
		if(result1==0) {
			throw new EditFailException("기존 이미지 삭제실패. 정보를 확인해주세요.");
		}
		
		if(result2==0) {
			throw new RegistFailException("새로운 이미지 등록실패");
		}
		
		if(result3==0) {
			throw new EditFailException("지점정보 변경 실패");
		}
	}

	//지점삭제
	public void delete(List<Integer> deleteArray, String path) throws DeleteFailException{
		List<BranchImage> imgList = new ArrayList<BranchImage>();
		for(int i=0;i<deleteArray.size();i++) {
			int branch_id = deleteArray.get(i);
			System.out.println("삭제할 branch_id는 잘 얻어지나? "+branch_id);
			imgList.addAll(branchImageDAO.selectAllByFk(branch_id));
		}
		
		int result=0;//업로드 되어있는 이미지 삭제 관련
		int result2=0;//db에서도 이미지 삭제
		int result3=0;//지점삭제
		//삭제할 이미지리스트 사이즈 확인 
		System.out.println("branchSerImpl에서 삭제할 이미지리스트 사이즈 확인 : "+imgList.size());
		for(int i=0;i<imgList.size();i++) {
			BranchImage img = imgList.get(i);
			String filename = img.getBranch_img();
			File file = new File(path+"/"+filename);
			System.out.println("branchSerImpl에서 업로드 이미지 삭제 경로 확인 : "+file);
			if(file.delete()) {
				result=1;
			}else {
				result=0;
			}
		}
		System.out.println("브랜치 서비스 임플에서 업로드 이미지 삭제여부 확인 : "+result);
		if(result==1) {
			//해당 지점 pk로 딸려있는 이미지 db에서 전부삭제
			for(int i=0;i<deleteArray.size();i++) {
				int branch_id = deleteArray.get(i);
				result2=branchImageDAO.deleteAllByFk(branch_id);
			}
		}
		System.out.println("브랜치 서비스 임플에서 db 이미지 삭제여부 확인 : "+result2);
	
		for(int i=0;i<deleteArray.size();i++) {
			int branch_id = deleteArray.get(i);
			result3=branchDAO.delete(branch_id);
		}
		System.out.println("브랜치 서비스 임플에서 지점 삭제여부 확인 : "+result3);
		
		
		if(result==0) {
			throw new DeleteFailException("업로드 이미지 삭제 실패");
		}
		if(result2==0) {
			throw new DeleteFailException("게시 이미지 삭제 실패");
		}
		if(result3==0) {
			throw new DeleteFailException("지점정보 삭제 실패");
		}
	}

	//지점 검색
	public List<Branch> search(String searchWord) {
		return branchDAO.search(searchWord);
	}
	
	//수정하려는 이미지 리스트 얻기
	public List<BranchImage> getImg(){
		List<BranchImage> branchImgList = branchImageDAO.selectAll();
		JSONArray imgArray = new JSONArray();
		for(BranchImage img:branchImgList) {
			JSONObject obj = new JSONObject();
			obj.put("branch_img", img.getBranch_img());
			obj.put("branch_id", img.getBranch().getBranch_id());
			imgArray.add(obj);
		}
		return imgArray;
	}
}
