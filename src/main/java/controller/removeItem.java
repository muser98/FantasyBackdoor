package controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.productBean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name="removeItem", value = "/removeItem")
public class removeItem extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String variant= request.getParameter("variant");
        System.out.println(variant+"\n");
        HttpSession session = request.getSession();
        ArrayList<productBean> cart = (ArrayList<productBean>) session.getAttribute("cart");
        System.out.print(cart.toString());
        int  i=0;
        if(cart.size()==1){
            session.setAttribute("cart",null);
        }else{
            for(productBean p : cart){
                if(Objects.equals(variant, cart.get(i).getVariant())){
                    System.out.print("\nfound\n");
                    cart.remove(i);
                    session.setAttribute("cart",cart);
                    break;
                }else{
                    System.out.print("\nnot found\n");
                    i=i+1;
                }
            }
        }
        System.out.print(i);
        String destPage="/Cart.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}