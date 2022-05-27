package com.githrd.festival.controller.api;

/**
 * 이 컨트롤러는 api로 받아온 공공데이터를
 * form 태그의 벨류로 받아서 string 분할 작업 후
 * Vo에 심고 dao 작업으로 db에 저장하는 역할을 한다
 *
 * @
 */

import com.githrd.festival.controller.*;
import com.githrd.festival.dao.ApiDao;
import com.githrd.festival.vo.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ApiProc implements FesInter {
    @Override
    public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("isRedirect", true);
        String view = "/festival/main.fes";

        String str = req.getParameter("list");
        ArrayList<FestivalVO> arr = new ArrayList<FestivalVO>();
        String[] starry = str.split("#", -1);
        /*for (String st : starry) {
            System.out.println(st);
            System.out.println("######################################");
        }*/
        /*System.out.println(starry.length);*/
        /*for (int i = 0; i < starry.length; i++) {
            String[] tmp = starry[i].split("@", -1);
            for (String st : tmp) {
                System.out.println(st);
            }
        }*/

        // split @를 이용해서 데이터 분할 후 null 체크
        // 데이터 vo 에 심기작업
        for (int i = 0; i < starry.length - 1 ; i++) {
        /*for (int i = 0; i < 20; i++) {*/
            String[] tmp = starry[i].split("@",-1);
            FestivalVO fvo = new FestivalVO();
            if (!tmp[0].equals("")) {
                fvo.setFname(tmp[0]);
            }
            if (!tmp[1].equals("")) {
                fvo.setFoplace(tmp[1]);
            }
            if (!tmp[2].equals("")) {
                fvo.setSdate(tmp[2]);
            }
            if (!tmp[3].equals("")) {
                fvo.setEdate(tmp[3]);
            }
            if (!tmp[4].equals("")) {
                fvo.setFcontext(tmp[4]);
            }
            if (!tmp[5].equals("")) {
                fvo.setHostinst(tmp[5]);
            }
            if (!tmp[6].equals("")) {
                fvo.setHostorgan(tmp[6]);
            }
            if (!tmp[7].equals("")) {
                fvo.setFtel(tmp[7]);
            }
            if (!tmp[8].equals("")) {
                fvo.setFhaddr(tmp[8]);
            }
            if (!tmp[9].equals("")) {
                fvo.setFroadaddr(tmp[9]);
            }
            if(!tmp[10].equals("")){
                fvo.setLatitude(tmp[10]);
            }
            if (!tmp[11].equals("")) {
                fvo.setLogitude(tmp[11]);
            }
            arr.add(fvo);
        }


        ApiDao aDao = new ApiDao();
        int cnt = aDao.SelFesCnt();
        System.out.println("cnt : " + cnt);

        if (cnt != 0) {
            int rs = aDao.DelFesInfo();
            System.out.println("################ 삭제 작업 끝 ###################");
        }
        cnt = aDao.InsFesList(arr);
        if(cnt != arr.size()){
            view = "/festival/api/apiList.fes";
        }
        System.out.println("############# 작업 완료 ##################");

        return view;
    }
}
