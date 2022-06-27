package com.test.SYJ_Mall.crawling;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	        
	        
	        //아파트명 검색
	        driver.findElement(By.className("css-wyfpkg")).click();
	        driver.findElement(By.className("keyword")).sendKeys("본동 유원강변");
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
	        
	        WebElement iframe = driver.findElement(By.className("css-1poz24i"));
	        
	        WheelInput.ScrollOrigin scrollOrigins = WheelInput.ScrollOrigin.fromElement(iframe);
	        	
	        new Actions(driver)
	            .scrollFromOrigin(scrollOrigins, 0, 2000)
	            .perform();

	        
	        //로그인하기 클릭
	        ///driver.findElement(By.className("css-wri049")).click();
	        driver.findElement(By.className("css-wri049")).sendKeys(Keys.ENTER);
	        Thread.sleep(1000);
	        
	        //카카오로 로그인 진행
	        driver.findElement(By.className("css-1esm3dl")).click();
	        
	        // 탭 목록 가져오기
	        List<String> tabs = new ArrayList<String>(driver.getWindowHandles());
	        
	        driver.switchTo().window(tabs.get(1));
	        
	        //카카오 로그인 진행 id_email_2_label
	        driver.findElement(By.id("id_email_2")).sendKeys("");
	        driver.findElement(By.id("id_password_3")).sendKeys("");
	        
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
	       
	        
	        WheelInput.ScrollOrigin scrollOrigin = WheelInput.ScrollOrigin.fromElement(iframe);
	        
	        for (int i = 0; i < 50; i++) {
	        	new Actions(driver)
	            .scrollFromOrigin(scrollOrigin, 0, 2000)
	            .perform();
	        }
	        
	        
	        //모든 댓글 더보기 누르기
	        List<WebElement> addComments = driver.findElements(By.className("css-twiiik"));
	        
	        System.out.println(addComments.size());
	        
	        Thread.sleep(5000);
	        
	        
	        for (WebElement we : addComments) {
	        	we.sendKeys(Keys.ENTER);
	        	//Thread.sleep(100);
	        }
	        
	        
	        //모든 댓글 내용 출력 css-9uvvzn
	        List<WebElement> comments = driver.findElements(By.className("css-9uvvzn"));
	        
	        for (WebElement we : comments) {
	        	System.out.println(we.getText());
	        }
	        

	      
	        
			return 0;
		} catch(Exception e) {
			e.printStackTrace();

			
			System.out.println("error");
			
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
}
