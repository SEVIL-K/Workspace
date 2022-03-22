package day17;

import java.io.PrintStream;

public class Test11 {
    
    public Test11() {
        
        // 스트림 준비
        PrintStream ps = null;

        try {
            ps = new PrintStream("src\\day17\\result\\다시 사랑한다면.txt");       // 직접 파일에 연결된 스트림을 만드는 보조스트림이다.
            
            // 내용 작성
            // 여러줄 수정 Alt + 드래그

            ps.println("            다시 사랑한다면 - 김필 (원곡 도원경) ");
            ps.println("");
            ps.println("            다시 태어난다면 다시 사랑한다면");
            ps.println("            그때는 우리 이러지 말아요");
            ps.println("            조금 덜 만나고 조금 덜 기대하며");
            ps.println("            많은 약속 않기로 해요");
            ps.println("");
            ps.println("            다시 이별이 와도 서로 큰 아픔 없이");
            ps.println("            돌아설 수 있을 만큼");
            ps.println("            버려도 되는 가벼운 추억만");
            ps.println("            서로의 가슴에 만들기로 해요");
            ps.println("");
            ps.println("            이젠 알아요 너무 깊은 사랑은");
            ps.println("            외려 슬픈 마지막을 가져 온다는 걸");
            ps.println("            그대여 빌게요 다음 번의 사랑은");
            ps.println("            우리 같지 않길 부디 아픔이 없이");
            ps.println("            나~");
            ps.println("                꼭 나보다 더 행복해져야만 해");
            ps.println("");
            ps.println("");
            ps.println("            많은 시간이 흘러 서로 잊고 지내도");
            ps.println("            지난 날을 회상하며");
            ps.println("            그 때도 이건 사랑이었다고");
            ps.println("            말할 수 있다면 그걸로 된 거죠");
            ps.println("");
            ps.println("            이젠 알아요 너무 깊은 사랑은");
            ps.println("            외려 슬픈 마지막을 가져 온다는 걸");
            ps.println("            그대여 빌게요 다음 번의 사랑은");
            ps.println("            우리 같지 않길 부디 아픔이 없이");
            ps.println("");
            ps.println("            이젠 알아요 영원할 줄 알았던");
            ps.println("            그대와의 사랑마저 날 속였다는 게");
            ps.println("            그보다 슬픈 건 나 없이 그대가");
            ps.println("            행복하게 지낼 먼 훗날의 모습");
            ps.println("            나~");
            ps.println("                    내 마음을 하늘만은 알기를");

            ps.flush();

            System.out.println("저장 성공");
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
        }
    }

    public static void main(String[] args) {
        new Test11();
    }
}
