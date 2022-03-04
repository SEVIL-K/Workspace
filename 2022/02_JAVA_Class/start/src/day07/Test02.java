package day07;

/*
 * 5개의 메모리를 배열로 만들고
 * 그안에 랜덤한 숫자를 입력한 후 출력하세요..
 *  1~45
 */
public class Test02 {
	public static void main(String[] args) {
		// 할 일
		// 1. 배열의 주소를 기억할 변수
		int[] lotto;
		
		// 2. 배열을 만든다
		lotto = new int[6];
		
		loop:
		for (int i = 0; i < lotto.length; i++) {
			// 3. 랜덤하게 정수를 만들어서
			int no = (int) (Math.random() * (45 + 1));
			
			// 중복검사
			// 지금 만든 번호가 이전에 이미 만들어진 번호면
			// 지금 회차를 다시 반복한다..
			
			for (int j = 0; j < i ; j++) {
				// 이전에 만든 번호 추출
				int tmp = lotto[j];
				
				if (no == tmp) {
					// 이 경우는 지금 만든 번호가 이전 회에서 이미 만든 번호이므로 
					// 지금 회차를 반복한다..
					// 회차를 1 감소 시켜준다
					i--;
					// 다음 회차를 진행한다..
					continue loop;
				}
			}
			// 4. 배열에 채워넣는다..
			lotto[i] = no;
		}
				
		// 5. 하나씩 꺼내서 출력
		for (int i = 0; i < lotto.length; i++) {
			System.out.print(lotto[i] + " | ");
		}
	}
}
