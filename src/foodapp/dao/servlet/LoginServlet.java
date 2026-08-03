package foodapp.dao.servlet;

import foodapp.dao.UserDAO;
import foodapp.dao.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.validateLogin(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("menu");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
