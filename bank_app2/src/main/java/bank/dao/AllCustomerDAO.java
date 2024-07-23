package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AllCustomerDAO {
    private Connection connection;

    public AllCustomerDAO(Connection connection) {
        this.connection = connection;
    }

    public List<allCustomer> getAllCustomers() throws SQLException {
        List<allCustomer> customers = new ArrayList<>();
        String sql = "SELECT AccountNo, Name, Password, Email, DOB, Address, Phone, Gender, AccountType, JoinDate FROM customer";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                allCustomer customer = new allCustomer();
                customer.setAccountNo(resultSet.getInt("AccountNo"));
                customer.setName(resultSet.getString("Name"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setDob(resultSet.getString("DOB"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setGender(resultSet.getString("Gender"));
                customer.setAccountType(resultSet.getString("AccountType"));
                customer.setJoinDate(resultSet.getString("JoinDate"));

                customers.add(customer);
            }
        }
        return customers;
    }
}
