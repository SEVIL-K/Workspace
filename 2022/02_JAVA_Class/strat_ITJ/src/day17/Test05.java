package day17;

/*
    doc 폴더 안 파일의 목록을 알아내보자.
 */

import java.io.File;
import java.io.FilenameFilter;

public class Test05 {


    public Test05() {
        // 목록을 알아내고 싶은 폴더를 파일로 만든다.
        File dir = new File("doc");

        // 목록을 꺼내보자.
        String[] flist = dir.list();

        // 출력
        for (String f : flist) {
            System.out.println(f);
        }


        // 파일 정보도 같이 꺼내보자.
        File[] infoList = dir.listFiles();

        // 출력
        for (File f : infoList) {
            String fname = f.getName();         // 파일 이름 꺼내는 함수
            long len = f.length();              // 파일 사이즈 추출하는 함수
            String pold = f.getParent();        // 상위 폴더 이름 꺼내는 함수

            System.out.println("fname = " + fname + "\tlen = " + len + " byte\tpold = " + pold);

        }


        // 확장자가 .jpg인 파일만 골라서 출력하고 싶다.
        String[] flistJpg = dir.list(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                /*
                    이 함수는 자동 호출되는 함수
                    목록을 구하는 파일을 하나씩 발견할 때 마다 이 함수가 호출된다.
                    이 함수에서 true를 반환하면 그 목록을 결과에 포함시키고
                    이 함수에서 false를 반환하면 그 목록을 결과에 포함시키지 않는다.

                    따라서 포함될 파일들을 여기서 정의해주면 된다.
                    매개변수
                        File dir     : 현재 파일의 정보를 알려주고
                        String name     : 현재 파일의 이름만 알려준다.
                 */

                /*
                boolean bool = false;

                if (name.endsWith("jpg")) {     // 파일이름이 .jpg로 끝나는지
                    // 이 경우는 결과목록에 포함시켜야 한다.
                    bool = true;
                }
                return bool;
*/              // 아래 return문으로 처리

                return name.endsWith("jpg");
                // 이 경우처럼 상속받아 오버라이드 해야하는 함수의 내용이 극도로 짧은 경우는
                // 무명 내부클래스로 처리하는 것이 일반적이다.
            }
        });

        for (String f : flistJpg) {
            System.out.println(f);
        }

    }

    public static void main(String[] args) {
        new Test05();
    }
}
