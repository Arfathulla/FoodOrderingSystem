package foodapp.dao.servlet;

import foodapp.dao.MenuDAO;
import foodapp.dao.model.MenuItem;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        List<MenuItem> items;

        if (category != null && !category.isEmpty()) {
            items = menuDAO.getItemsByCategory(category);
        } else {
            items = menuDAO.getAllAvailableItems();
        }

        request.setAttribute("menuItems", items);
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }
}