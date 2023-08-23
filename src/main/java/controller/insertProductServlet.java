package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.productDAO;
import model.productBean;

import java.io.IOException;

@WebServlet(name = "insertproduct", value = "/insertproduct")
public class insertProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productBean p= new productBean();
        String productname = request.getParameter("product_name");
        String variant = request.getParameter("product_variant");
        double price = Double.parseDouble(request.getParameter("product_price"));
        String qty = request.getParameter("product_qty");
        String brand = request.getParameter("product_brand");
        String category = request.getParameter("product_category");
        String img1 = request.getParameter("product_img1");
        String img2 = request.getParameter("product_img2");
        String img3 = request.getParameter("product_img3");
        int size = Integer.parseInt(request.getParameter("size"));
        String description = request.getParameter("product_description");

        p.setProductname(productname);
        p.setVariant(variant);
        p.setPrice(price);
        p.setQty(Integer.parseInt(qty));
        p.setBrand(brand);
        p.setCategory(category);
        p.setImg1(img1);
        p.setImg2(img2);
        p.setImg3(img3);
        p.setSize(size);
        p.setDescription(description);
        productDAO item_dao= new productDAO();
        item_dao.addProductDB(p);
        String destPage="insertProduct.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);

    }
}
