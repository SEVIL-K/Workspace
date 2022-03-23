package day18;

/*
    스레드 프로그램을 실행해보자

    1. 스레드 프로그램은 반드시 New Born 상태로 만들어야 한다..
        New Born 상태란??
        실행 가능한 프로그램으로 만든다는 의미
            ==> 자바에서는 new 시키는 것이다.

 */

public class Test09 {

    public Test09(){

    }

    public static void main(String[] args) {
        new Test09();
        System.out.println(" 메인 함수 종료");
    }
}


/*
    원래는 스레드 프로그램 역시 다른 파일에 클래스를 만들어야 하는데
    지금은 간단한 테스트이므로 하나의 클래스 내에서 만들도록 한다..
    두개의 스레드 프로그램을 만들어보자

 */

class MyThread01 extends Thread{
    // 이 클래스 내에는 변수나 다른 함수들을 만들 수 있지만
    // 여기서는 테스트만 해보기로 한다.

    @Override
    public void run() {
        // 나는 이 프로그램에서 코딩을 1000개 하도록 하게 할 것이다.
        for (int i = 0; i < 1000; i++) {
            System.out.println("A가 코딩을 진행중..." + (i+1) + " 회차");
        }
//        super.run();
    }
}

class MyThread02 extends Thread {
    @Override
    public void run() {
        // B가 스트레칭을 1000번 합니다.
        for (int i = 0; i < 1000; i++) {
            System.out.println("\t\t** B가 " + (i+1) + " 번 째 스트레칭을 합니다.");
        }
//        super.run();
    }
}