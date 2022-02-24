package day03.ex;
/*
 *  1년은 365.2426 일이다
	이것은 과연 몇일 몇시간 몇분 몇초인지를 계산하고 출력하세요.
	
	힌트 ]
		365.2426일은 단위가 일 단위이다.
		하루는 24시간이다.
		따라서 0.5일은 12시간을 의미한다.
 */


public class Ex04 {
	public static void main(String[] args) {
		// 변수 설정
		double year = 365.2426;
		
		// 계산
		int day = (int) year;
		double hour = (year % 1) * 24;
		double min = (hour % 1) * 60;
		double sec = (min % 1) * 60;
		
		// 출력
		System.out.println(day + "일 " + (int)hour + "시간 " + (int)min + "분 " + (int)sec + "초");

	}

}
