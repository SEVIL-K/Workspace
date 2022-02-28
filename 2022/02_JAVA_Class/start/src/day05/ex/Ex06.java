package day05.ex;

import java.util.Scanner;

/*
문제 6 ]
	랜덤하게 정수를 컴퓨터가 만들어 내면
	그 수를 알아맞추는 게임을 만드세요.
	
	예 ]
		
		발생숫자 : 54
		
		사용자입력숫자 : 45
		
		==> "입력한 수가 더 작습니다."
		로 메세지 를 출력해서 사용자가 숫자를 알아맞추는 게임...
		
		횟수도 같이 출력되게 하세요.
*/

public class Ex06 {
	public static void main(String[] args) {
		
		System.out.println("최대 숫자를 설정하세요. : ");
		Scanner sc_max = new Scanner(System.in);
		int max_int = sc_max.nextInt();
		int answer = (int) (Math.random() * (max_int - 1 + 1) +1);
		//sc_max.close();
		System.out.println("답 : " + answer);
		
		int input_num;
		int count = 0;
		
		Scanner sc = new Scanner(System.in);
		
		
		
		do {
			System.out.print("정답을 입력하세요 : ");
			input_num = sc.nextInt();
			count++;
			if (input_num > answer) {
				System.out.println("틀렸습니다. 더 낮은 수를 입력하세요.");
			}else if (input_num < answer) {
				System.out.println("틀렸습니다. 더 높은 수를 입력하세요.");
			}
		} while (input_num != answer);
		
		System.out.println("정답입니다. 총 시도 횟수는 " + count + "회 입니다.");
		sc_max.close();
		sc.close();
	}
}
