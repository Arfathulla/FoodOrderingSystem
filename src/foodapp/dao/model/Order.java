package foodapp.dao.model;

import java.sql.Timestamp;
import java.util.List;

public class Order {
    private int order_id;
    private int user_id;
    private int restaurants_id;
    private double total_amount;
    private String status;
    private Timestamp order_date;
    private List<OrderItem> order_items;

    public Order() {}

    public int getOrderId() { return order_id; }
    public void setOrderId(int order_id) { this.order_id = order_id; }
    public int getUserId() { return user_id; }
    public void setUserId(int user_id) { this.user_id = user_id; }
    public int getRestaurantId() { return restaurants_id; }
    public void setRestaurantId(int restaurants_id) { this.restaurants_id = restaurants_id; }
    public double getTotal_amount() { return total_amount; }
    public void setTotal_amount(double total_amount) { this.total_amount = total_amount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Timestamp getOrder_date() { return order_date; }
    public void setOrder_date(Timestamp order_date) { this.order_date = order_date; }
    public List<OrderItem> getOrderItems() { return order_items; }
    public void setOrderItems(List<OrderItem> order_items) { this.order_items = order_items; }
}
