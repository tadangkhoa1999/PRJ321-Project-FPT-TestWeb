/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author dell
 */
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if(request.getParameter("actionInfo").equals("showInfo")){
                RequestDispatcher rd = request.getRequestDispatcher("user/accountInfo.jsp");
                rd.forward(request, response);
            }
            if (request.getParameter("actionInfo").equals("Change") ) {
                RequestDispatcher rd = request.getRequestDispatcher("user/changeInfo.jsp");
                rd.forward(request, response);
            } else if (request.getParameter("actionInfo").equals("save")) {
                boolean isValidUser = false;
                boolean checkRePass = false;
                int userID = Integer.valueOf(request.getParameter("userid"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String repassword = request.getParameter("repassword");
                UserDAO dao = new UserDAO();
                List<User> ls = dao.listUser();
                for (User u : ls) {
                    if (u.getUserID() == userID) {
                        isValidUser = true;
                    }
                }
                if (password.equals(repassword)) {
                    checkRePass = true;
                }
                if (!isValidUser) {
                    request.setAttribute("error", "Invalid username or password");
                }
                if (!checkRePass) {
                    request.setAttribute("error", "Confirm password wrong");
                }
                if (isValidUser && checkRePass) {
                    HttpSession session = request.getSession(true);
                    dao.changeInfo(userID, username, password, username);
                    request.setAttribute("message", "Change Success");
                    session.setAttribute("login", dao.selectbyId(userID));
                    if (dao.selectbyId(userID).getUserType() == 1) {
                        RequestDispatcher rd = request.getRequestDispatcher("admin/changeInfo.jsp");
                        rd.forward(request, response);
                    } else if (dao.selectbyId(userID).getUserType() == 2) {
                        RequestDispatcher rd = request.getRequestDispatcher("user/changeInfo.jsp");
                        rd.forward(request, response);
                    }

                }
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
