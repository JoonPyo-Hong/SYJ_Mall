package com.common.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

/**
 * QR 코드 생성 관련 클래스
 * @author shin
 *
 */
public class QRCodeGenerate {
	
	private String siteUrl;
	private int qrcodeColor;
	private int backgroundColor;
	private int qrWidth;
	private int qrHeight;
	private String qrName;
	

	/**
	 * 생성자1
	 * @param imgUrl
	 * @param siteUrl
	 * @param qrName
	 */
	public QRCodeGenerate(String siteUrl,String qrName) {
		this.siteUrl = siteUrl;
		this.qrName = qrName;
		this.qrcodeColor = 0xFF2e4e96;
		this.backgroundColor = 0xFFFFFFFF;
		this.qrWidth = 200;
		this.qrHeight = 200;
		
	}
	
	/**
	 * 생성자2
	 * @param imgUrl
	 * @param siteUrl
	 * @param qrcodeColor
	 * @param backgroundColor
	 * @param qrName
	 */
	public QRCodeGenerate(String siteUrl,int qrcodeColor,int backgroundColor,String qrName) {
		this.siteUrl = siteUrl;
		this.qrName = qrName;
		this.qrcodeColor = qrcodeColor;
		this.backgroundColor = backgroundColor;
		this.qrWidth = 200;
		this.qrHeight = 200;
	}
	
	/**
	 * 생성자3
	 * @param imgUrl
	 * @param siteUrl
	 * @param qrcodeColor
	 * @param backgroundColor
	 * @param qrWidth
	 * @param qrHeight
	 * @param qrName
	 */
	public QRCodeGenerate(String siteUrl,int qrcodeColor,int backgroundColor,int qrWidth,int qrHeight,String qrName) {
		this.siteUrl = siteUrl;
		this.qrName = qrName;
		this.qrcodeColor = qrcodeColor;
		this.backgroundColor = backgroundColor;
		this.qrWidth = qrWidth;
		this.qrHeight = qrHeight;
	}
	
	
	/**
	 * 큐알코드 파일에 써주기
	 * @throws Exception
	 */
	public void writeQrCode(HttpServletRequest request) throws Exception{
	
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\QrImage\\"; 
		
		System.out.println(savePath);
		
		String codeurl = new String(this.siteUrl.getBytes("UTF-8"), "ISO-8859-1"); 
		
		QRCodeWriter qrCodeWriter = new QRCodeWriter();  
	    BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,this.qrWidth, this.qrHeight);
	  
	    MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(this.qrcodeColor,this.backgroundColor); 
	    BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig); 
	    
	    //파일 이름에 저장한 날짜를 포함해주기 위해 date생성
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	    String fileName = sdf.format(new Date()) + this.qrName;
	    
	    //파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
	    File temp =  new File(savePath + fileName+".png"); 
	    
	    System.out.println(temp);
	    
	    // ImageIO를 사용하여 파일쓰기 
	    ImageIO.write(bufferedImage, "png",temp); 
	    
		
	}
	
	
	
}
