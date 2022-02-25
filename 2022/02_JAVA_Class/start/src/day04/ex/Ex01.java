package day04.ex;


/*
 * 	문제 1 ]
 * 		1 ~ 25 숫자 3개를 랜덤하게 발생시켜서 그 수들 중에 가장 큰 수만 출력하는 프로그램을 작성하세요.
 * 
 * 		단, 3항연산자를 사용해서 처리하세요.
 */
public class Ex01 {
	public static void main(String[] args) {
		
		// 1 ~ 25 랜덤 숫자 만들기
		int no1 = (int) (Math.random() * (25 - 1 + 1) + 1);
		int no2 = (int) (Math.random() * (25 - 1 + 1) + 1);
		int no3 = (int) (Math.random() * (25 - 1 + 1) + 1);
		
		int biggest = (no1 > no2) && (no1 > no3) ? no1 : (no2 > no3? no2 : no3);
		
		System.out.println("랜덤한 숫자 " + no1 + ", " + no2 + ", " + no3 + " 중에서 가장 큰 숫자는 " + biggest + " 입니다.");
	}
}
