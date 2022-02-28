package day05.ex;

import java.util.Scanner;

/*
문제 7 ]
	5자리의 숫자를 입력한 후
	각자리의 수의 합을 구하는 프로그램을 작성하세요.
*/

public class Ex07 {
	public static void main(String[] args) {
		System.out.println("숫자를 입력하세요. : ");
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();
		int answer = 0;
		
		while (num >= 1) {
			answer += num % 10;
			num /= 10;
		}
		System.out.println(answer);
		
	}
}
