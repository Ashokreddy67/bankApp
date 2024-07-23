package bank.controller;

import bank.dao.AllCustomerDAO;
import bank.dao.allCustomer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AllCustomerDetails")
public class AllCustomerServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db2";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Ashok@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Optionally load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                AllCustomerDAO allCustomerDAO = new AllCustomerDAO(connection);

                // Fetch customer details
                List<allCustomer> customers = allCustomerDAO.getAllCustomers();

                // Set the customer list as request attribute
                request.setAttribute("customers", customers);

                // Forward to JSP
                request.getRequestDispatcher("AllCustomerDetails.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found");
        }
    }
}
