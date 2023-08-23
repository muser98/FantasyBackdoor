package model;

import java.sql.*;
import java.util.ArrayList;

public class productDAO {
    public ArrayList<productBean> showAll()
    {
        ArrayList<productBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select ProductName,Price,img1,VariantID from productdb where `VariantID` like '%40%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                productBean product = new productBean();
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setVariant(rs.getString("VariantID"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public productBean selectItem(String variantID){
        productBean product = new productBean();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select * from productdb where `VariantID` like '%"+variantID+"'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setImg2(rs.getString("img2"));
                product.setImg3(rs.getString("img3"));
                product.setBrand(rs.getString("Brand"));
                product.setCategory(rs.getString("Category"));
                product.setDescription(rs.getString("Description"));
                product.setVariant(variantID);
            }
            return product;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<productBean> search(String name)
    {
        ArrayList<productBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select ProductName,Price,img1,VariantID from productdb where `ProductName` like '%"+name+"%' and VariantId like '%40%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                productBean product = new productBean();
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setVariant(rs.getString("VariantID"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static productBean selectItemsize(String variant, int size){

        productBean product = new productBean();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select * from productdb where `VariantID` like '%"+variant+"%' and `Size` like '%"+size+"%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setImg2(rs.getString("img2"));
                product.setImg3(rs.getString("img3"));
                product.setBrand(rs.getString("Brand"));
                product.setCategory(rs.getString("Category"));
                product.setVariant(rs.getString("VariantID"));
                product.setSize(rs.getInt("Size"));
                product.setQty(rs.getInt("Amount"));
            }
            return product;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<productBean> showAllM()
    {
        ArrayList<productBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select ProductName,Price,img1,VariantID from productdb where `Category` like '%M%'and `VariantId` like '%40%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                productBean product = new productBean();
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setVariant(rs.getString("VariantID"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<productBean> showAllW()
    {
        ArrayList<productBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select ProductName,Price,img1,VariantID from productdb where `Category` like '%W%' and `VariantId` like '%40%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                productBean product = new productBean();
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setVariant(rs.getString("VariantID"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addProductDB(productBean product) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO productdb (ProductName,VariantID,Price,Amount,Brand,Category,img1,img2,img3,Size,Description) VALUES(?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, product.getProductname());
            ps.setString(2, product.getVariant());
            ps.setDouble(3,product.getPrice());
            ps.setInt(4, product.getQty());
            ps.setString(5, product.getBrand());
            ps.setString(6,product.getCategory());
            ps.setString(7, product.getImg1());
            ps.setString(8, product.getImg2());
            ps.setString(9, product.getImg3());
            ps.setInt(10, product.getSize());
            ps.setString(11, product.getDescription());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void addQty(String variant,int qty) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps=con.prepareStatement("select Amount from userdb where VariantID="+variant);
            ps.execute("update productdb set Amount="+qty+" where VariantID='"+variant+"'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void minusQty(String variant,int qty) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps=con.prepareStatement("select Amount from userdb where VariantID="+variant);
            ps.execute("update productdb set Amount="+qty+" where VariantID='"+variant+"'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<productBean> listProduct()
    {
        ArrayList<productBean> list = new ArrayList<>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("select * from productdb");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                productBean product = new productBean();
                product.setProductname(rs.getString("ProductName"));
                product.setPrice((rs.getDouble("Price")));
                product.setImg1(rs.getString("img1"));
                product.setImg2(rs.getString("img2"));
                product.setImg3(rs.getString("img3"));
                product.setQty(rs.getInt("Amount"));
                product.setBrand(rs.getString("Brand"));
                product.setCategory(rs.getString("Category"));
                product.setVariant(rs.getString("VariantID"));
                product.setDescription(rs.getString("Description"));
                product.setSize(rs.getInt("Size"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void removeProductDB(String id) {
        Statement st;
        try (Connection con = ConPool.getConnection()) {
            st= con.createStatement();
            st.executeUpdate("delete from productdb where VariantID like '%"+id+"%'");
            return;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
