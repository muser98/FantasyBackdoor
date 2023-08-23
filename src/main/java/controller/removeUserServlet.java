package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "deleteuser", value = "/deleteuser")
public class removeUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String mail = request.getParameter("mail");
        loginDAO credential= new loginDAO();
        credential.doRemove(mail);
        UserDAO user = new UserDAO();
        user.doRemove(id);
        UserDAO action = new UserDAO();
        ArrayList<UserBean> userList;
        userList= action.listUser();
        request.setAttribute("userList", userList);
        String destPage="userList.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
