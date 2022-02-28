package day05.ex;

import java.util.Scanner;

/*
 * 	문제 3 ]
 * 		문자열을 입력받아서
 * 		문자열을 한 글자씩 추출해서 출력하세요.
 * 
 * 		참고 ]
 * 			문자열의 길이를 알아내는 방법
 * 				int 변수 = 문자열.lenght();
 */
public class Ex03 {
	public static void main(String[] args) {
		
		// 문자열 입력받기
		System.out.println("문자열을 입력하세요. : ");
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		sc.close();
		
		for (int i = 0; i < str.length(); i++) {
			System.out.println(str.charAt(i));
		}
		
		
	}
}
