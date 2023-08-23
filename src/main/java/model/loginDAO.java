package model;
import java.sql.*;

public class loginDAO {
    public loginBean doCheck(loginBean credential) {
        loginBean l = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("select * from credentials where Mail=? and Password=?");
            ps.setString(1, credential.getEmail());
            ps.setString(2, credential.getPwd());
            ResultSet result = ps.executeQuery();
            l = null;
            if (result.next()) {
                l = new loginBean();
                l.setEmail(result.getString("Mail"));
                l.setPwd(result.getString("Password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return l;
    }
    public void doRemove(String mail) {
        Statement st;
        try (Connection con = ConPool.getConnection()) {
            st= con.createStatement();
            st.executeUpdate("delete from credentials where Mail ='"+mail+"'");
            return;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}