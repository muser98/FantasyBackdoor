package model;

import java.util.Objects;

public class orderBean {
    public String username;
    public int ordernumber;
    public String total;
    public String orderitem;

    public orderBean() {
        this.username = username;
        this.total = total;
        this.ordernumber= ordernumber;
        this.orderitem = orderitem;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getOrderNumber() {
        return ordernumber;
    }

    public void setOrdernumber(int ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getOrderTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getOrderItem() {
        return orderitem;
    }
    public void setOrderitem(String orderitem) {
        this.orderitem = orderitem;
    }

    @Override
    public String toString() {
        return "orderBean{" +
                "username='" + username + '\'' +
                ", ordernumber=" + ordernumber +
                ", total=" + total +
                ", orderitem='" + orderitem + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof orderBean)) return false;
        orderBean orderBean = (orderBean) o;
        return ordernumber == orderBean.ordernumber && Objects.equals(getUsername(), orderBean.getUsername()) && Objects.equals(total, orderBean.total) && Objects.equals(orderitem, orderBean.orderitem);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUsername(), getOrderNumber(), getOrderTotal(), getOrderItem());
    }
}
