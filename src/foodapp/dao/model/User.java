package foodapp.dao.model;

public class User {
    private int user_id;
    private String name;
    private String email;
    private String password_hash; // used only for input, not stored as-is
    private String phone;
    private String address;
    private String role;

    public User() {}

    // Getters and setters
    public int getUserId() { return user_id; }
    public void setUserId(int user_id) { this.user_id = user_id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password_hash; }
    public void setPassword(String password_hash) { this.password_hash = password_hash; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
