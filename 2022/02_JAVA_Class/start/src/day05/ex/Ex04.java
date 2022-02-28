package day05.ex;

import java.util.Scanner;

/*
문제 4 ]
	전기요금을 계산해주는 프로그램을 작성하세요.
	
	전기요금표
		
					코드		기본요금		사용요금
		가정용		1			3800			245
		산업용		2			2400			157
		교육용		3			2900			169
		상업용		4			3200			174
		
		
	전기요금은 
		기본요금 + 사용량 * 사용요금
		
	사용자 코드와 사용량을 입력하면
	전기요금을 계산해서 출력해주는 프로그램을 작성하세요.
*/

public class Ex04 {
	public static void main(String[] args) {
		// 입력받을 값 구하기
		
		System.out.println("사용자 코드를 입력하세요\n 1. 가정용\n 2. 산업용\n 3. 교육용\n 4. 상업용 ");
		Scanner sc_code = new Scanner(System.in);
		int code = sc_code.nextInt();
		
		System.out.println("사용량을 입력하세요 : ");
		Scanner sc_amo = new Scanner(System.in);
		int amo = sc_amo.nextInt();
		
		sc_code.close();
		sc_amo.close();
		
		switch (code) {
		case 1:
			System.out.println("전기요금은 " + (3800 + 245 * amo) + "원 입니다");
			break;
		case 2:
			System.out.println("전기요금은 " + (2400 + 157 * amo) + "원 입니다");
			break;
		case 3:
			System.out.println("전기요금은 " + (2900 + 169 * amo) + "원 입니다");
			break;
		case 4:
			System.out.println("전기요금은 " + (3200 + 174 * amo) + "원 입니다");
			break;
		default:
			break;
		}
		
	}
}
