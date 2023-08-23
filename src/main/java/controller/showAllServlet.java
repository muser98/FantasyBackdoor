package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.productBean;
import model.productDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="showAll", value="/showAll")
public class showAllServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productDAO action = new productDAO();
        ArrayList<productBean> catalogue = new ArrayList<>();
        catalogue= action.showAll();
        String destPage="showAll.jsp";
        request.setAttribute("catalog", catalogue);
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
