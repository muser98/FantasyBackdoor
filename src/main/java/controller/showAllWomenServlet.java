package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.productBean;
import model.productDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="showAllW", value="/showAllW")
public class showAllWomenServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       productDAO action = new productDAO();
        ArrayList<productBean> catalogue = new ArrayList<>();
        catalogue= action.showAllW();
        String destPage="showAllWoman.jsp";
        request.setAttribute("catalogW", catalogue);
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
