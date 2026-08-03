package foodapp.dao;

import foodapp.dao.model.*;
import foodapp.dao.util.DBConnection;
import foodapp.dao.model.CartItem;
import foodapp.dao.model.Order;
import foodapp.dao.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // Places an order and its line items as a single DB transaction
    public int placeOrder(int userId, int restaurantId, List<CartItem> cartItems) {
        String orderQuery = "INSERT INTO orders (user_id, restaurant_id, total_amount, status) VALUES (?, ?, ?, 'PLACED')";
        String itemQuery = "INSERT INTO order_items (order_id, item_id, quantity, price_at_order) VALUES (?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // start transaction

            double total = 0;
            for (CartItem ci : cartItems) {
                total += ci.getLineTotal();
            }

            int orderId;
            try (PreparedStatement pstmt = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS)) {
                pstmt.setInt(1, userId);
                pstmt.setInt(2, restaurantId);
                pstmt.setDouble(3, total);
                pstmt.executeUpdate();

                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    } else {
                        throw new SQLException("Failed to retrieve order ID");
                    }
                }
            }

            try (PreparedStatement pstmt = conn.prepareStatement(itemQuery)) {
                for (CartItem ci : cartItems) {
                    pstmt.setInt(1, orderId);
                    pstmt.setInt(2, ci.getMenuItem().getItemId());
                    pstmt.setInt(3, ci.getQuantity());
                    pstmt.setDouble(4, ci.getMenuItem().getPrice());
                    pstmt.addBatch();
                }
                pstmt.executeBatch();
            }

            conn.commit(); // all-or-nothing
            return orderId;

        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            return -1;
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
        }
    }

    public List<Order> getOrdersByUser(int userId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setRestaurantId(rs.getInt("restaurant_id"));
                    order.setTotal_amount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setOrder_date(rs.getTimestamp("order_date"));
                    order.setOrderItems(getOrderItems(order.getOrderId()));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String query = "SELECT oi.*, mi.name AS item_name FROM order_items oi " +
                "JOIN menu_items mi ON oi.item_id = mi.item_id WHERE oi.order_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, orderId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem oi = new OrderItem();
                    oi.setOrderItemId(rs.getInt("order_item_id"));
                    oi.setItemId(rs.getInt("item_id"));
                    oi.setItemName(rs.getString("item_name"));
                    oi.setQuantity(rs.getInt("quantity"));
                    oi.setPriceAtOrder(rs.getDouble("price_at_order"));
                    items.add(oi);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // For admin: view/update all orders
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders ORDER BY order_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotal_amount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean updateOrderStatus(int orderId, String status) {
        String query = "UPDATE orders SET status = ? WHERE order_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}