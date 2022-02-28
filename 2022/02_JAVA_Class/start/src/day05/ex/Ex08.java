package day05.ex;

import java.util.Scanner;

/*
문제 8 ]
	숫자형식의 다섯자리 정수형태 문자열을 입력받아서
	각자리 수의 합을 구하는 프로그램을 작성하세요.
	
	문자열로 입력받아서 문자로 변환후 처리하세요.
*/

public class Ex08 {
	public static void main(String[] args) {
		System.out.println("숫자를 입력하세요. : ");
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();
		int answer = 0;
		
		String temp = "";
		temp += num;

		int temp_ch = 0;
		for (int i = 0; i < temp.length(); i++) {
			temp_ch += -'0' + (int) temp.charAt(i);
		}
		
		
		for (int i = 0; i < temp.length(); i++) {
			answer += Integer.parseInt(temp.substring(i,i+1));		
		}
		

		System.out.println(temp_ch);
		System.out.println(answer);

	}
}
