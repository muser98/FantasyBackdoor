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

@WebServlet(name="search", value="/search")
public class searchServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productDAO action = new productDAO();
        ArrayList<productBean> catalogue = new ArrayList<>();
        String name= request.getParameter("searchInput");
        catalogue= action.search(name);
        if(catalogue.isEmpty()) {
            String destPage = "404Page.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        }else{
            String destPage = "searchResult.jsp";
            request.setAttribute("result", catalogue);
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        }

    }
}

