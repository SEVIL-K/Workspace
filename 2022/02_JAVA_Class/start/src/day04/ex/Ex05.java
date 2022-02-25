package day04.ex;

import java.util.Scanner;

/*
 	문제 5 ]
		3자리 숫자(100 ~ 999)를 입력받아서
		이 숫자에 가장 가까운 100의 배수를 만들기 위해서는 
		얼마가 필요한지를 계산해서 출력해주는 프로그램을 작성하세요.
		
		예 ]
			241		은 200 에 가까우므로 41 을 빼야한다.
			777		은 800 에 가까우므로 23 을 더해줘야 한다.
 */
public class Ex05 {
	public static void main(String[] args) {
		
		// 숫자 3개 입력받기

		System.out.print("첫번째 숫자 : ");
		Scanner sc1 = new Scanner(System.in);
		System.lineSeparator();
		
		System.out.print("두번째 숫자 : ");
		Scanner sc2 = new Scanner(System.in);
		System.lineSeparator();
		
		System.out.print("세번째 숫자 : ");
		Scanner sc3 = new Scanner(System.in);
		System.lineSeparator();
		
		// 입력받은 문자열 저장
		int no1 = sc1.nextInt();
		int no2 = sc2.nextInt();
		int no3 = sc3.nextInt();
		sc1.close();
		sc2.close();
		sc3.close();
		
		// 계산
		int result = no1 ;
		
	}
}