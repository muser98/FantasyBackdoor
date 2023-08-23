package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "removeListItem",value = "/removeListItem")
public class itemListRemove extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String variant= request.getParameter("id");
        productDAO items = new productDAO();
        items.removeProductDB(variant);
        ArrayList<productBean> productList;
        productList= items.listProduct();
        request.setAttribute("productlist", productList);
        String destPage="listProduct.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
