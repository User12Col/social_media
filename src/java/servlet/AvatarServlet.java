/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controller.AccountController;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Account;
import storage.StoreUploadImage;

/**
 *
 * @author HP ADMIN
 */
@MultipartConfig
public class AvatarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        int accID = acc.getAccID();
        //
        Part file = request.getPart("image");
        String imageFile = file.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("/resources/img/") + imageFile;
        /*FileOutputStream fos = new FileOutputStream(uploadPath);
        InputStream is = file.getInputStream();
        byte[] data = new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();*/
        StoreUploadImage uploadImg = new StoreUploadImage();
        uploadImg.StoreImage(file, imageFile, uploadPath);

        AccountController accCtrl = new AccountController();

        if (accCtrl.updateImg(imageFile, accID)) {
            Account account = accCtrl.getAccount(acc.getEmail(), acc.getPassword());
            session.setAttribute("account", account);
            request.getRequestDispatcher("/newfeed.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Fail to set your avatar, try again");
            request.getRequestDispatcher("/avatar.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
