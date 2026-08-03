package foodapp.dao.servlet;

import foodapp.dao.MenuDAO;
import foodapp.dao.OrderDAO;
import foodapp.dao.model.MenuItem;
import foodapp.dao.model.Order;
import foodapp.dao.model.User;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAO();
    private OrderDAO orderDAO = new OrderDAO();
    private static final int DEFAULT_RESTAURANT_ID = 1;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<MenuItem> items = menuDAO.getAllAvailableItems();
        List<Order> orders = orderDAO.getAllOrders();
        request.setAttribute("menuItems", items);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("addItem".equals(action)) {
            MenuItem item = new MenuItem();
            item.setName(request.getParameter("name"));
            item.setDescription(request.getParameter("description"));
            item.setPrice(Double.parseDouble(request.getParameter("price")));
            item.setCategory(request.getParameter("category"));
            item.setAvailable(true);
            menuDAO.addMenuItem(item, DEFAULT_RESTAURANT_ID);

        } else if ("updateStatus".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");
            orderDAO.updateOrderStatus(orderId, status);
        }

        response.sendRedirect("admin");
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return false;
        User user = (User) session.getAttribute("user");
        return user != null && "ADMIN".equals(user.getRole());
    }
}