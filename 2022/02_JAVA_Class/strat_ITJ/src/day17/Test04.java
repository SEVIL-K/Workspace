package day17;

/*
    1. result 패키지에 폴더를 강제로 만들어보자.

    2. 계층화 된 폴더를 강제로 만들어보자.

    3. 만들어진 파일 중 하나를 삭제해보자. ( 폴더도 파일로 간주되므로 삭제가 가능하다. )

 */

import java.io.File;

public class Test04 {

    public Test04() {
        // 만들고 싶은 폴더(폴더가 위치에 없어도 상관없다.) 파일로 만들기.
        // 1.


        File file = new File("src\\day17\\result\\abc");
        String msg = file.mkdir() ? "폴더 생성 성공" : "폴더 생성 실패";


        // 2.
        // mkdir() 은 마지막 경로의 디렉토리를 생성한다.
        File file_2 = new File("src\\day17\\result\\a\\b\\c\\d");
        String msg_2 = file_2.mkdirs() ? "폴더 생성 성공" : "폴더 생성 실패";


        // 3. 2번에서 만든 폴더 d 삭제
        File file_3 = new File("src\\day17\\result\\a\\b\\c\\d");
        String msg_3 = file_3.delete() ? "삭제 성공" : "삭제 실패";


        // 4. 변경작업

        // 4-1 현재 파일과 바꿀 이름의 파일을 둘 다 File로 만든다.
        File oldF = new File("src\\day17\\result\\a\\b\\c");
        File newF = new File("src\\day17\\result\\a\\b\\renameTest");

        // 4-2 이름 바꾸기
        String msg_4 = oldF.renameTo(newF) ? "변경 성공" : "변경 실패";

        // 결과 출력
        System.out.println("결과_1 : " + msg);
        System.out.println("결과_2 : " + msg_2);
        System.out.println("결과_3 = " + msg_3);
        System.out.println("결과_4 = " + msg_4);
    }

    public static void main(String[] args) {
        new Test04();
    }
}
