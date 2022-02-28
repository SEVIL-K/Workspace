package day05;

/*
 * 
 * 
 * 참고 ]
 * 		배열
 * 			: 타입이 같은 데이터를 일정 갯수만큼 모아서 하나로 관리하도록 만들어 놓은 자바의 데이터 타입
 * 			타입이 결정이 되어야 하고
 * 			갯수도 결정이 되어야 만들 수 있다.
 * 
 * 			단점
 * 				한 번 사이즈가 정해지면 바꿀 수 없다.
 * 		
 * 			만드는 형식 ]
 * 					데이터타입[] 변수 이름 = new 데이터타입[갯수];
 * 					데이터타입[] 변수 이름 = {데이터1, 데이터2, ... };
 * 
 * 			배열 데이터 사용하는 방법
 * 					데이터 타입 변수이름 = 배열변수[위치값];
 * 					위치값은 0부터 시작
 */


public class Test08 {
	public static void main(String[] args) {
		int[] num = {1,2,3,4,5,6};
		
		int len = num.length;
		
		for (int i = 0; i < len; i++) {
			System.out.println(i+1 + "번째 데이터 : " + num[i]);
		}
		
		// 향상된 for 명령으로 처리
		for (int no : num) {
			System.out.println("### " + no);
		}
	}
}
