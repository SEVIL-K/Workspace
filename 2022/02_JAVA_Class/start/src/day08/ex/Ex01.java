package day08.ex;

/*
	7학생의 5과목 점수를 랜덤하게 만들어서 기억시키고
	각 학생 배열의 맨 마지막에는 총점을 계산해서 입력되게 하고
	결과를 출력하는데 평균도 계산해서 출력하세요.
*/

public class Ex01 {

	public static void main(String[] args) {
		// 학생 배열
		int[][] stud = new int[7][6];
		
		for (int i = 0; i < stud.length; i++) {
			for (int j = 0; j < stud[i].length-1; j++) {
				stud[i][j] = (int) (Math.random() * (100 - 1 + 1) +1);
				stud[i][stud[i].length-1] += stud[i][j];
			}
			
		}
		
		
		
		for (int i = 0; i < stud.length; i++) {
			for (int j = 0; j < stud[i].length; j++) {
				System.out.print(stud[i][j] + "  |  ");
			}
			System.out.println("평균 : " + stud[i][stud[i].length-1] / (stud[i].length -1));
		}
		
		
		
	}
	
}
