package day18;


import java.io.*;

/*
    Test06에서 저장한 info_hg.txt 파일을 읽어보자

    ObjectOutputStream 으로 저장한 파일은 반드시 ObjectInputStream으로 읽어야 한다..


 */
public class Test07 {
    public Test07(){

        // 기본스트림
        FileInputStream fin = null;

        // 보조스트림
        ObjectInputStream oin = null;


        try {
            fin = new FileInputStream("src\\day18\\result\\info_hg.txt");
            oin = new ObjectInputStream(fin);


            // 클래스 통째로 읽어오기

            Friend ihg = (Friend) oin.readObject();
            String name = ihg.getName();
            String tel = ihg.getTel();
            String mail = ihg.getMail();
            String addr = ihg.getAddr();
            String blood = ihg.getBlood();
            int age = ihg.getAge();
            float height = ihg.getHeight();
            char gen = ihg.getGen();
            boolean rh = ihg.isRh();

            // 출력
            System.out.println("이름 : " + name);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                oin.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        new Test07();
    }
}
