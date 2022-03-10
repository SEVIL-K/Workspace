package day10;

import day10.Friend;
/* 
 * 멤버의 정보를 기억할 배열을 만들고 데이터를 입력한다
 * 완성이 되면 내용을 출력하세요.
 * 단, 각 멤버의 정보는 Friend 클래스에 기억시키도록 한다.
 */
public class Test03 {
	
	String[] names;
	String[] tels;
	String[] email;
	String[] birth;
	int[] naee;;
	char gen;
	String addrs;
	
	public Test03() {
		// 멤버 변수들 초기화
		setData();
		
		// 필요한 데이터들이 준비된 상태
		
		// 각 멤버를 배열 하나로 관리
		Friend[] black = getBlack();
		
		// 내용 출력
		for(Friend f : black) {
			System.out.println(f);
			// 이렇게 하면 Friend 클래스에 재정의한 toString() 함수가 자동 호출된다.
		}
		
		// 다시 출력
		
		
	}
	
	// Friend 배열 내용 출력해주는 함수
	public void toPrint(Friend[] b) {
		for (int i = 0; i < b.length; i++) {
			String name = b[i]
		}
	}


	// 준비된 데이터를 Friend[] 타입의 데이터로 만들어서 반환해주는 함수
	public Friend[] getBlack() {
		// 이 함수는 Friend[] 배열을 만들고
		Friend[] anne = new Friend[4];
		
		// 각 방에 friend 객체들을 채워서
		for (int i = 0; i < 4; i++) {
			// 4명분 데이터가 입력되어야 하므로
			// Friend 객체를 4개 만들어서 각방에 집어넣는다.
			
			anne[i] = new Friend();
		}
		
		// 위의 반복문이 종료가 되면 각 방에 있는 객체의 변수에 데이터를 입력할 수 있는 상태가 된다.
		
		// 데이터를 채워서
		for (int i = 0; i < anne.length; i++) {
			Friend f = anne[i];
			
			String name = names[i];
			f.setName(name);
			
			f.setTel(tels[i]);
			f.setMail(email[i]);
			f.setBirth(birth[i]);
			f.setGen(gen);
		}
		
		// 채워진 배열을 반환해준다.
		return anne;;
	}
	
	
	
	
	
	// 각 데이터를 초기화 시켜주는 함수
	
	public void setData() {
		names = new String[] {"지수" , "로제" , "리사", "제니"};
		tels = new String[] {"010-1111-1111", "010-1111-2222", "010-1111-3333", "010-1111-4444"};
		email = new String[] {"jisoo@githrd..com","rose@githrd..com","risa@githrd..com","jennie@githrd..com"};
		birth = new String[] {"1997/07/07", "1998/05/05", "1996/04/05", "1996/03/08"};
		naee = new int[] {27,26,28,27};
		
		gen = 'F';
		addrs = "ygM"	;
		
	}
	
	
	public static void main(String[] args) {
		new Test03();
	}
}
