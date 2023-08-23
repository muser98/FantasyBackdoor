package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.adminDAO;
import model.adminBean;
import java.io.IOException;
@WebServlet(name="adminlogin", value = "/adminlogin")
public class adminLogin extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int passcode = Integer.parseInt(request.getParameter("passcode"));
        adminDAO A = new adminDAO();
        adminBean admin = A.doCheck(passcode);
        String destPage="";
        HttpSession session= request.getSession();
        if (admin != null) {
            System.out.print(admin.getName());
            session.setAttribute("admin",admin);
            destPage = "AdminPage.jsp";
        }else{
            String message="Wrong passcode retry";
            session.setAttribute("message",message);
            destPage="adminAccesPage.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);

    }
}
