package foodapp.dao;

import foodapp.dao.model.CartItem;
import foodapp.dao.model.MenuItem;
import foodapp.dao.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addToCart(int userId, int itemId, int quantity) {
        String checkQuery = "SELECT * FROM cart WHERE user_id = ? AND item_id = ?";
        String updateQuery = "UPDATE cart SET quantity = quantity + ? WHERE user_id = ? AND item_id = ?";
        String insertQuery = "INSERT INTO cart (user_id, item_id, quantity) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setInt(1, userId);
                checkStmt.setInt(2, itemId);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                            updateStmt.setInt(1, quantity);
                            updateStmt.setInt(2, userId);
                            updateStmt.setInt(3, itemId);
                            return updateStmt.executeUpdate() > 0;
                        }
                    } else {
                        try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                            insertStmt.setInt(1, userId);
                            insertStmt.setInt(2, itemId);
                            insertStmt.setInt(3, quantity);
                            return insertStmt.executeUpdate() > 0;
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<CartItem> getCartByUser(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT c.quantity, m.* FROM cart c JOIN menu_items m ON c.item_id = m.item_id WHERE c.user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MenuItem item = new MenuItem(
                            rs.getInt("item_id"), rs.getString("name"), rs.getString("description"),
                            rs.getDouble("price"), rs.getString("category"), rs.getBoolean("is_available")
                    );
                    cartItems.add(new CartItem(item, rs.getInt("quantity")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public boolean clearCart(int userId) {
        String query = "DELETE FROM cart WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() >= 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeItem(int userId, int itemId) {
        String query = "DELETE FROM cart WHERE user_id = ? AND item_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, itemId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}