package day04.ex;

import java.util.Scanner;

import javax.swing.JOptionPane;

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
		
		
		// 숫자 입력받기
		String sno = JOptionPane.showInputDialog("세 자리 정수 입력 : ");
		// 입력받은 데이터는 문자열이므로 정수형태로 바꿔준다.
		int cno = Integer.parseInt(sno);
	
		// 계산
		int cno_cal = (cno % 100) >= 50 ? 100 - (cno % 100) : -(cno % 100);
		int conv_cal = cno_cal >= 0 ? cno_cal : -(cno_cal);
		String cno_or1 = cno_cal >= 0 ? "더해야 한다" : "빼야 한다" ;
		
		// 출력
		System.out.println(cno + " 은 " + (cno + cno_cal) + "에 가까우므로 " + conv_cal + "만큼 " + cno_or1);
				
		
		/*
		 * // 숫자 3개 입력받기
		 * 
		 * System.out.println("첫번째 숫자 : "); Scanner sc1 = new Scanner(System.in); int
		 * no1 = sc1.nextInt();
		 * 
		 * System.out.println("두번째 숫자 : "); Scanner sc2 = new Scanner(System.in); int
		 * no2 = sc2.nextInt();
		 * 
		 * System.out.println("세번째 숫자 : "); Scanner sc3 = new Scanner(System.in); int
		 * no3 = sc3.nextInt();
		 * 
		 * 
		 * sc1.close(); sc2.close(); sc3.close();
		 * 
		 * // 계산 int cal1 = (no1 % 100) >= 50 ? 100 - (no1 % 100) : -(no1 % 100); int
		 * cal1_1 = cal1 >= 0 ? cal1 : -(cal1); String or1 = cal1 >= 0 ? "더해야 한다" :
		 * "빼야 한다" ;
		 * 
		 * int cal2 = (no2 % 100) >= 50 ? 100 - (no2 % 100) : -(no2 % 100); int cal2_1 =
		 * cal2 >= 0 ? cal2 : -(cal2); String or2 = cal2 >= 0 ? "더해야 한다" : "빼야 한다" ;
		 * 
		 * int cal3 = (no3 % 100) >= 50 ? 100 - (no3 % 100) : -(no3 % 100); int cal3_1 =
		 * cal3 >= 0 ? cal3 : -(cal3); String or3 = cal3 >= 0 ? "더해야 한다" : "빼야 한다" ;
		 * 
		 * 
		 * // 출력 System.out.println(no1 + " 은 " + (no1 + cal1) + "에 가까우므로 " + cal1_1 +
		 * "만큼 " + or1 ); System.out.println(no2 + " 은 " + (no2 + cal2) + "에 가까우므로 " +
		 * cal2_1 + "만큼 " + or2 ); System.out.println(no3 + " 은 " + (no3 + cal3) +
		 * "에 가까우므로 " + cal3_1 + "만큼 " + or3 );
		 */		
	}
}