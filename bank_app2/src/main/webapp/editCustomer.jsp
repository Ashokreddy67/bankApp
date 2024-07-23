<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 200px;
            background: #0000FF; /* Background color changed to blue */
            color: #fff;
            height: 100vh;
            padding-top: 50px; /* Increased top padding to push links down */
            position: fixed;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            text-transform: uppercase;
            font-size: 16px;
            margin-top: 10px; /* Added margin to separate links */
        }
        .sidebar a:hover {
            background: #575757;
        }
        .sidebar i {
            margin-right: 10px; /* Space between icon and text */
        }
        .main {
            margin-left: 200px;
            padding: 20px;
            flex-grow: 1;
        }
        header {
            background: #333;
            color: #fff;
            padding: 10px 20px;
            border-bottom: #77b300 3px solid;
            position: fixed;
            width: calc(100% - 200px);
            z-index: 1000;
        }
        header h1 {
            margin: 0;
        }
        .container {
            margin-top: 60px;
        }
        .button {
            height: 38px;
            padding-left: 20px;
            padding-right: 20px;
            color: #fff;
            border: 0;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            text-transform: uppercase;
            margin: 10px 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .button-blue {
            background-color: #333;
        }
        .button-blue:hover {
            background-color: red;
        }
        .button-green {
            background-color: #28a745;
        }
        .button-green:hover {
            background-color: red;
        }
        .button-red {
            background-color: #dc3545;
        }
        .button-red:hover {
            background-color: red;
        }
        .button-orange {
            background-color: #fd7e14;
        }
        .button-orange:hover {
            background-color: red;
        }
        .button-brown {
            background-color: #8B4513; /* Register button color changed to brown */
        }
        .button-brown:hover {
            background-color: #A0522D; /* Darker shade of brown on hover */
        }
        .content {
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        form {
            margin: 20px 0;
        }
        label, input, select {
            display: block;
            margin-bottom: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .large-button {
            font-size: 18px;
            padding: 15px 25px;
        }
        .form-container {
            margin-top: 20px;
            text-align: center;
        }
        .form-container input[type=text] {
            padding: 8px;
            margin: 0 auto 10px auto; /* Center input box */
            display: block;
            width: 300px; /* Adjust width as needed */
        }
        .form-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0000FF; /* Changed button color to blue */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #0000CC; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="sidebar">
          <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
<a href="admindashboard.jsp"><i class="fas fa-user-plus"></i> Register Customer</a>
<a href="customerDetails.html"><i class="fas fa-user"></i> Customer Details</a>
<a href="editCustomer.jsp"><i class="fas fa-edit"></i> Edit Account</a>
<a href="AllcustomerDetails.jsp"><i class="fas fa-list"></i> All Customer Details</a>
<a href="del.jsp" onclick="return confirm('Are you sure you want to delete this customer?');"><i class="fas fa-trash"></i> Delete Account</a>
<a href="index.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="main">
        <header>
            <h1>Admin Dashboard</h1>
        </header>
        <div class="container">
            <h2>Enter Customer Account No</h2>
            <form action="verifyAccountNumber" method="get">
                <label for="AccountNo">Account No:</label>
                <input type="text" id="AccountNo" name="accountNo" required>
                <br><br>
                <input type="submit" value="Verify" class="button button-blue">
            </form>
        </div>
    </div>
</body>
</html>
