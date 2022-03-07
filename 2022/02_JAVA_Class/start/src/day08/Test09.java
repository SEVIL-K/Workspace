package day08;

import java.util.Scanner;

/*
 *  +, -, *, / 연산을 하는
 * 	연산식을 입력하면
 * 	결과를 보여주는 계산기 프로그램을 작성하세요..
 * 
 * 	단 연산식을 문자열 배열에 담아서 처리하세요..
 * 
 * 	예 ] 
 * 		2*3
 * 		String[] sik = new String[3];
 * 		sik[0] = 2;
 * 		sik[1] = *;
 * 		sik[2] = 3;
 * 
 * 		따라서 연산기호가 오는 위치 이전까지 문자열을 잘라서 첫번째 기억시키고
 * 		연산기호를 두번째에 기억시키고
 * 		나머지를 마지막 위치에 기억시켜서 처리한다..
 * 
 */
public class Test09 {
	public static void main(String[] args) {
		
		// 입력 도구 준비하고
		Scanner sc = new Scanner(System.in);
		
		// 메세지 출력
		System.out.print("계산식을 입력하세요 : ");
		
		// 입력받은 값 기록
		String str = sc.nextLine();
		
		
		// 배열 준비
		String[] sik = new String[3];
		
		// 배열에 문자열 잘라서 기록
		int idx = 0;
		
		// 반복해서 추출하여 연산기호의 위치를 찾아낸다..
		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			
			if (ch < '0' || ch > '9') {
				// 이 경우 추출한 문자는 숫자형태가 아니므로 연산기호이다..
				idx = i;
			}
		}
		
		sik[0] = str.substring(0,idx);
		sik[1] = str.substring(idx,idx +1);
		sik[2] = str.substring(idx+1);
		
		// 계산
		
		int no1 = Integer.parseInt(sik[0]);
		int no2 = Integer.parseInt(sik[2]);
		
		double result = 0.0;
		
				
		switch (sik[1]) {
		case "+":
			result = no1 + no2;
			break;
		case "-":
			result = no1 - no2;
			break;
		case "*":
			result = no1 * no2;
			break;
		case "/":
			result = no1 / (double) no2;
			break;

		default:
			break;
		}
		
		System.out.println(result);
		sc.close();
		
	}
}
