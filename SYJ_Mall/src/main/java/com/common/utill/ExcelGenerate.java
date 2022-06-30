package com.common.utill;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.test.SYJ_Mall.crawling.CrawlingThreeDTO;

/**
 * 엑셀 생성 클래스
 * @author shin
 *
 */
public class ExcelGenerate {
	
	private String title;//제목
	private String savePath;//저장경로
	
	private XSSFWorkbook xssfWb = null; 
	private XSSFSheet xssfSheet = null; 
	private XSSFRow xssfRow = null; 
	private XSSFCell xssfCell = null;
	
	/**
	 * 엑셀시트 생성1
	 * @param title
	 * @param colSize
	 * @param savePath
	 */
	public ExcelGenerate (String title, String savePath) {
		this.title = title;
		this.savePath = savePath;
	}
	
	
	public int setExcelThree(CrawlingThreeDTO[] cArr) throws Exception {
		
		int rowNo = 0;
		
		xssfWb = new XSSFWorkbook(); //XSSFWorkbook 객체 생성
		xssfSheet = xssfWb.createSheet("워크 시트1"); // 워크시트 이름 설정
		
		// 폰트 스타일
		XSSFFont font = xssfWb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL); // 폰트 스타일
		font.setFontHeightInPoints((short)20); // 폰트 크기
		font.setBold(true); // Bold 설정
		
		//테이블 셀 스타일
		CellStyle cellStyle = xssfWb.createCellStyle();
		xssfSheet.setColumnWidth(0, (xssfSheet.getColumnWidth(0))+(short)2048); // 0번째 컬럼 넓이 조절
		
		cellStyle.setFont(font); // cellStyle에 font를 적용
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 정렬
		
		xssfRow = xssfSheet.createRow(rowNo++); // 행 객체 추가
		xssfCell = xssfRow.createCell((short) 0); // 추가한 행에 셀 객체 추가
		xssfCell.setCellStyle(cellStyle); // 셀에 스타일 지정
		xssfCell.setCellValue(this.title); // 데이터 입력
		
		xssfSheet.createRow(rowNo++);
		xssfRow = xssfSheet.createRow(rowNo++);  // 빈행 추가
		
		//테이블 스타일 설정
		CellStyle tableCellStyle = xssfWb.createCellStyle();
		tableCellStyle.setBorderTop((short) 5);    // 테두리 위쪽
		tableCellStyle.setBorderBottom((short) 5); // 테두리 아래쪽
		tableCellStyle.setBorderLeft((short) 5);   // 테두리 왼쪽
		tableCellStyle.setBorderRight((short) 5);  // 테두리 오른쪽
		
		xssfRow = xssfSheet.createRow(rowNo++);
		xssfCell = xssfRow.createCell((short) 0);
		xssfCell.setCellStyle(tableCellStyle);
		xssfCell.setCellValue("아이디");
		xssfCell = xssfRow.createCell((short) 1);
		xssfCell.setCellStyle(tableCellStyle);
		xssfCell.setCellValue("시기");
		xssfCell = xssfRow.createCell((short) 2);
		xssfCell.setCellStyle(tableCellStyle);
		xssfCell.setCellValue("내용");
		
		
		for (int i = 0; i < cArr.length; i++) {
			xssfRow = xssfSheet.createRow(rowNo++);
			xssfCell = xssfRow.createCell((short) 0);
			xssfCell.setCellStyle(tableCellStyle);
			xssfCell.setCellValue(cArr[i].getStr2());
			xssfCell = xssfRow.createCell((short) 1);
			xssfCell.setCellStyle(tableCellStyle);
			xssfCell.setCellValue(cArr[i].getStr1());
			xssfCell = xssfRow.createCell((short) 2);
			xssfCell.setCellStyle(tableCellStyle);
			xssfCell.setCellValue(cArr[i].getStr3());
		}
		
		String localFile = savePath;
		
		File file = new File(localFile);
		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		xssfWb.write(fos);

		if (fos != null) fos.close();
		
		return 1;
		
	}
	
}
