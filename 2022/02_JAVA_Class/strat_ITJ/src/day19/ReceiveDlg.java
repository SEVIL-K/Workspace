package day19;
/*
    Created by HG on 2022-03-24
    
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ReceiveDlg {

    Jjokji main;
    JTextField field;
    JTextArea area;
    JButton reB, closeB;
    JFrame frame;

    public ReceiveDlg(Jjokji main) {
        this.main = main;
        setGui();
    }

    public void setGui() {
        frame = new JFrame("받은 메세지");
        field = new JTextField();
        area = new JTextArea();
        JScrollPane sp = new JScrollPane(area);

        // 버튼 생성
        reB = new JButton("답장");
        closeB = new JButton("닫기");

        JPanel bPan = new JPanel(new GridLayout(1, 2));
        bPan.add(reB);
        bPan.add(closeB);

        reB.addActionListener(new BenEvt());

        closeB.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                main.frame.setVisible(true);
            }
        });

        frame.add(field, BorderLayout.NORTH);
        frame.add(sp, BorderLayout.CENTER);
        frame.add(bPan, BorderLayout.SOUTH);

        frame.setSize(600, 500);
        frame.setVisible(true);
        frame.setResizable(false);
    }

    class BenEvt implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            // 이름 알아내고
            String name = field.getText();

            MsgWrite wr = new MsgWrite(main);
            wr.field.setText(name);
            frame.dispose();
        }
    }


}
