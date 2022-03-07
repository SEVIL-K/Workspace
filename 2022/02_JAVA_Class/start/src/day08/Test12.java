package day08;


/*
 * 	문자와 출현수를 기억한 배열을 10개 관리하는 배열을 만들고
 * 	'A' - 'J' 를 랜덤하게 100번 반복해서 만들고
 * 	배열에 카운트를 기억시켜서 결과를 출력하세요
 * 
 */
public class Test12 {
	public static void main(String[] args) {
		
		int[][] mun = new int[10][2];
		
		for (int i = 0; i < mun.length; i++) {
			mun[i][0] = 'A' + 1;
		}
		
		// 랜덤하게 문자를 100번 발생시킨다
		
		for (int i = 0; i < 100; i++) {
			char ch = (char) (Math.random() * ('J' - 'A' + 1) + 'A');
			
			int idx = ch - 'A';
			
			int oldCount = mun[idx][1];
			int newCount = oldCount + 1;
			
			mun[idx][1] = newCount;
			
		}
		
		// print
		
		for (int i = 0; i < mun.length; i++) {
			int[] arr = mun[i];
			
			char ch = (char) arr[0]; 		// 문자의 아스키 코드값을 꺼내서 문자로 강제 형변환
			int count = arr[1]; 			// 카운트 수
			
			// 타이틀 출력
			
			System.out.println(ch + " : [ " + count + " ]");
			for (int j = 0; j < count; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
	}
}
