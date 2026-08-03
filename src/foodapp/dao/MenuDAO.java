package foodapp.dao;

import foodapp.dao.model.MenuItem;
import foodapp.dao.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

    public class MenuDAO {

        public List<MenuItem> getAllAvailableItems() {
            List<MenuItem> items = new ArrayList<>();
            String query = "SELECT * FROM menu_items WHERE is_available = TRUE";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    items.add(mapRow(rs));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return items;
        }

        public List<MenuItem> getItemsByCategory(String category) {
            List<MenuItem> items = new ArrayList<>();
            String query = "SELECT * FROM menu_items WHERE category = ? AND is_available = TRUE";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query)) {

                pstmt.setString(1, category);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        items.add(mapRow(rs));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return items;
        }

        public boolean addMenuItem(MenuItem item, int restaurantId) {
            String query = "INSERT INTO menu_items (restaurant_id, name, description, price, category, is_available) VALUES (?, ?, ?, ?, ?, ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query)) {

                pstmt.setInt(1, restaurantId);
                pstmt.setString(2, item.getName());
                pstmt.setString(3, item.getDescription());
                pstmt.setDouble(4, item.getPrice());
                pstmt.setString(5, item.getCategory());
                pstmt.setBoolean(6, item.isAvailable());

                return pstmt.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }

        private MenuItem mapRow(ResultSet rs) throws SQLException {
            return new MenuItem(
                    rs.getInt("item_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("category"),
                    rs.getBoolean("is_available")
            );
        }
    }
