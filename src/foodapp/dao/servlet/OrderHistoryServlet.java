package foodapp.dao.servlet;

import foodapp.dao.OrderDAO;
import foodapp.dao.model.Order;
import foodapp.dao.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = orderDAO.getOrdersByUser(user.getUserId());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/orderHistory.jsp").forward(request, response);
    }
}
