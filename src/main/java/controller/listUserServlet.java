package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserBean;
import model.UserDAO;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "listUser", value = "/listUser")
public class listUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO action = new UserDAO();
        ArrayList<UserBean> userList = new ArrayList<>();
        userList= action.listUser();
        String destPage="userList.jsp";
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
