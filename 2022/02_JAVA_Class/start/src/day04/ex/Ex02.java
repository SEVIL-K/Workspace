package day04.ex;

import java.util.Scanner;

/*
	 문제 2 ]
	 	문자를 임의로 랜덤하게 입력한 후
	 	그 문자가 대문자이면 소문자로
	 	소문자이면 대문자로 변환하고 
	 	만약 특수문자이면 그문자 그대로 
	 	출력하는 프로그램을 작성하세요.
 */
public class Ex02 {
	public static void main(String[] args) {
		
		// 문자 입력
		System.out.print("문자 입력 : ");
		Scanner sc = new Scanner(System.in);
		
		
		// 입력받은 문자열 저장
		String str = sc.nextLine();
		sc.close();
		
		// 입력받은 문자열의 문자 추출
		char ch = str.charAt(0);
		
		// 대소문자 판별
		
		// 아스키코드 이용
		char result1 = (ch < 'A') ? ch : (ch <= 'Z') ? (char)(ch + ('a' - 'A')) : (ch < 'a') ? ch : (ch <= 'z') ? (char)(ch - ('a' - 'A')) : ch;
	
	/*
		특수문자 - A - Z - 특수문자 - a ~ z - 특수문자
	 */
		System.out.println(result1);

		
		// 함수 + 3항연산자 이용
		boolean t1 = true;
		char result = Character.isUpperCase(ch) == t1 ? (char) (ch + 32) : Character.isLowerCase(ch) == t1 ? (char) (ch - 32) : ch;
		
		System.out.println(result);
		
		
		
		// -===========================================================================================
		
		// if 로 변경
		
		char if_result = '0';
		
		if ((ch >= 'A') & (ch <= 'Z')) {
			if_result = (char) (ch + ('a' - 'A'));
		}else if ((ch >= 'a') & (ch <= 'z')) {
			if_result = (char) (ch - ('a' - 'A'));
		}else if_result = ch;
		
		System.out.println(if_result);
		
	}
}