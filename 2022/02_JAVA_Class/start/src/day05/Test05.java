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

public class Test05 {
	public static void main(String[] args) {
		// 입력도구 준비
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("나이 입력 : ");
		
		// 변수 생성
		int age = sc.nextInt();
		sc.close();
		String result = "";
		
		int gen = age / 10 * 10;
		
		// 판별
		switch (gen) {
		case 0:
			result = "유년기";
			break;
		case 10:
			result = "10대";
			break;
		case 20:
			result = "20대";
			break;
		case 30:
			result = "30대";
			break;
		case 40:
			result = "40대";
			break;
		default:
			result = "장년층";
			break;
		}
		
		// 출력
		System.out.println("입력한 나이 " + age + "는 " + result + "입니다.");
	}
}
