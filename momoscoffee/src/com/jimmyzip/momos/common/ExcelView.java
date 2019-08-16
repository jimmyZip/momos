package com.jimmyzip.momos.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jimmyzip.momos.model.domain.branch.Branch;
import com.jimmyzip.momos.model.domain.product.Product;
import com.jimmyzip.momos.model.domain.product.ProductImage;
import com.jimmyzip.momos.model.domain.branch.BranchImage;

public class ExcelView extends AbstractExcelPOIView{

	@SuppressWarnings("unchecked")
	

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("엑셀 만들겠다고 컨트롤러에서 넘어오는가 확인");
		String target = model.get("target").toString();
		
		//target에 따라서 엑셀 문서 작성을 분기한다.
		if(target.equals("product")) {
			//Object로 넘어온 값을 각 Model에 맞게 형변환
			List<Product> productList = (List<Product>)model.get("excelList");
			//제대로 excelList받았나 확인
			System.out.println("ExcelView.java에서 productList 제대로 받았나 확인 : "+productList.size());
			
			//sheet 생성
			Sheet sheet = workbook.createSheet(target);
			Row row = null;
			int rowCount = 0;
			int cellCount = 0;
			
			//제목 Cell생성
			row = sheet.createRow(rowCount++);
			
			row.createCell(cellCount++).setCellValue("product pk");
			row.createCell(cellCount++).setCellValue("subcategory");
			row.createCell(cellCount++).setCellValue("name");
			row.createCell(cellCount++).setCellValue("name(eng)");
			row.createCell(cellCount++).setCellValue("price");
			row.createCell(cellCount++).setCellValue("description");
			row.createCell(cellCount++).setCellValue("stock");		
			row.createCell(cellCount++).setCellValue("img");		
			
			//데이터 Cell생성
			for(Product p : productList) {
				row = sheet.createRow(rowCount++);
				cellCount=0;
				row.createCell(cellCount++).setCellValue(p.getProduct_id());
				row.createCell(cellCount++).setCellValue(p.getSubcategory().getSubcate_name());
				row.createCell(cellCount++).setCellValue(p.getProd_name_kor());
				row.createCell(cellCount++).setCellValue(p.getProd_name_eng());
				row.createCell(cellCount++).setCellValue(p.getPrice());
				row.createCell(cellCount++).setCellValue(p.getProd_desc());
				row.createCell(cellCount++).setCellValue(p.getStock());
				row.createCell(cellCount++).setCellValue(p.getProductImage().get(0).getProd_img());				
			}
		}
		
		
		if(target.equals("branch")) {
			//Object로 넘어온 값을 각 Model에 맞게 형변환
			List<Branch> branchList = (List<Branch>)model.get("excelList");
			//제대로 excelList받았나 확인
			System.out.println("ExcelView.java에서 branchList 제대로 받았나 확인 : "+branchList.size());
			
			//sheet 생성
			Sheet sheet = workbook.createSheet(target);
			Row row = null;
			int rowCount = 0;
			int cellCount = 0;
			
			//제목 Cell생성
			row = sheet.createRow(rowCount++);
			
			row.createCell(cellCount++).setCellValue("branch pk");
			row.createCell(cellCount++).setCellValue("지점명");
			row.createCell(cellCount++).setCellValue("지점주소");
			row.createCell(cellCount++).setCellValue("longitude");
			row.createCell(cellCount++).setCellValue("latitude");
			row.createCell(cellCount++).setCellValue("슬로건메시지");
			row.createCell(cellCount++).setCellValue("전화번호");
			row.createCell(cellCount++).setCellValue("오픈시간");
			row.createCell(cellCount++).setCellValue("닫는시간");
			row.createCell(cellCount++).setCellValue("마지막주문시간");
			row.createCell(cellCount++).setCellValue("img");
			
			//데이터 Cell생성
			for(Branch b:branchList) {
				row = sheet.createRow(rowCount++);
				cellCount=0;
				row.createCell(cellCount++).setCellValue(b.getBranch_id());
				row.createCell(cellCount++).setCellValue(b.getBranch_name());
				row.createCell(cellCount++).setCellValue(b.getBranch_addr());
				row.createCell(cellCount++).setCellValue(b.getLongi());
				row.createCell(cellCount++).setCellValue(b.getLati());
				row.createCell(cellCount++).setCellValue(b.getMessage());
				row.createCell(cellCount++).setCellValue(b.getBranch_tel());
				row.createCell(cellCount++).setCellValue(b.getOpen_h());	
				row.createCell(cellCount++).setCellValue(b.getClose_h());	
				row.createCell(cellCount++).setCellValue(b.getLast_order());	
				row.createCell(cellCount++).setCellValue(b.getBranchImage().get(0).getBranch_img());	
			}
		}
		
		
	}

	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}
}
