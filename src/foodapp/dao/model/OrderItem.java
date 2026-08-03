package foodapp.dao.model;

public class OrderItem {
    private int  order_item_id;
    private int item_id;
    private String itemName;
    private int quantity;
    private double price_at_order;

    public OrderItem() {}

    public int getOrderItemId() { return order_item_id; }
    public void setOrderItemId(int order_item_id) { this.order_item_id = order_item_id; }
    public int getItemId() { return item_id; }
    public void setItemId(int item_id) { this.item_id = item_id; }
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPriceAtOrder() { return price_at_order; }
    public void setPriceAtOrder(double price_at_order) { this.price_at_order = price_at_order; }

    public double getLineTotal() {
        return price_at_order * quantity;
    }
}
