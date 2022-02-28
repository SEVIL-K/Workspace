package day05;

public class Test09 {
	public static void main(String[] args) {
		// 1 ~ 숫자를 만들어서 출력하고 50이 되면 반복을 종료하세요
		
		for (int i = 0; ; i++) {
			/*
			 * 참고 ]
			 * 		for 명령에서 조건식에 아무것도 기술하지 않는 경우는
			 * 		조건식의 결과를 true로 실행하게 된다.
			 */
			int no = i +1;
			
			if (no > 50) {
				break;
			}
			System.out.print(no + ", ");
		}
		System.out.println();
		
		int no = 1;
		while (true) {
			/*
			 * if (no > 50){
			 * 		break;
			 * }
			 * 		참고 ]
			 * 			블럭의 내용이 명령 하나만 기술되는 경우는
			 * 			블럭기호 {}를 생략할 수 있다.
			 */
			
			if (no > 50) break;
			System.out.print(no + ", ");
			// 증감식
			++no;
			
		}
		System.out.println();
	}
}
