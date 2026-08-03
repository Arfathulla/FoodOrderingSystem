package foodapp.dao.servlet;

import foodapp.dao.MenuDAO;
import foodapp.dao.model.CartItem;
import foodapp.dao.model.MenuItem;
import foodapp.dao.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Add item logic (check if already in cart, else add new)
        boolean found = false;
        for (CartItem ci : cart) {
            if (ci.getMenuItem().getItemId() == itemId) {
                ci.setQuantity(ci.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            MenuItem item = menuDAO.getAllAvailableItems().stream()
                    .filter(m -> m.getItemId() == itemId)
                    .findFirst().orElse(null);
            if (item != null) {
                cart.add(new CartItem(item, quantity));
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}