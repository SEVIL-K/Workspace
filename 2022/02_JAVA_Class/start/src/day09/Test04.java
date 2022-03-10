package day09;


/* 
 * 	5 학생의 3과목 점수를 배열에 입력한 후
 * 	총점을 구하는 프로그램을 작성하시오..
 * 
 * 	단,, 점수입력,, 계산,, 출력은 함수로 처리하세요..
 */
public class Test04 {
		private Test04() {
			int[][] stud = new int [5][4];
			
			// 점수 만들고
			setArr(stud);
			
			// 총점 구하고
			for (int i = 0; i < stud.length; i++) {
				int[] no = stud[i];
			}
		}
		
		
		public static void main(String[] args) {
			new Test04();
		}
		
		
		// 배열을 입력해서 실행하면 점수를 채워주는 함수
		public void setArr(int[][] stud) {
			for (int i = 0; i < stud.length; i++) {
				// 학생 수만큼 반복
				
				for (int j = 0; j < stud[i].length - 1; j++) {
					// 과목 점수 만들고
					stud[i][j] = (int)(Math.random() * 41 + 60);
				}
			}
			
			// 이 함수의 경우는 입력된 주소의 내용을 변경하는 것이므로
			// 결국 배열을 반환해주지 않아도 된다..
		}
		
		// 배열을 입력하면 총점을 꼐산해서 세팅해주는 함수
		public void setTotal(int[] score) {
			int sum = 0;
			
			// 입력된 정수를 누적해서 더해준다..
			for (int i = 0; i < score.length - 1; i++) {
				sum += score[i];
			}
			
			// 총점 방에 누적된 점수 입력
			score[3] = sum;
		}
		
		
		// 출력하는 함수
		public void toPrint(int[][] arr) {
			for (int i = 0; i < arr.length; i++) {
				System.out.println((char)('A' + i) + " 학생 : ");
				
			}
		}
}
