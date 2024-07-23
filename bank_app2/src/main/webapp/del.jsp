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
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .sidebar {
            width: 200px;
            background: #0000FF; /* Background color changed to blue */
            color: #fff;
            height: 100vh;
            padding-top: 50px; /* Increased top padding to push links down */
            position: fixed;
            left: 0;
            top: 0;
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
            width: calc(100% - 200px);
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
            display: flex;
            align-items: center;
            justify-content: center;
            height: calc(100vh - 60px); /* Adjust height to fit the viewport */
            margin-top: 60px;
        }
        .form-container {
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            width: 400px; /* Fixed width for the card */
            text-align: center;
        }
        label, input {
            display: block;
            margin-bottom: 10px;
            width: 100%;
        }
        input[type=text] {
            padding: 12px;
            font-size: 16px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .button-blue {
            background-color: #0000FF; /* Blue color for the button */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 12px 20px;
            font-size: 16px;
            text-transform: uppercase;
            width: 100%; /* Make button width 100% of the form */
        }
        .button-blue:hover {
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
            <div class="form-container">
                <h2>Delete Account</h2>
                <form action="DeleteAccountServlet" method="post">
                    <label for="accountNo">Account Number:</label>
                    <input type="text" id="accountNo" name="accountNo" required>
                    <br><br>
                    <input type="submit" value="Delete Account" class="button-blue">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
