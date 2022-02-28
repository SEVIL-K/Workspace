package day05;

/*
 * 	한 구문을 열번 출력하세요
 *  구구단 7단을 출력하세요.
 */
public class Test06 {
	public static void main(String[] args) {
		
		String str = "반복문에 출력될 문자열";
		
		for (int i = 0; i < 10; i++) {
			System.out.println(i+1 + ". " + str);
		}
		
		int dan = 7;
		
		for (int i = 1; i < 10; i++) {
			System.out.println(dan + " X " + i + " = " + dan*i);
		}
	}
}
