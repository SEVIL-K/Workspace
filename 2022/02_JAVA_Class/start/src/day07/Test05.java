package day07;

import java.util.Arrays;

/*
 * 5과목의 점수를 기억할 배열을 만들고
 * 과목 점수를 입력하고
 * 총점도 배열의 마지막에 계산해서 입력하고
 * 평균을 구하고 출력하세요..
 * 배열에 담긴 과목 점수도 같이 출력하세요
 */

public class Test05 {
	public static void main(String[] args) {
		// 할 일
		
		// 1 . 배열을 만든다
		int[] subj = new int[6];
				
		// 2.  과목점수 만들어서 입력한다..
		for (int i = 0; i < subj.length - 1; i++) {
			int score = (int)(Math.random() * 41 + 60);
			subj[i]= score;
		}
		
		System.out.println(Arrays.toString(subj));
		
		// 3. 총점 계산해서 입력한다..
		for (int i = 0; i < subj.length - 1; i++) {
			subj[subj.length -1] += subj[i];
			
		}
		
		System.out.println("2. " + Arrays.toString(subj));
		// 4. 평균 구해서 기억시킨다..
		// 과목수
		int no = subj.length - 1;
		
		double avg = subj[subj.length - 1] / (double) no;
		
		// 5. 데이터를 출력한다..
		// 과목 점수 출력
		for (int i = 0; i < subj.length - 1 ; i++) {
			System.out.print(subj[i] + " | ");
		}

		// 총점 출력
		System.out.println();
		System.out.println("총점 : " + subj[subj.length - 1]);
		
		// 평균 출력
		System.out.println("평균 : " + avg);
	}
}
