package model;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    public String doSave(UserBean user) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO userDB (Name ,Surname, Address1, Address2, City, State, Zip, Mail, Password, Country) VALUES(?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getSurname());
            ps.setString(3, user.getAddress1());
            ps.setString(4, user.getAddress2());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getState());
            ps.setString(7, user.getZip());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPassword());
            ps.setString(10, user.getCountry());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO credentials (Mail ,Password) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS);
            ps1.setString(1, user.getEmail());
            ps1.setString(2, user.getPassword());
            if (ps1.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            user.setId(id);
        }catch (SQLIntegrityConstraintViolationException e) {
            return "duplicate";
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return"success";
    }

    public void doRemove(int id) {
        Statement st;
        try (Connection con = ConPool.getConnection()) {
            st= con.createStatement();
            st.executeUpdate("delete from userdb where id="+id);
            return;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<UserBean> listUser()
    {
        ArrayList<UserBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select * from userdb");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                UserBean user = new UserBean();
                user.setName(rs.getString("Name"));
                user.setSurname(rs.getString("Surname"));
                user.setAddress1(rs.getString("Address1"));
                user.setAddress2(rs.getString("Address2"));
                user.setCity(rs.getString("City"));
                user.setState(rs.getString("State"));
                user.setZip(rs.getString("Zip"));
                user.setCountry(rs.getString("Country"));
                user.setEmail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password"));
                user.setId(rs.getInt("id"));
                list.add(user);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}