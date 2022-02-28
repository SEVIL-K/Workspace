package day05;

import java.util.Scanner;

/*
 * 	정수를 입력받아서
 * 	그 수샂가 짝수인지 홀수인지를 판별해서 출력하세요.
 */
public class Test02 {
	public static void main(String[] args) {
		
		// 입력
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("판별할 정수를 입력하세요 : ");
		
		// 변수 생성
		int no = sc.nextInt();
		String result = "0";
		
		// 판별
		if (no != 0) {
			result = "홀수";
			if (no % 2 ==0) {
				result = "짝수";
			}
		}
		
		
		// 결과출력
		System.out.println("입력한 숫자 " + no + "는 " + result + "입니다.");
	}
}
