package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserBean;
import model.UserDAO;

import java.io.IOException;

@WebServlet("/registrazione-utente-servlet")
public class RegistraUtente extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String zip = request.getParameter("zip");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        UserBean u = new UserBean();

        u.setName(name);
        u.setSurname(surname);
        u.setEmail(email);
        u.setPassword(password);
        u.setAddress1(address1);
        u.setAddress2(address2);
        u.setCity(city);
        u.setZip(zip);
        u.setCountry(country);
        u.setState(state);

        UserDAO utenteDAO = new UserDAO();

        String a=utenteDAO.doSave(u);
        if(a=="success") {
            request.setAttribute("user", u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EsitoReg.jsp");
            dispatcher.forward(request, response);
        }else if(a=="duplicate"){
            request.setAttribute("message","This Username already exist!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Registration%20page.jsp");
            dispatcher.forward(request, response);
        }


    }
}
