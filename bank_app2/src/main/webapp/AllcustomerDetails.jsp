<%@ page import="java.util.List" %>
<%@ page import="bank.dao.allCustomer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Customer Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin: 20px 0;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h1>All Customer Details</h1>
    <table>
        <thead>
            <tr>
                <th>Account No</th>
                <th>Name</th>
                <th>Email</th>
                <th>DOB</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>Account Type</th>
                <th>Join Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<allCustomer> customers = (List<allCustomer>) request.getAttribute("customers");
                if (customers != null && !customers.isEmpty()) {
                    for (allCustomer customer : customers) {
            %>
            <tr>
                <td><%= customer.getAccountNo() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getDob() %></td>
                <td><%= customer.getAddress() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getGender() %></td>
                <td><%= customer.getAccountType() %></td>
                <td><%= customer.getJoinDate() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="9" style="text-align: center;">No customers found.</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</body>
</html>
