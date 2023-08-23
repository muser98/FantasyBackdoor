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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "login",value="/login")
public class LoginCheck extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        loginBean test= new loginBean();
        test.setEmail(email);
        test.setPwd(password);
        loginDAO l = new loginDAO();

        try {
            loginBean credentials = l.doCheck(test);
            String destPage = "Access%20Page.jsp";
            if (credentials != null) {
                UserBean user = null;
                try (Connection con = ConPool.getConnection()) {
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM userDB WHERE Mail='" + email + "'and Password='" + password + "'");
                    ResultSet rs = ps.executeQuery();
                    rs.next();
                    user = new UserBean();
                    user.setName(rs.getString(1));
                    user.setSurname(rs.getString(2));
                    user.setAddress1(rs.getString(3));
                    user.setAddress2(rs.getString(4));
                    user.setCity(rs.getString(5));
                    user.setState(rs.getString(6));
                    user.setZip(rs.getString(7));
                    user.setCountry(rs.getString(8));
                    user.setEmail(rs.getString(9));
                    user.setPassword(rs.getString(10));
                    user.setId(rs.getInt(11));

                    request.setAttribute("user", user);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                Date d = new Date();
                HttpSession session = request.getSession();
                session.setAttribute("date",d);
                session.setAttribute("user", user);
                session.getAttribute("cart");
                destPage = "/userPage.jsp";
            } else {
                String message = "Invalid email or password";
                request.setAttribute("message", message);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
