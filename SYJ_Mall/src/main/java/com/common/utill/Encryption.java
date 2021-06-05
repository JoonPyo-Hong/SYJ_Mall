package com.common.utill;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//암호화작업을 수행
public class Encryption {
	
	//매트릭스 인덱스
	private String[] standard = {"@","&","#","!","+","*","x","$","?","X"};
	
	//매트릭스 이너 element
	private String[] innerContents = {"K","Z","W","R","1","F","<","l","c","**",
			  				  	     "9","B","6","C","L","5",".","x","&","**",
			  				  	     "Q","7","J","P","G","X",">","m","*","**",
			  				  	     "E","V","Y","3","A","N","/","v","z","**",
			  				  	     "8","O","D","H","0","2","?","'","(","**",
			  				  	     "U","4","I","S","T","M","^","n","_","]",
			  				  	     "~","`","!","@","#","$","%","b","k","[",
			  				  	     "q","i","t","d",":","=","\"","j","h","}",
			  				  	     "f",")",";","p","g","s",",","a","o","{",
			  				  	     "u","+","y","r","e","w","-","\\","|"," "};
	
	private String valueKey = "NaPleo";//암호키**masterkey
	
	//암호화키판 리턴시켜준다.
	public String[][] initialMatrix() {
		
		String[][] initialMatrix = new String[11][11];//여기에 암호들이 들어있음.
	
		for (int i = 1; i <= standard.length; i++) {
			initialMatrix[0][i] = standard[i-1]; 
			initialMatrix[i][0] = standard[i-1]; 
		}//for
		
		int shift = 0;
		
		for (int i = 1; i < 11; i++) {
			for (int j = 1; j < 11; j++) {
				initialMatrix[i][j] = innerContents[shift++];
			}
		}//for
		
		
		return initialMatrix;
		
	}//initialMatrix()
	
	
	//본격적으로 암호화 시작
	//암호화매트릭스 , 암호화할단어, 암호key값
	public String returnEncVoca(String input) {
		
		List<String> result = new ArrayList<String>();
		
		//암호변환작업 1 -> encoding
		for (int i = 0; i < input.length(); i++) {
			
			String str = input.substring(i,i+1);
			
			for (int j = 1; j < 11; j++) {
				for (int k = 1; k < 11; k++) {
					
					if (str.equals(initialMatrix()[j][k])) {
						result.add(initialMatrix()[j][0]);
						result.add(initialMatrix()[0][k]);
					}
				}
			}//for
		}//for -> 1차 암호화 완료
		
		//2차 암호화
		int keyRow = (int)Math.ceil((double)result.size() / valueKey.length());//다운캐스팅 까지 완료 -> 올림을 통하여 행을 하나 늘려주는 역할을 수행한다.
		int keyCol = valueKey.length();//key의 길이
		
		String[][] keyMatrix = new String[keyRow+1][keyCol]; //2차 암호화된 결과를 담을 그릇 왜 플러스1을 해주는거지? -> key를 타이틀로 주기 위해서
		
		int keyIndex = 0;
		
		for (int i = 0; i < keyRow + 1; i++) {
			for (int j = 0; j < keyCol; j++) {
				
				if (i == 0) { //첫번째 줄일경우
					
					keyMatrix[i][j] = valueKey.substring(j,j+1);//위의 문자 키워드를 집어넣을 것이다. -> key 값을 적겠다는 의미가 된다.
					
				} else { // 두번째 줄 이상일 경우
					
					if (keyIndex < result.size()) {
						keyMatrix[i][j] = result.get(keyIndex++);
					} else {
						keyMatrix[i][j] = "P";
					}
				}
			}
		}//for
		
		List<String> finalArr = new ArrayList<String>();//최종 암호화된 문자열을 집어넣을 곳이 된다.
		String[] keySort = valueKey.split("");//입력key를 부분부분 쪼갠다.
		Arrays.sort(keySort);//키 정렬 -> 우선순위를 배정하기 위함이다.
		
		
		for (int i = 0; i < keySort.length; i++) {
			
			String selectNum = keySort[i];//key 문자열 하나.
			
			for (int j = 0; j < keyCol; j++) {
				
				if (selectNum.equals(keyMatrix[0][j])) {
					
					
					for (int k = 1; k <= keyRow; k++) {
						
						finalArr.add(keyMatrix[k][j]);
						
					}
					
					break;
				}
			}	
		}//for
		
		String encstring = "";
		
		for (int i = 0; i < finalArr.size(); i++) {
			
			encstring += finalArr.get(i);
			
		}
		
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(encstring.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			//출력
			return hexString.toString();
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		
	}//returnEncVoca
	
}

