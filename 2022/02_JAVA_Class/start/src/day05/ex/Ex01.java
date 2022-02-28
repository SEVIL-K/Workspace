package day05.ex;

/* 
 * 1 ~ 10 까지의 합을 구해서 출력해주는 프로그램을 작성하세요.
 * 힌트 ]
 * 		합은 결과값 변수로 만들어서 처리하세요.
 */
public class Ex01 {
	public static void main(String[] args) {
		
		int sum = 0;
		
		for (int i = 0; i < 10; i++) {
			sum = sum + (i+1);
		}
		
		System.out.println(sum);
		
		int mul = 1;
		
		for (int i = 0; i < 10; i++) {
			mul = mul * (i+1);
		
		}
		
		System.out.println(mul);
	}
}
