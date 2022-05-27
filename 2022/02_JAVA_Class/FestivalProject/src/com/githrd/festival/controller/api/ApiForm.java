package com.githrd.festival.controller.api;


import com.githrd.festival.controller.FesInter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApiForm implements FesInter {
    @Override
    public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "/api/apiList";

        return view;
    }
}
