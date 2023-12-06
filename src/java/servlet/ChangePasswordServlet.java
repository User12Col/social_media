/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controller.AccountController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author HP ADMIN
 */
public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String currPassword = request.getParameter("currpassword");
        String newPassword = request.getParameter("newpassword");
        AccountController accCtrl = new AccountController();
        if(accCtrl.checkPass(currPassword, acc.getAccID())){
            if(accCtrl.changePassword(newPassword, acc.getAccID())){
                request.setAttribute("message", "Change Success");
                request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
            } else{
                request.setAttribute("message", "Change Fail");
                request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
            }
        } else{
            request.setAttribute("message", "Wrong Password");
            request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    

}
