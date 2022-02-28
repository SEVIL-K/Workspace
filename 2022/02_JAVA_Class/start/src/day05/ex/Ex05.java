package day05.ex;

import java.util.Scanner;

/*
문제 5 ]
	컴퓨터와 사용자 사이의 가위바위보 게임을 한다.
	
	컴퓨터는 랜덤하게 1 ~ 3 사이의 숫자를 발생하여
	가위, 바위, 보로 가정하고
	사용자는 키보드를 이용해서 1 ~ 3 사이의 숫자를 입력하도록 한다.
	
	누가 이겼는지를 확인하는 프로그램을 작성하세요.
	
*/

public class Ex05 {
	public static void main(String[] args) {
		int com = (int) (Math.random() * (3 - 1 + 1) + 1);
		
		System.out.println("가위 바위 보 중 하나를 입력하세요.\n 1.가위\n 2.바위\n 3.보");
		Scanner sc = new Scanner(System.in);
		int user = sc.nextInt();
		sc.close();
		
		String my_choice = "";
		String com_choice = "";
		String result = "";
		
		switch (com) {
		case 1:
			com_choice = "가위";
			break;
		case 2:
			com_choice = "바위";
			break;
		case 3:
			com_choice = "보";
			break;
		default:
			break;
		}
		
		switch (user) {
		case 1:
			if (com == 1) result = ("무승부");
			else if (com == 2) result = ("패배");
			else result = ("승리");
			my_choice = "가위";
			break;
		case 2:
			if (com == 1) result = ("승리");
			else if (com == 2) result = ("무승부");
			else result = ("패배");
			my_choice = "바위";
			break;
		case 3:
			if (com == 1) result = ("패배");
			else if (com == 2) result = ("승리");
			else result = ("무승부");
			my_choice = "보";
			break;
		default:
			break;
		}
	
		System.out.println("결과는 " + result + "(나 : " + my_choice + " / 컴 : " + com_choice + ")");
	}
	
}
