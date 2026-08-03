package foodapp.dao.servlet;

import foodapp.dao.OrderDAO;
import foodapp.dao.model.CartItem;
import foodapp.dao.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private static final int DEFAULT_RESTAURANT_ID = 1; // adjust if multi-restaurant

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show checkout summary page before confirming
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("error", "Your cart is empty.");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }

        int orderId = orderDAO.placeOrder(user.getUserId(), DEFAULT_RESTAURANT_ID, cart);

        if (orderId != -1) {
            session.removeAttribute("cart"); // clear cart after successful order
            request.setAttribute("orderId", orderId);
            request.getRequestDispatcher("/orderConfirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Something went wrong while placing your order.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        }
    }
}