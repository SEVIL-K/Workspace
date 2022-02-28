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
		
		// 보너스 -100 ~ 100 사이의 정수를 랜덤하게 발생
		// int bno = (int) (Math.random() * (100 - (-100) + 1) + (-100));
		
		
		// 비교하기
		int biggest = (no1 > no2) && (no1 > no3) ? no1 : (no2 > no3 ? no2 : no3);
		int middle = no1 > no2 ? (no1 > no3 ? (no2 > no3 ? no2 : no3) : no1) : no2 > no3 ? (no1 > no3 ? no1 : no3) : no2;
		int smallest = (no2 > no1) && (no3 > no1) ? no1 : (no2 > no3 ? no2 : no3);
		
		// 출력
		System.out.println("랜덤한 숫자 " + no1 + ", " + no2 + ", " + no3 + " 중에서 가장 큰 숫자는 " + biggest + " 입니다.");
		System.out.println("랜덤한 숫자 3개의 내림차순은 " + biggest + ", " + middle + ", " + smallest + "입니다.");
		
		/* 
		 * 참고 ]
		 * 		문자열을 표현할 때 문자열 안에 " 기호를 출력하는 방법
		 * 			==> \"		이때 사용한 \ 를 이스케이프 문자라고 부른다.
		 * 			
		 * 			많이 사용하는 문자들
		 * 			\"	문자열 내 " 표현
		 * 			\n	줄바꿈
		 * 			\r	캐리지 리턴 어쨌든 줄바꿈
		 * 			\t	tab 표현
		 * 			\b	backspace
		 */
	}
}
