package model;

import java.sql.*;
import java.util.ArrayList;

public class orderDAO {
    public String doSave(orderBean order) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO orders (Username ,orderTotal, OrderItem) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getUsername());
            ps.setString(2, order.getOrderTotal());
            ps.setString(3, order.getOrderItem());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int ordernumber = rs.getInt(1);
            order.setOrdernumber(ordernumber);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return"success";
    }
    public ArrayList<orderBean> listOrder(String email)
    {
        ArrayList<orderBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select * from orders where Username="+email);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                orderBean order = new orderBean();
                order.setUsername(rs.getString("Username"));
                order.setOrderitem(rs.getString("orderItem"));
                order.setOrdernumber(rs.getInt("orderNumber"));
                order.setTotal(rs.getString("orderTotal"));
                list.add(order);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
