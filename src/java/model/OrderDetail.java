/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author BEAN
 */
public class OrderDetail {


    private int orderid;
    private int product_id;
    private String product_name;
    private int price;
    private int amount;

    public OrderDetail() {
    }

    public OrderDetail( int orderid, int product_id, String product_name, int price, int amount) {

        this.orderid = orderid;
        this.product_id = product_id;
        this.product_name = product_name;
        this.price = price;
        this.amount = amount;
    }


    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }


    
}
