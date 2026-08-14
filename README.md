# QuickBite — Online Food Ordering 

A full-stack online food ordering web application built with **Java Servlets, JSP, and MySQL**, following the traditional MVC architecture. Users can register, browse a restaurant's menu, manage a cart, place orders, and track order history. Admins can manage menu items and update order statuses.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java |
| Web Layer | Servlets + JSP (JSTL-free, scriptlet-based) |
| Database | MySQL 8 |
| DB Access | JDBC (raw `PreparedStatement`, DAO pattern) |
| Server | Apache Tomcat 9.0.120 |
| Build/IDE | IntelliJ IDEA (Community Edition) |
| Email | Jakarta Mail (Gmail SMTP) — for password reset |

---

## Features

- **User Authentication**
  - Registration with SHA-256 password hashing
  - Login/logout with session management
  - Forgot password flow with emailed reset link (token-based, 30-minute expiry)
- **Menu Browsing**
  - View available items, filter by category
- **Cart**
  - Add/remove items, quantity adjustment, session-based cart storage
- **Checkout & Orders**
  - Place orders with a chosen payment method (COD / Card / UPI)
  - Transactional order placement (rollback on failure)
  - Order history for logged-in users
- **Admin Panel**
  - Add new menu items
  - View all orders and update order status (Placed → Preparing → Out for Delivery → Delivered / Cancelled)

---

## Project Structure

```
FoodOrderingSystem/
├── src/
│   └── foodapp/dao/
│       ├── model/          # User, MenuItem, CartItem, Order, OrderItem
│       ├── servlet/        # All @WebServlet classes
│       ├── util/           # DBConnection, EmailUtil
│       ├── UserDAO.java
│       ├── MenuDAO.java
│       ├── CartDAO.java
│       └── OrderDAO.java
├── web/
│   ├── *.jsp                # All view pages
│   └── WEB-INF/
│       ├── web.xml
│       └── lib/              # mysql-connector-j, jakarta.mail jars
└── README.md
```

---

## Database Schema

Core tables: `users`, `restaurants`, `menu_items`, `cart`, `orders`, `order_items`, `payments`.

Key relationships:
- `orders.user_id` → `users.user_id`
- `orders.restaurant_id` → `restaurants.restaurant_id`
- `order_items.order_id` → `orders.order_id`
- `order_items.item_id` → `menu_items.item_id`
- `menu_items.restaurant_id` → `restaurants.restaurant_id`

> Full `CREATE TABLE` statements are in `schema.sql` (or see project setup notes below).

---

## Setup Instructions

### 1. Prerequisites
- JDK 17+ (project tested on JDK 26)
- Apache Tomcat 9.x
- MySQL 8.x
- IntelliJ IDEA (Community Edition + **Smart Tomcat** plugin, or Ultimate)

### 2. Database Setup
```sql
CREATE DATABASE food_ordering_db;
USE food_ordering_db;
-- Run all CREATE TABLE statements from schema.sql
```

Insert at least one restaurant (required — `restaurant_id = 1` is hardcoded in servlets):
```sql
INSERT INTO restaurants (name, address, rating)
VALUES ('QuickBite', '123 Main Street', 4.5);
```

Add the password reset columns:
```sql
ALTER TABLE users
ADD COLUMN reset_token VARCHAR(255) NULL,
ADD COLUMN reset_token_expiry TIMESTAMP NULL;
```

### 3. Configure Database Connection
Edit `src/foodapp/dao/util/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/food_ordering_db";
private static final String USER = "root";
private static final String PASSWORD = "yourpassword";
```

### 4. Configure Email (for password reset)
Edit `src/foodapp/dao/util/EmailUtil.java` with a Gmail address and an **App Password** (requires 2-Step Verification enabled on the Google account):
```java
private static final String FROM_EMAIL = "youremail@gmail.com";
private static final String APP_PASSWORD = "your16charapppassword";
```

### 5. Add Required JARs
Place these inside `web/WEB-INF/lib/` (and add as project dependencies in IntelliJ):
- `mysql-connector-j-9.7.0.jar` — **Compile** scope
- `jakarta.mail-2.0.1.jar` — **Compile** scope
- `servlet-api.jar` (from Tomcat's own `lib/`) — **Provided** scope, project dependency only, do **not** copy into `WEB-INF/lib`

### 6. Run
1. Configure a **Smart Tomcat** run configuration pointing at your Tomcat install and the `web/` deployment directory
2. Build the project
3. Run, then visit:
   ```
   http://localhost:8080/FoodOrderingSystem/
   ```

### 7. Create an Admin Account
Register normally through the UI, then promote the account via SQL:
```sql
UPDATE users SET role = 'ADMIN' WHERE email = 'your_registered_email@example.com';
```

---

## Default Test Flow

1. Register → Login
2. Browse `/menu` → Add items to cart
3. `/cart` → Proceed to Checkout
4. Confirm order → View in `/orderHistory`
5. Log in as an ADMIN account → `/admin` → add menu items, update order statuses

---

## Known Limitations

- Single-restaurant setup (`restaurant_id` hardcoded to `1`)
- No real payment gateway integration (payment method is recorded, not processed)
- Passwords hashed with SHA-256 (not salted) — fine for a college/demo project, not production-grade
- Session-based cart is lost on logout/session expiry (not persisted to DB)

---

## Author
--> Arfathulla

Built as a Java + MySQL academic/demo project using Servlets, JSP, and JDBC with the DAO/MVC pattern.
