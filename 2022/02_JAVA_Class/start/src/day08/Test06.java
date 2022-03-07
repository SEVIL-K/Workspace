package day08;

/*
 * 	이름을 기억할 배열을 만들고
 *  이름을 입력해서 출력하세요.
 */
public class Test06 {
	public static void main(String[] args) {
		
		// 이름을 기억할 배열 생성
		String[] bp = new String[4];
		
		// 이름 입력
		bp[0] = "로제";
		bp[1] = "지수";
		bp[2] = "리사";
		bp[3] = "제니";
		
		// 출력
		for (int i = 0; i < bp.length; i++) {
			System.out.println(bp[i]);
		}
	}
}
