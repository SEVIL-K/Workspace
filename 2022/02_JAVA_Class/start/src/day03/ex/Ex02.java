package day03.ex;

import java.util.Scanner;

/*
 * 	문제 2 ]
 * 		하나의 숫자를 입력받은 후 (원의 반지름) 
 * 		그 숫자를 이용해서 원의 넓이와 둘레를 계산하고 출력하세요.
 * 		
 * 		참고 ] 
 * 			원의 넓이 : 반지름 * 반지름 * 3.14
 * 			원의 둘레 : 반지름 * 2 * 3.14
 */
public class Ex02 {
	public static void main(String[] args) {
		
		// 입력도구 준비
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("원의 반지름 : ");
		String text_ra = sc.nextLine();
		int int_ra = Integer.parseInt(text_ra);
		
		// 계산
		double cir_area = int_ra * int_ra * 3.14;
		double circum = int_ra * 2 * 3.14;
		
		// 출력
		System.out.println("원의 반지름 : " + int_ra);
		System.out.println("원의 넓이 : " + cir_area);
		System.out.println("원의 둘레 : " + circum);
		
		
	}
}
