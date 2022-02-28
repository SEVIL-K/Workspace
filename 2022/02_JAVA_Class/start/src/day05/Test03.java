package day05;

import java.util.Scanner;

public class Test03 {
	public static void main(String[] args) {
		
		// 입력
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("판별할 정수를 입력하세요 : ");
		
		// 변수 생성
		int no = sc.nextInt();
		String result = "";
		
		if (no == 0) {
			result = "0";
		}
		else {
			if (no % 2 == 0) {
				result = "짝수";
			}else {
				result = "홀수";
			}
			
		}
		
		// 결과출력
		System.out.println("입력한 숫자 " + no + "는 " + result + "입니다.");
	}
}
