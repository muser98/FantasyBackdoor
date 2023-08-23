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
import java.util.ArrayList;

@WebServlet(name="addToCart", value = "/addToCart")
public class addToCart extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productBean item = new productBean();
        productDAO find= new productDAO();
        String variant= request.getParameter("variant");
        String pid[]=variant.split("_");
        variant=pid[0];
        int size= Integer.parseInt(request.getParameter("size"));
        item = find.selectItemsize(variant, size);
        if(item.getVariant()!=null && item.getQty()!=0) {
            System.out.println(item.getProductname() + "-" + item.getSize());
            HttpSession session = request.getSession();
            ArrayList<productBean> cart = (ArrayList<productBean>) session.getAttribute("cart");
            int i = 0;
            if (session.getAttribute("cart") != null) {
                cart.add(item);
                System.out.println(cart.indexOf(item));
            } else {
                cart = new ArrayList<productBean>();
                cart.add(item);
                System.out.println(cart.indexOf(item));
            }
            session.setAttribute("cart", cart);
            String message="Succesfully added to cart!";
            request.setAttribute("message",message);
            String destPage = "/productPage.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        }else{
            HttpSession session= request.getSession();
            productBean p= (productBean) session.getAttribute("item");
            String message="Error adding to cart: product is SOLD OUT";
            request.setAttribute("message",message);
            request.setAttribute("item",p);
            String destPage = "/productPage.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        }
    }
}
