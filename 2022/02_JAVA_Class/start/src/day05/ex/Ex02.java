package day05.ex;

import java.util.Random;

/*
 * Ex02 ] 
 * 		'A' 부터 문자를 10개 만들어서 출력하세요
 */
public class Ex02 {
	public static void main(String[] args) {
		char ch = 'A';
		
		for (int i = 0; i < 10; i++) {
			
			char ch1 = (char) (Math.random() * ('Z' - 'A' + 1) + 'A');
			//System.out.println(ch);
			System.out.println(ch1);
			ch++;
			
		}
		
	}
}
