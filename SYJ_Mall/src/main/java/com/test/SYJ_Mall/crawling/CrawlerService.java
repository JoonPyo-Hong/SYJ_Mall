package com.test.SYJ_Mall.crawling;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.interactions.WheelInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AdminKakaoDTO;
import com.common.utill.CommonDAO;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.ExcelGenerate;
import com.common.utill.StringFormatClass;

@Service
public class CrawlerService implements ICrawlerService {
	@Autowired
	private ICrawlerDAO dao;
	
	//크롤링 서비스 구현
	@Override
	public int goCrawling(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf,Encryption enc, CommonDAO cdao) {
		try {

			Path path = Paths.get(System.getProperty("user.dir"), "chromedriver.exe");

			
			// WebDriver 경로 설정
			System.setProperty("webdriver.chrome.driver", path.toString());
			
			// WebDriver 옵션 설정
	        ChromeOptions options = new ChromeOptions();
	        options.addArguments("--start-maximized");            	// 전체화면으로 실행
	        options.addArguments("--disable-popup-blocking");    	// 팝업 무시
	        options.addArguments("--disable-default-apps");     	// 기본앱 사용안함
	        
	        // WebDriver 객체 생성
	        ChromeDriver driver = new ChromeDriver(options);
	        
	        // 빈 탭 생성
	        //driver.executeScript("window.open('about:blank','_blank');");
			
	        // 탭 목록 가져오기
	        //List<String> tabs = new ArrayList<String>(driver.getWindowHandles());
	        
	        // 첫번째 탭으로 전환
	        //driver.switchTo().window(tabs.get(0));
	        //driver.get("https://hogangnono.com/apt/23D34/0/2/review");
	        driver.get("https://hogangnono.com");
	        
	        Thread.sleep(2000);
	        
	        //아파트명 검색
	        driver.findElement(By.className("css-ouxt45")).click();
	        driver.findElement(By.className("keyword")).sendKeys("");
	        driver.findElement(By.className("btn-search")).click();
	        
	        Thread.sleep(1000);
	        //css-wri049
	        //목록중에서 선택 -> 첫번째 목록을 선택해줌
	        List<WebElement> elements = driver.findElements(By.className("apt"));
	        elements.get(0).click();
	        
	        Thread.sleep(3000);
	        
	        //댓글 클릭
	        driver.findElement(By.className("comment")).click();
	        
	        Thread.sleep(3000);
	        
	        WebElement iframe = driver.findElement(By.className("css-vx1isg"));
	        
	        WheelInput.ScrollOrigin scrollOrigins = WheelInput.ScrollOrigin.fromElement(iframe);
	        	
	        new Actions(driver)
	            .scrollFromOrigin(scrollOrigins, 0, 2000)
	            .perform();

	        
	        //로그인하기 클릭
	        driver.findElement(By.className("css-1gh9m71")).sendKeys(Keys.ENTER);
	        Thread.sleep(1000);
	        
	        //카카오로 로그인 진행
	        driver.findElement(By.className("css-1yil1p4")).click();
	        
	        // 탭 목록 가져오기
	        List<String> tabs = new ArrayList<String>(driver.getWindowHandles());
	        
	        //인터넷 창 변환
	        driver.switchTo().window(tabs.get(1));
	        
	        //어드민 카카오 아이디 비밀번호 가져오기
	        AdminKakaoDTO adto = cdao.getAdminKaKaosInfo(1);
	        String dcyPw = enc.returnDcyVoca(adto.getKakaoPw(),adto.getMasterKey());
	        
	        //카카오 로그인 진행 id_email_2_label
	        driver.findElement(By.id("id_email_2")).sendKeys(adto.getKakaoId());
	        driver.findElement(By.id("id_password_3")).sendKeys(dcyPw);
	        
	        //btn_g
	        List<WebElement> btnsEles = driver.findElements(By.className("btn_g"));
	        
	        for (WebElement el : btnsEles) {
	        	if (el.getText().equals("로그인")) {
	        		el.click();
	        		break;
	        	}
	        }
	        
	        driver.switchTo().window(tabs.get(0));
	        
	        //사용자 로그인 응답대기 -> 일단 10초로 걸어둠
	        Thread.sleep(10000);
	        
	        System.out.println("시작!");
	        
	        Thread.sleep(5000);
	        
	        iframe = driver.findElement(By.className("css-vx1isg"));
	        
	        WheelInput.ScrollOrigin scrollOrigin = WheelInput.ScrollOrigin.fromElement(iframe);
	        
	        for (int i = 0; i < 200; i++) {
	        	new Actions(driver)
	            .scrollFromOrigin(scrollOrigin, 0, 2000)
	            .perform();
	        }
	        
	        
	        Thread.sleep(5000);
	        
	        List<WebElement> addComments = driver.findElements(By.className("css-1pwash7"));
	        
	        System.out.println(addComments.size());
	        
	        Thread.sleep(5000);
	        
	        //모든 댓글 더보기 누르기
	        for (WebElement we : addComments) {
	        	we.sendKeys(Keys.ENTER);
	        }
	        
	        
	        //n년전
	        //css-qvx8ct
	        
	        //가짜 아이디
	        //css-1yc0y8n
	        
	        //진짜 아이디
	        //css-jroi9m
	        
	        
	        //모든 댓글 내용 출력 css-9uvvzn
	        List<WebElement> years = driver.findElements(By.className("css-11sbhjp"));
	        List<WebElement> fakeIds = driver.findElements(By.className("css-7uflit"));
	        List<WebElement> realIds = driver.findElements(By.className("css-156l0bp"));
	        List<WebElement> comments = driver.findElements(By.className("css-17aohek"));
	        
	        System.out.println("years : " + years.size());
	        System.out.println("fakeIds : " + fakeIds.size());
	        System.out.println("realIds : " + realIds.size());
	        System.out.println("comments : " + comments.size());
	        
	        
	        CrawlingThreeDTO[] cArr = new CrawlingThreeDTO[comments.size()];
	        
	        for (int i = 0; i < cArr.length; i++) {
	        	String innerYear = years.get(i).getText();
	        	String innerFakeIds = fakeIds.get(i).getText();
	        	String innerRealIds = realIds.get(i).getText();
	        	String innerComments = comments.get(i).getText();
	        	
	        	int index = innerYear.indexOf("전");
	        	CrawlingThreeDTO dto = new CrawlingThreeDTO();
	        	dto.setStr1(innerYear.substring(0,index+1));
	        	dto.setStr2(innerFakeIds + " (" + innerRealIds + ") ");
	        	dto.setStr3(innerComments);
	        	
	        	cArr[i] = dto;
	        }
	        
	        Path paths = Paths.get(System.getProperty("user.dir"), "excelFile/test.xlsx");
			String localFiles = paths.toString();
	        
	        ExcelGenerate excel = new ExcelGenerate("아파트 이름",localFiles);

			return excel.setExcelThree(cArr);
			
		} catch(Exception e) {
			e.printStackTrace();

			return -1;
		}
	}
	
	
	//테스트
	@Override
	public int goTesting(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf) {
		
		try {
			
			
			Path path = Paths.get("C:\\Users\\신승환\\Desktop\\java\\SYJ_Mall\\SYJ_Mall\\src\\main\\webapp\\resources\\etc\\chromedriver2.exe");
			
			// WebDriver 경로 설정
			System.setProperty("webdriver.chrome.driver", path.toString());
			
			// WebDriver 옵션 설정
	        ChromeOptions options = new ChromeOptions();
	        options.addArguments("--start-maximized");            	// 전체화면으로 실행
	        options.addArguments("--disable-popup-blocking");    	// 팝업 무시
	        options.addArguments("--disable-default-apps");     	// 기본앱 사용안함
	        
	        // WebDriver 객체 생성
	        ChromeDriver driver = new ChromeDriver(options);
	    	        
	        driver.get("https://www.naver.com");
	        JavascriptExecutor js = (JavascriptExecutor) driver;
	        
	        Thread.sleep(1000);
	        
	        js.executeScript("window.scrollTo(0, document.getElementsByClassName('').scrollHeight);");
	        
	        
	        
	        return 1;
		} catch(Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}

	//엑셀테스트
	@Override
	public int getExcelLogic(HttpServletRequest request, HttpServletResponse response) {
		try {
			
		
			XSSFWorkbook xssfWb = null; 
			XSSFSheet xssfSheet = null; 
			XSSFRow xssfRow = null; 
			XSSFCell xssfCell = null;

			int rowNo = 0; // 행의 갯수 
			
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

			//셀병합
			//xssfSheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 2)); //첫행, 마지막행, 첫열, 마지막열 병합
			
			// 타이틀 생성
			xssfRow = xssfSheet.createRow(rowNo++); // 행 객체 추가
			xssfCell = xssfRow.createCell((short) 0); // 추가한 행에 셀 객체 추가
			xssfCell.setCellStyle(cellStyle); // 셀에 스타일 지정
			xssfCell.setCellValue("호갱노노 아파트이름 리뷰"); // 데이터 입력
			
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
			
//			xssfCell = xssfRow.createCell((short) 3);
//			xssfCell.setCellStyle(tableCellStyle);
//			xssfCell.setCellValue("셀4");
//			xssfCell = xssfRow.createCell((short) 4);
//			xssfCell.setCellStyle(tableCellStyle);
			
			Path path = Paths.get(System.getProperty("user.dir"), "excelFile/test.xlsx");
			
			String localFile = path.toString();
			
			File file = new File(localFile);
			FileOutputStream fos = null;
			fos = new FileOutputStream(file);
			xssfWb.write(fos);
	
			if (fos != null) fos.close();
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}
}
