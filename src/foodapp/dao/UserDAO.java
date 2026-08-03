package foodapp.dao;

import foodapp.dao.model.User;
import foodapp.dao.util.DBConnection;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

    public class UserDAO {

        public boolean registerUser(User user) {
            String query = "INSERT INTO users (name, email, password_hash, phone, address) VALUES (?, ?, ?, ?, ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query)) {

                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getEmail());
                pstmt.setString(3, hashPassword(user.getPassword()));
                pstmt.setString(4, user.getPhone());
                pstmt.setString(5, user.getAddress());

                return pstmt.executeUpdate() > 0;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }

        public User validateLogin(String email, String password) {
            String query = "SELECT * FROM users WHERE email = ? AND password_hash = ?";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(query)) {

                pstmt.setString(1, email);
                pstmt.setString(2, hashPassword(password));

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        User user = new User();
                        user.setUserId(rs.getInt("user_id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setRole(rs.getString("role"));
                        return user;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        // Simple SHA-256 hashing — for a real app use BCrypt instead
        private String hashPassword(String password) throws NoSuchAlgorithmException {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        }
    }
