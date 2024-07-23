package bank.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import bank.dao.Transaction;
import bank.dao.TransactionDAO;
import com.bank.Customer;

@WebServlet("/downloadPDF")
public class DownloadPDFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Added serialVersionUID

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"transactions.pdf\"");

        // Fetch customer from session
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        if (customer == null) {
            response.getWriter().println("No customer information found.");
            return;
        }

        String accountNo = customer.getAccountNo();
        if (accountNo == null || accountNo.isEmpty()) {
            response.getWriter().println("No account number found.");
            return;
        }

        // Fetch transactions
        TransactionDAO transactionDAO = new TransactionDAO();
        List<Transaction> transactions = transactionDAO.getTransactionsByAccountNo(accountNo);

        // PDF Content
        OutputStream outputStream = response.getOutputStream();
        StringBuilder pdfContent = new StringBuilder();

        // PDF Header
        pdfContent.append("%PDF-1.4\n");
        pdfContent.append("1 0 obj\n");
        pdfContent.append("<< /Type /Catalog\n");
        pdfContent.append("/Pages 2 0 R >>\n");
        pdfContent.append("endobj\n");

        pdfContent.append("2 0 obj\n");
        pdfContent.append("<< /Type /Pages\n");
        pdfContent.append("/Kids [3 0 R]\n");
        pdfContent.append("/Count 1 >>\n");
        pdfContent.append("endobj\n");

        pdfContent.append("3 0 obj\n");
        pdfContent.append("<< /Type /Page\n");
        pdfContent.append("/Parent 2 0 R\n");
        pdfContent.append("/MediaBox [0 0 612 792]\n");
        pdfContent.append("/Contents 4 0 R\n");
        pdfContent.append("/Resources 5 0 R >>\n");
        pdfContent.append("endobj\n");

        pdfContent.append("4 0 obj\n");
        pdfContent.append("<< /Length 44 >>\n");
        pdfContent.append("stream\n");
        pdfContent.append("BT\n");
        pdfContent.append("/F1 24 Tf\n");
        pdfContent.append("100 750 Td\n");
        pdfContent.append("(Transactions for Account: " + accountNo + ") Tj\n");

        // Add transactions to PDF
        pdfContent.append("ET\n");
        pdfContent.append("BT\n");
        pdfContent.append("/F1 12 Tf\n");
        int yPosition = 700;
        for (Transaction transaction : transactions) {
            pdfContent.append("100 " + yPosition + " Td\n");
            pdfContent.append("(" + transaction.getTransactionID() + " " + transaction.getDatetime() + " " + transaction.getTransactionType() + " " + transaction.getAmount() + ") Tj\n");
            yPosition -= 20;
        }
        pdfContent.append("ET\n");
        pdfContent.append("endstream\n");
        pdfContent.append("endobj\n");

        // PDF Resources
        pdfContent.append("5 0 obj\n");
        pdfContent.append("<< /Font << /F1 6 0 R >> >>\n");
        pdfContent.append("endobj\n");

        pdfContent.append("6 0 obj\n");
        pdfContent.append("<< /Type /Font\n");
        pdfContent.append("/Subtype /Type1\n");
        pdfContent.append("/BaseFont /Helvetica >>\n");
        pdfContent.append("endobj\n");

        // PDF Trailer
        pdfContent.append("trailer\n");
        pdfContent.append("<< /Root 1 0 R\n");
        pdfContent.append("/Size 7 >>\n");
        pdfContent.append("%%EOF");

        // Write PDF content to OutputStream
        outputStream.write(pdfContent.toString().getBytes());
        outputStream.flush();
        outputStream.close();
    }
}

