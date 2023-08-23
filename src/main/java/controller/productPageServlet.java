package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.productBean;
import model.productDAO;

import java.io.IOException;
@WebServlet(name="product", value="/product")
public class productPageServlet  extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productDAO item= new productDAO();
        productBean object;
        String variant = request.getParameter("articleId");
        object = item.selectItem(variant);
        HttpSession session= request.getSession();
        String destPage="productPage.jsp";
        session.setAttribute("item", object);
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}

