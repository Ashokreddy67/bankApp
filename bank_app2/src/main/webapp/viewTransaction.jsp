<%@ page import="java.util.List" %>
<%@ page import="bank.dao.TransactionDAO" %>
<%@ page import="bank.dao.Transaction" %>
<%@ page import="com.bank.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transactions for Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .navbar {
            background-color: #192a56;
            overflow: hidden;
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 80px;
            display: flex;
            flex-direction: column;
        }
        .navbar a {
            display: flex;
            align-items: center;
            color: white;
            padding: 16px;
            text-decoration: none;
            font-size: 18px;
        }
        .navbar a i {
            margin-right: 10px;
        }
        .navbar a:hover {
            background-color: #273c75;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }
        .title {
            text-align: center;
            background-color: #333;
            color: white;
            padding: 20px 0;
            font-size: 32px;
            font-weight: bold;
            text-transform: uppercase;
            font-family: "Times New Roman", Times, serif;
            margin-bottom: 20px;
        }
        .form-container {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            margin-bottom: 20px;
        }
        .error-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #f9d6d5; /* Light red background for errors */
            color: #a94442; /* Dark red text color */
            text-align: center;
        }
        .error-table th {
            background-color: #f2b5b4; /* Slightly darker red */
        }
        .error-table td {
            padding: 15px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="customerdashboard.jsp"><i class="fas fa-home"></i>Home</a>
        <a href="deposit.jsp"><i class="fas fa-credit-card"></i>Deposit</a>
        <a href="withdraw.jsp"><i class="fas fa-minus-circle"></i>Withdraw</a>
        <a href="viewTransaction.jsp"><i class="fas fa-history"></i>View Transactions</a>
        <a href="resetPassword.jsp"><i class="fas fa-key"></i>Reset Password</a>
        <a href="CloseAccount.jsp"><i class="fas fa-user-times"></i>Close Account</a>
        <a href="index.html"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

    <div class="content">
        <div class="title">
            Transactions for Account
        </div>

        <div class="form-container">
            <% 
                Customer customer = (Customer) session.getAttribute("customer"); // Fetch customer from session
                String accountNo = null;

                if (customer != null) {
                    accountNo = customer.getAccountNo();

                    if (accountNo != null && !accountNo.isEmpty()) {
                        try {
                            TransactionDAO transactionDAO = new TransactionDAO();
                            List<Transaction> transactions = transactionDAO.getTransactionsByAccountNo(accountNo);
                            
                            if (transactions.isEmpty()) {
            %>
                                <h2>No transactions found for account: <%= accountNo %></h2>
            <%     } else { %>
                            <h2>Transactions for Account: <%= accountNo %></h2>
                            <table>
                                <tr>
                                    <th>Transaction ID</th>
                                    <th>Date and Time</th>
                                    <th>Type</th>
                                    <th>Amount</th>
                                </tr>
                                <% for (Transaction transaction : transactions) { %>
                                    <tr>
                                        <td><%= transaction.getTransactionID() %></td>
                                        <td><%= transaction.getDatetime() %></td>
                                        <td><%= transaction.getTransactionType() %></td>
                                        <td><%= transaction.getAmount() %></td>
                                    </tr>
                                <% } %>
                            </table>
            <%       }
                        } catch (Exception e) {
                            e.printStackTrace();
            %>
                            <h2>An error occurred while retrieving transactions. Please try again later.</h2>
            <%   }
                    } else {
            %>
                        <table class="error-table">
                            <tr>
                                <th>Error</th>
                            </tr>
                            <tr>
                                <td>No account number found. Please log in again.</td>
                            </tr>
                        </table>
            <%   }
                } else {
            %>
                <table class="error-table">
                    <tr>
                        <th>Error</th>
                    </tr>
                    <tr>
                        <td>No customer information found in the session. Please log in again.</td>
                    </tr>
                </table>
            <%   }
            %>
        </div>
        <!-- Add this button inside the <div class="form-container"> -->
<form action="downloadPDF" method="post">
    <button type="submit" style="padding: 10px 20px; font-size: 16px; color: #fff; background-color: #007bff; border: none; border-radius: 5px; cursor: pointer;">
        Download as PDF
    </button>
</form>
        
    </div>
</body>
</html>
