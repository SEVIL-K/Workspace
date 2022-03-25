package day19;
/*
    Created by HG on 2022-03-24
    
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MsgWrite {

    Jjokji main;

    JFrame frame;
    JTextField field;       // 싱글라인
    JTextArea area;         // 멀티라인
    JButton sendB, resetB, closeB;

    public MsgWrite(Jjokji main) {
        this.main = main;

        frame = new JFrame("메세지 작성");
        field = new JTextField();       // 이름을 기록할 필드
        area = new JTextArea();
        JScrollPane sp = new JScrollPane(area);

        // 버튼
        sendB = new JButton("보내기");
        resetB = new JButton("다시작성");
        closeB = new JButton("닫기");

        JPanel bPan = new JPanel(new GridLayout(1, 3));
        bPan.add(sendB);
        bPan.add(resetB);
        bPan.add(closeB);

        // 버튼 이벤트
        WriteEvt evt = new WriteEvt(this);
        sendB.addActionListener(evt);
        resetB.addActionListener(evt);

        closeB.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                main.frame.setVisible(true);
                frame.dispose();        // 현재 창만 닫기
            }
        });

        frame.add(field, BorderLayout.NORTH);
        frame.add(sp, BorderLayout.CENTER);
        frame.add(bPan, BorderLayout.SOUTH);

        frame.setSize(600, 500);
        frame.setVisible(true);

    }
}
