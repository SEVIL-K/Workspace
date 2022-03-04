package day07;

public class Test01 {

		public static void main(String[] args) {
			/*
			 * 정수 6개를 관리할 배열 arr을 만들고
			 * 1 ~ 6 까지 채워서 
			 * 한개씩 꺼내서 출력하세요..
			 * 
			 */
			
			// 배열 변수 선언
			
			/* 배열 변수의 선언 형식
			 * 	데이터 타입[] 변수;
			 */
			
			int[] arr;
			// 배열변수 초기화
			arr = new int[6];
			
			//출력
			/* 참고 ]
					배열의 길이를 알아내는 방법은 배열.length
			*/
			int len = arr.length;
			for (int i = 0; i < len; i++) {
				// 배열에 기억된 데이터 꺼내는 방법
				// 배열변수[위치값]
				int no = arr[i];
				System.out.println(no);
				/*
				 * Heap에 만들어지는 기본 데이터 타입 변수들은 모두 자동 초기화된다.
				 * 	boolean : false
				 * 	char 	: 아스키코드값 0에 해당하는 문자
				 * 	byte 	: 0
				 * 	short 	: 0
				 * 	int 	: 0
				 * 	long 	: 0
				 * 	float 	: 0.0f
				 * 	double 	: 0.0
				 */
			}
			
			// 이름을 기억할 배열을 만들어서 출력하세요..
			
			String[] bp = new String[4];
			
			// 이름 추가
			bp[0] = "로제";
			bp[1] = "지수";
			bp[2] = "리사";
			bp[3] = "제니";
			
			// 출력
			for (int i = 0; i < bp.length; i++) {
				String name = bp[i];
				System.out.println(name);
			}
			
			System.out.println(bp);
			
			// 배열 다시 만들고
			
			// 하나 추가하기
			
			/*
			 * 참고 ] 
			 * 		배열은 한번 만들어지면 크기와 타입을 수정할 수 ㅇ벗다..
			 * 		따라서 데이터의 갯수가 수정이 필요하면
			 * 		배열을 다시 만들어서 변수에 기억시켜야 한다..
			 */
			
			String[] tmp = new String[5];
			for (int i = 0; i < tmp.length; i++) {
				tmp[i] = bp[i];
			}
			
			tmp[4] = "둘리";
			
			bp = tmp;
			
			// 하나씩 꺼내서 출력
			// 배열과 같은 데이터는 향상된 for 명령이 데이터를 꺼내서 사용하는데 편하다..
			for(String nm : bp) {
				// 의미 ] bp 의 데이터를 순차적으로 하나씩 꺼내서 name 변수에 기억시키세요
				
				// 출력
				System.out.println(nm + " ");
			}
		}
}
