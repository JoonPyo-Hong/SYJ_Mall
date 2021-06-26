package com.common.utill;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/**
 * 비밀번호 암호화작업
 * @author shin
 *
 */
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
	
	private final String VALUEKEY = "NaPleo";//암호키**masterkey
	
	/**
	 * 암호화키판 리턴
	 * @return	암호화 키판
	 */
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
	
	/**
	 * 복호화 로직
	 * @param encInput
	 * @return
	 */
	public String returnDcyVoca(String encInput) {
		
		String[] inputList = encInput.split("");//복호화 한 값이 들어가게 된다.
		
		String[] decKeySplitArrOrigin = VALUEKEY.split("");//origin -> 정렬안해준 배열.
		String[] decKeySplitArr = VALUEKEY.split("");//comparison -> 정렬해주는 배열.
		
		Arrays.sort(decKeySplitArr);//정렬 -> ex) s e c u r -> c e r s u 로 변환
		
		int stepOneRow = inputList.length / VALUEKEY.length();// 2차 암호화때 도출된 매트릭스 행의 개수
		int stepOneCol = VALUEKEY.length();// 2차 암호화때 도출된 매트릭스 열의 개수
		
		String[][] stepOneMatrix = new String[stepOneRow][stepOneCol];
		
		int inputListIndex = 0;//inputList 의 index
		
		for (int i = 0; i < decKeySplitArr.length; i++) {
			
			String selectVoca = decKeySplitArr[i];//선택된 하나의 단어 -> 처음은 c일것이다.
			
			for (int j = 0; j < decKeySplitArrOrigin.length; j++) {//원조의 단어 split 한것과 비교를 해준다.
				
				if (selectVoca.equals(decKeySplitArrOrigin[j])) { // c e r s u -> s e c u r
					
					for (int k = 0; k < stepOneRow; k++) {
						
						stepOneMatrix[k][j] = inputList[inputListIndex++];
					}
					
					break;
				}
			}
		}//for
		
		String[] finalArr = new String[stepOneRow*stepOneCol];//마지막 결과배열.
		int finalArrIndex = 0;
		
		for (int i = 0; i < stepOneRow; i++) {
			for (int j = 0; j < stepOneCol; j++) {
				finalArr[finalArrIndex++] = stepOneMatrix[i][j];
			}
		}
		
		String answerVal = "";//최종 복호화 답
		int finalIndex = 0;
		int swich = 1;
		String finalRow = "";
		String finalCol = "";
		
	
		
		//System.out.println(finalArr.length);
		
		while(finalIndex < finalArr.length) {
			
			if (finalArr[finalIndex].equals("P")) {
				break;
			} else {
				//System.out.println(finalIndex);
				swich *= -1;
				
				if (swich == 1) {
					finalCol = finalArr[finalIndex++];
					int row = 0;
					int col = 0;
					
					//여기서부터 탐색에 들어가야 한다. -> 나중에 업글을 시켜보자. -> 성능 튜닝.
					for (int i = 0; i < standard.length; i++) {
						if (finalRow.equals(standard[i])) {
							row = i+1;
							break;
						}
					}
					
					for (int i = 0; i < standard.length; i++) {
						if (finalCol.equals(standard[i])) {
							col = i+1;
							break;
						}
					}
					answerVal += initialMatrix()[row][col];
					
				} else {
					finalRow = finalArr[finalIndex++];
				}
			}
		}//while		
		
		return answerVal;
		
	}
	
	
	/**
	 * 암호화로직 - 회원 비밀번호에 쓰일 로직 : 복호화 불가.
	 * @param input	암호화 되지 않은 비밀번호	
	 * @return		암호화된 비밀번호
	 */
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
		int keyRow = (int)Math.ceil((double)result.size() / VALUEKEY.length());//다운캐스팅 까지 완료 -> 올림을 통하여 행을 하나 늘려주는 역할을 수행한다.
		int keyCol = VALUEKEY.length();//key의 길이
		
		String[][] keyMatrix = new String[keyRow+1][keyCol];//key를 타이틀로 주기 위해서
		
		int keyIndex = 0;
		
		for (int i = 0; i < keyRow + 1; i++) {
			for (int j = 0; j < keyCol; j++) {
				
				if (i == 0) { //첫번째 줄일경우
					
					keyMatrix[i][j] = VALUEKEY.substring(j,j+1);//위의 문자 키워드를 집어넣을 것이다. -> key 값을 적겠다는 의미가 된다.
					
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
		String[] keySort = VALUEKEY.split("");//입력key를 부분부분 쪼갠다.
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

