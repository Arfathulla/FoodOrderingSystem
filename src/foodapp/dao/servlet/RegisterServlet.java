package foodapp.dao.servlet;

import foodapp.dao.UserDAO;
import foodapp.dao.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // TEMPORARY DEBUG - remove once fixed
        System.out.println("=== Registration form data received ===");
        Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String name = paramNames.nextElement();
            System.out.println(name + " = " + request.getParameter(name));
        }
        System.out.println("========================================");

        String password = request.getParameter("password");
        String email = request.getParameter("email");

        if (password == null || password.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "All required fields must be filled in.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));

        boolean success = userDAO.registerUser(user);

        if (success) {
            request.setAttribute("message", "Registration successful. Please login.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed. Email may already be in use.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}