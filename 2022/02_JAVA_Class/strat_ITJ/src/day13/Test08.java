package day13;

public class Test08 {

    public void Test08(){
        System.out.println("1. abc() 호출");
        abc();
        System.out.println("2. abc() 함수 종료직후");
    }

    public void abc(){
        int no1 = 25;
        int no2 = 0;
        int result = 0;

        try {
            result = no1 / no2;
        }catch (Exception e){
            System.out.println("예외 발생");
            return;
        }finally {
            System.out.println("여긴 Finally 구역");
        }
    }
}
