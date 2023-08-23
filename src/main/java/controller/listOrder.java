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
@WebServlet(name = "listorder", value = "/listorder")
public class listOrder extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        ArrayList<orderBean> orderlist = new ArrayList<>();
        orderDAO dao = new orderDAO();
        orderlist= dao.listOrder(email);
        System.out.print(orderlist.toString());
        HttpSession session= request.getSession();
        if(orderlist.isEmpty()==true){
            session.setAttribute("orderList", null);
            RequestDispatcher req = request.getRequestDispatcher("listOrder.jsp");
            req.forward(request, response);
        }else{
            session.setAttribute("orderList", orderlist);
            RequestDispatcher req = request.getRequestDispatcher("listOrder.jsp");
            req.forward(request, response);
        }
    }

}
