<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
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
        .navbar {
            background-color: #192a56;
            overflow: hidden;
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 80px;
        }
        .navbar a {
            display: flex;
            align-items: center;
            color: white;
            padding: 16px;
            text-decoration: none;
            font-size: 18px;
            text-align: left;
        }
        .navbar a i {
            margin-right: 10px;
        }
        .navbar a:hover {
            background-color: #273c75;
        }
        .dashboard {
            margin-left: 250px;
            padding: 20px;
        }
        .dashboard h1 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-container {
            text-align: center;
            background: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            margin-bottom: 20px;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
        }
        .form-container input[type="text"],
        .form-container input[type="number"] {
            margin-bottom: 10px;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .form-container button {
            width: 80px;
            height: 45px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="title">
        CUSTOMER DASHBOARD
    </div>

    <div class="navbar">
        <a href="customerdashboard.jsp"><i class="fas fa-home"></i>Home</a>
        <a href="deposit.jsp"><i class="fas fa-credit-card"></i>Deposit</a>
        <a href="withdraw.jsp"><i class="fas fa-minus-circle"></i>Withdraw</a>
        <a href="viewTransaction.jsp"><i class="fas fa-history"></i>View Transactions</a>
        <a href="resetPassword.jsp"><i class="fas fa-key"></i>Reset Password</a>
        <a href="CloseAccount.jsp"><i class="fas fa-user-times"></i>Close Account</a>
        <a href="index.html"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

    <div class="dashboard">
        <h1>Welcome, ${customer.name}!</h1>

        <div class="form-container">
            <h1>Deposit</h1>
            <form action="DepositServlet" method="post">
                <input type="hidden" name="accountNo" value="${customer.accountNo}">
                <input type="number" name="depositAmount" placeholder="Amount to Deposit" required min="0">
                <button type="submit">Submit</button>
            </form>
        </div>

    </div>

</body>
</html>
