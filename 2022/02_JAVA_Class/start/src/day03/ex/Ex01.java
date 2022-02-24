package day03.ex;

import java.util.Scanner;

/* 
 * 	문제1 ]
 * 		두 개의 숫자를 입력받은 후 (가로, 세로 )
 * 		그 숫자를 이용해서 
 * 			사격형의 넓이와 => 가로 X 세로
 * 			삼각형의 넓이를 => 밑병 X 높이 X 1/2
 * 			구해서 결과를 출력하세요.
 * 
 * 		출력형식 ]
 * 			가로 : XXXXX
 * 			세로 : XXXXX
 * 			사각형 넓이 : XXXXX
 * 			삼각형 넓이 : XXXX.X
 * 		
 * 		
 * 		
 * 		참고 ] 
 * 			자바에서 * 기호의 의미
 * 				연산자로서 곱하기의 의미
 * 				모든것을 의미
 */

public class Ex01 {
	public static void main(String[] args) {
		
		// 입력도구 준비
		Scanner sc = new Scanner(System.in);
		
		// 입력 메세지 출력
		System.out.println("가로 : ");
		String text_width = sc.nextLine(); 	// 문자열로 입력받는 방법
		// 정수형태의 문자열을 정수로 변환하는 방법
		// Integer.parseInt(width);
		
		System.out.println("세로 : ");
		String text_height = sc.nextLine();
		
		int int_width = Integer.parseInt(text_width);
		int int_height = Integer.parseInt(text_height);
		
		
		int squ_area = int_width * int_height;
		double tri_area = (double) (int_width * int_height) * 0.5;
		
		// 출력
		System.out.println("가로 : "+ int_width);
		System.out.println("세로 : " + int_height);
		System.out.println("사각형 넓이 : " + squ_area);
		System.out.println("삼각형 넓이 : " + tri_area);
		// 
		
		
		
	}
}
