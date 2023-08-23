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

@WebServlet(name = "placeorder", value ="/placeorder" )
public class placeOrder extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<productBean> cart = (ArrayList<productBean>) session.getAttribute("cart");
        String total = request.getParameter("cartTotal");
        String username = request.getParameter("username");
        String itemlist = "";
        int  i=0;
        for(productBean p : cart){
            int qty=p.getQty();
            System.out.print("\n"+qty+"\n");
            qty=qty-1;
            String variant=p.getVariant();
            System.out.print(qty+" "+variant+"\n");
            productDAO items = new productDAO();
            items.minusQty(variant, qty);
            itemlist = itemlist.concat(cart.get(i).getProductname() + " - SIZE " + cart.get(i).getSize() + "\n");
            i += 1;
        }
        orderBean order = new orderBean();
        order.setUsername(username);
        order.setOrderitem(itemlist);
        order.setTotal(total);
        System.out.print(order.toString());
        orderDAO dao=new orderDAO();
        dao.doSave(order);
        request.setAttribute("orderinfo",order);
        session.setAttribute("cart",null);
        String destPage = "orderPlaced.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
