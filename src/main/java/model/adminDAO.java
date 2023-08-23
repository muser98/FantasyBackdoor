package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminDAO {
    public adminBean doCheck(int passcode) {
        adminBean a = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("select * from admin where Passcode=?");
            ps.setInt(1, passcode);
            ResultSet result = ps.executeQuery();
            a = null;
            if (result.next()) {
                a = new adminBean();
                a.setName(result.getString("Name"));
                a.setPasscode(result.getInt("Passcode"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
}
