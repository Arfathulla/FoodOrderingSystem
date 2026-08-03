package foodapp.dao.servlet;

import foodapp.dao.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int itemId = Integer.parseInt(request.getParameter("itemId"));

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(ci -> ci.getMenuItem().getItemId() == itemId);
        }

        response.sendRedirect("cart.jsp");
    }
}