package day09.ex;

import java.util.Scanner;

public class Ex01 {
	public Ex01() {
		Scanner sc = new Scanner(System.in);
		
		String[] sik = input(sc);
		// 계산 결과 받고
		double result = calc(sik);
		
		System.out.println(sik[0] + " " + sik[1] + " " + sik[2] + " 의 연산 결과 : " + result);
	}
	
	public static void main(String[] args) {
		new Ex01();
	}
	
	
	// 두 수를 더해주는 기능의 함수
	public int plus(int no1, int no2) {
		return no1 + no2;
	}
	
	
	// 입력 함수
	public String[] input(Scanner s) {
		String[] str = new String[3];
		
		// 메세지 출력
		System.out.println("계산식 입력 : ");
		String sik = s.nextLine();
		
		
		// 문자열에서 숫자와 연산기호를 분리
		for (int i = 0; i < sik.length(); i++) {
			char ch = sik.charAt(i);
			
			if (ch < '0' || ch > '9') {
				// 이 경우는 연산기호에 해당
				String sno1 = sik.substring(0, i);
				String sno2 = sik.substring(i+1);
				
				str[0] = sno1;
				str[2] = sno2;
				str[1] = ch + "";
				
				// 반복 종료
				break;
			}
		}
		
		return;
	}
}
