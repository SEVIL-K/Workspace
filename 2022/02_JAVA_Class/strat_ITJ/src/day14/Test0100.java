package day14;

import java.io.FileNotFoundException;

public class Test0100 extends Test0101 {
    /*
    @Override
    void abc() throws Exception{
        System.out.println("던지는 예외가 같은 경우는 상관 없다..");
    }
    */

    @Override
    void abc() throws RuntimeException{
        System.out.println("던지는 예외의 범위가 좁아진 경우는 상관없다..");
    }

    /*
    @Override
    void xyz() throws IllegalAccessError{
        System.out.println("던지지 않은 예외는 추가하면 안된다");
    }
    */

    /*
    @Override
    void xyz() throws ArithmeticException, FileNotFoundException {
        System.out.println("던지지 않은 예외는 추가하면 안된다");
    }
    */

    @Override
    void xyz() throws ArithmeticException, ClassCastException{
        System.out.println("던지지 않은 예외는 추가하면 안된다");
    }

}

class Test0101{
    void abc() throws Exception{
        System.out.println("###############");
    }

    void xyz() throws ArithmeticException{
        System.out.println("***************");
    }
}
