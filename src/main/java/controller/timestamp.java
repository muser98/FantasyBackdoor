package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;
@WebServlet(name="timestamp", value="/timestamp")
public class timestamp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        if(session.getAttribute("user")==null){
            Date s = new Date();
            session.setAttribute("date",s.toString());
        }
        response.getWriter().print("Login date and time: "+session.getAttribute("date"));
    }
}

