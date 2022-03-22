package day17;


import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Test06 {

    public Test06() {

        /*
            우리가 이제까지 키보드로 입력을 받을 때 사용했던 클래스는
            Scanner 클래스였는데 이 클래스의 생성 방법은

            Scanner(InputStream in) => Scanner(System.in)

            Scanner(File file)

         */

        // Scanner 를 이용해서 day17\\result\\FileTest01.txt 파일을 읽어보자

        // File 준비

        File file = new File("src\\day17\\result\\FileTest01.txt");
        Scanner sc = null;

        try {
            sc = new Scanner(file);

            // 한 단어만 읽어서 출력해보자.
            String str = sc.next();
            System.out.println(str);


            // 한 행을 읽어서 출력해보자.
            String str_2 = sc.nextLine();
            System.out.println(str_2);



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new Test06();
    }
}
