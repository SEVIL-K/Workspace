package day05;

public class Test11 {
	public static void main(String[] args) {
		// 구구단 5단을 출력하는데 곱이 5인 경우는 제외하고 출력하세요.
		
		int dan = 5;
		
		for (int i = 0; i < 10; i++) {
			if (i == 4) continue;
			System.out.println(dan + " X " + (i+1) + " = " + (dan*(i+1)));
		}
	}
}
