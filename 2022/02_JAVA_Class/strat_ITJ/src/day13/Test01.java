package day13;

import day12.sub.*;

/*
    day12.sub 패키지의 Figure 인터페이스를 구현한 사각형을 무명 내부 클래스를 만들어서 사용해보자
 */

public class Test01 {

    // 이곳에 변수를 만들면 힙에 만들어진 변수라 프로그램 종료 전까지 없어지지 않는다.

    Figure fig, fig1;

    public Test01(){

        //   이곳에 변수를 만들면 스택에 만들어진 변수라 실행 후 사라진다.

        // 사각형
        fig = new Figure() {

            int width = (int) (Math.random() * 21 + 5);
            int height = (int) (Math.random() * 21 + 5);
            double area;

            @Override
            public void setArea() {
                area = width * height;
            }

            @Override
            public void toPrint() {
                setArea();
                System.out.printf("사각형의 가로는 %3d 이고 세로가 %3d 이며 면적은 %6.2f 입니다.", width, height, area);
                System.out.println();
            }
        };

        // 삼각형
        fig1 = new Figure() {

            int width = (int) (Math.random() * 21 + 5);
            int height = (int) (Math.random() * 21 + 5);
            double area;

            @Override
            public void setArea() {
                area = width * height;
            }

            @Override
            public void toPrint() {
                setArea();
                System.out.printf("삼각형의 밑변은 %3d 이고 높이가 %3d 이며 면적은 %6.2f 입니다.", width, height, area);
                System.out.println();
            }
        };

    }

    public static void main(String[] args) {
        Test01 t1 = new Test01();

        // 사각형
        t1.fig.toPrint();

        // 삼각형
        t1.fig1.toPrint();
    }

}
