package bank.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.dao.Customer;
import bank.dao.CustomerDetailsDAO;

@WebServlet("/GetCustomerDetailsServlet")
public class GetCustomerDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNoStr = request.getParameter("accountNo");
        if (accountNoStr == null || accountNoStr.isEmpty()) {
            // Handle case where account number is not provided
            response.getWriter().println("Account number is required.");
            return;
        }

        try {
            long accountNo = Long.parseLong(accountNoStr);

            CustomerDetailsDAO customerDetailsDAO = new CustomerDetailsDAO();
            List<Customer> customers = customerDetailsDAO.getCustomerDetails(accountNo);

            if (customers.isEmpty()) {
                response.getWriter().println("No customer found for account number: " + accountNo);
                return;
            }

            request.setAttribute("customers", customers);
            request.getRequestDispatcher("customerDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid account number format.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving customer details.");
        }
    }
}
