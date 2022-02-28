package day05;

import java.util.Scanner;

/*
 * 	나이를 입력받아서
 * 		유년기
 * 		10대
 * 		20대
 * 		30대
 * 		40대
 * 		장년층 으로 구분해서 출력하세요.
 */
public class Test04 {
	public static void main(String[] args) {
		// 조건이 여러가지인 경우는 if ~ else if 구문으로 처리하는것이 편하다
		
		// 할 일
		
		// 입력도구 준비
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("나이 입력 : ");
		
		// 변수 생성
		int age = sc.nextInt();
		sc.close();
		String result = "";
		
		
		// 판별
		
		if (age < 10) {
			result = "유년기";
		}else if (age < 20 ) {
			result = "10대";
		}else if (age < 30) {
			result = "20대";
		}else if (age < 40) {
			result = "30대";
		}else if (age < 50) {
			result = "40대";
		}else
			result = "장년층";
		
		// 출력
		System.out.println("입력한 나이 " + age + "는 " + result + "입니다.");
	}
}
