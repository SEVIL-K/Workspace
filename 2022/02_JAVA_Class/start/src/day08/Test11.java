package day08;


/*
 * 	3 학생의 Java, Db, Web, Jsp, Spring 점수를 기억할 배열을 만들고
 * 	각 과목의 점수를 랜덤하게 만들어서 입력하고
 * 	결과를 출력하는 프로그램을 작성하세요..
 */
public class Test11 {
	public static void main(String[] args) {
		
		int[][] stud = new int[3][5];		// 3 student, 5 object
		
		for (int i = 0; i < stud.length; i++) {		// choice student
			for (int j = 0; j < stud[i].length; j++) {		// choice object
				System.out.print(stud[i][j] + "  |  ");
			}
			System.out.println();
		}
		
		// input object score
		
		for (int i = 0; i < stud.length; i++) {
			// selected student
			for (int j = 0; j < stud[i].length; j++) {
				// input random score 
				stud[i][j] = (int)(Math.random() * 41 + 60);
			}
		}
		
		// print
		System.out.println();
		System.out.println();
		
		for (int i = 0; i < stud.length; i++) {		// choice student
			for (int j = 0; j < stud[i].length; j++) {		// choice object
				System.out.print(stud[i][j] + "  |  ");
			}
			System.out.println();
		}
		
		// get total score
		// create total score array

		int[] total = new int[3];

		for(int i = 0 ; i < stud.length ; i++ ) {

			for(int j = 0 ; j < stud[i].length ; j++ ) {
				total[i] += stud[i][j];
			}
		}

		// 출력
		for(int t : total) {
			System.out.println("### " + t);
		}
		
	}
}
