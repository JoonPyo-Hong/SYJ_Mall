package com.test.SYJ_Mall.crawling;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.StringFormatClass;

@Service
public class CrawlerService implements ICrawlerService {
	@Autowired
	private ICrawlerDAO dao;
	
	//크롤링 서비스 구현
	@Override
	public int goCrawling(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf) {
		try {
			
			//System.out.println(System.getProperty("user.dir"));
			
			//Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/chromedriver.exe");
	        
			Path path = Paths.get("C:\\Users\\신승환\\Desktop\\java\\SYJ_Mall\\SYJ_Mall\\src\\main\\webapp\\resources\\etc\\chromedriver2.exe");
			
			
			//options = Options()
			//options.binary_location= 'C:/Program Files/Google/Chrome/Application/chrome.exe'

			//driver = webdriver.Chrome('path/chromedriver_win32/chromedriver.exe', chrome_options = options)

			
			// WebDriver 경로 설정
			System.setProperty("webdriver.chrome.driver", path.toString());
			
			// WebDriver 옵션 설정
	        ChromeOptions options = new ChromeOptions();
	        options.addArguments("--start-maximized");            // 전체화면으로 실행
	        options.addArguments("--disable-popup-blocking");    // 팝업 무시
	        options.addArguments("--disable-default-apps");     // 기본앱 사용안함
	        
	        // WebDriver 객체 생성
	        ChromeDriver driver = new ChromeDriver(options);
	        
	        // 빈 탭 생성
	        driver.executeScript("window.open('about:blank','_blank');");
			
	        // 탭 목록 가져오기
	        List<String> tabs = new ArrayList<String>(driver.getWindowHandles());
	        
	        // 첫번째 탭으로 전환
	        driver.switchTo().window(tabs.get(0));
	        driver.get("https://www.naver.com");
	        
	        
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
			ea.basicErrorException(request, e);
			
			System.out.println("error");
			
			return -1;
		}
	}
}
