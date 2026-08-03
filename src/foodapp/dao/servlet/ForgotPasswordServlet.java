package foodapp.dao.servlet;

import foodapp.dao.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {



    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());

        StringBuilder sb = new StringBuilder();

        for (byte b : hash) {
            sb.append(String.format("%02x", b));
        }

        return sb.toString();
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE users SET password_hash=? WHERE email=?");

            ps.setString(1, hashPassword(password));
            ps.setString(2, email);

            int i = ps.executeUpdate();

            if(i>0){
                response.sendRedirect("login.jsp");
            }else{
                request.setAttribute("error","Email not found");
                request.getRequestDispatcher("forgotPassword.jsp")
                        .forward(request,response);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

    }
}