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
        .details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }
        .detail-item {
            background-color: #ffffff;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            min-width: 250px;
            display: flex;
            align-items: center;
        }
        .detail-item i {
            margin-right: 10px;
            color: #333;
        }
        .detail-item p {
            margin: 5px 0;
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
        <a href="closedash.jsp"><i class="fas fa-user-times"></i>Close Account</a>
        <a href="index.html"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

    <div class="dashboard">
        <h1>Welcome, ${customer.name}!</h1>
        <div class="details">
            <div class="detail-item">
                <i class="fas fa-id-card"></i>
                <p><strong>Account Number:</strong> ${customer.accountNo}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-envelope"></i>
                <p><strong>Email:</strong> ${customer.email}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-calendar-day"></i>
                <p><strong>Date of Birth:</strong> ${customer.dob}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-home"></i>
                <p><strong>Address:</strong> ${customer.address}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-phone"></i>
                <p><strong>Phone:</strong> ${customer.phone}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-genderless"></i>
                <p><strong>Gender:</strong> ${customer.gender}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-wallet"></i>
                <p><strong>Account Type:</strong> ${customer.accountType}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-calendar-check"></i>
                <p><strong>Join Date:</strong> ${customer.joinDate}</p>
            </div>
            <div class="detail-item">
                <i class="fas fa-money-bill-wave"></i>
                <p><strong>Balance:</strong> ${customer.balance}</p>
            </div>
        </div>
    </div>
</body>
</html>
