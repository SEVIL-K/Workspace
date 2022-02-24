package day03.ex;

/*
 * 문제 03 ]
 * 		84232원을 지불하려고 한다.
 * 		우리나라 화폐단위로 이 금액을 지불하려면
 * 		각 단위가 몇개 씩 필요한지 계산해서 출력하시오.
 * 
 * 		화폐 단위 ]
 * 			50000
 * 			10000
 * 			5000
 * 			1000
 * 			500
 * 			100
 * 			50
 * 			10
 * 			1
 * 
 * 
 */

public class Ex03 {
	public static void main(String[] args) {
		// 금액 변수 설정
		int cash = 84232;
		System.out.println("금액 : " + cash);
		
		int tmp = cash;
		
		// 권종 별 갯수 계산
		int c50t = tmp / 50000;
		tmp = tmp - c50t * 50000;
		
		int c10t = tmp / 10000;
		tmp = tmp - c10t * 10000;
		
		int c5t = tmp / 5000;
		tmp = tmp - c5t * 5000;
		
		int c1t = tmp / 1000;
		tmp = tmp - c1t * 1000;
		
		int c5h = tmp / 500;
		tmp = tmp - c5h * 500;
		
		int c1h = tmp / 100;
		tmp = tmp - c1h * 100;
		
		int c50 = tmp / 50;
		tmp = tmp - c50 * 50;
		
		int c10 = tmp / 10;
		tmp = tmp - c10 * 10;
		
		// 출력
		System.out.println("5만원권 : " + c50t + " 장");
		System.out.println("1만원권 : " + c10t + " 장");
		System.out.println("5천원권 : " + c5t + " 장");
		System.out.println("1천원권 : " + c1t + " 장");
		System.out.println("500원 : " + c5h + " 개");
		System.out.println("100원 : " + c1h + " 개");
		System.out.println("50원 : " + c50 + " 개");
		System.out.println("10원 : " + c10 + " 개");
		System.out.println("1원 : " + tmp + " 개");
	}
}
