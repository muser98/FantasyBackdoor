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

@WebServlet(name = "addqty",value = "/addqty")
public class addqty extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String variant= request.getParameter("id2");
        int qty= Integer.parseInt(request.getParameter("qty"));
        qty+=1;
        System.out.print(qty+" "+variant+"\n");
        productDAO items = new productDAO();
        items.addQty(variant,qty);
        ArrayList<productBean> productList;
        productList= items.listProduct();
        request.setAttribute("productlist", productList);
        String destPage="listProduct.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
