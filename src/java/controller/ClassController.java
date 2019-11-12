/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ClassDAO;
import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ClassController extends HttpServlet {

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
            String action = request.getParameter("action");
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "list":
                    listClass(request, response);
                    break;
                case "delete":
                    deleteClass(request, response);
                    break;
                case "add":
                    addClass(request, response);
                    break;
                case "Add Class":
                    saveAddClass(request, response);
                    break;
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    public void listClass(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int subjectID = 1;
        try {
            subjectID = Integer.valueOf(request.getParameter("subjectID"));
        } catch (Exception e) {
            subjectID = (int) session.getAttribute("subjectID");
        }
        session.setAttribute("subjectID", subjectID);
        request.setAttribute("subjectname", request.getParameter("subjectname"));
        ClassDAO dao = new ClassDAO();
        request.setAttribute("classList", dao.listClassBySubject(subjectID));
        User u = (User) session.getAttribute("login");
        if (u == null) {
            RequestDispatcher rd = request.getRequestDispatcher("listClass.jsp");
            rd.forward(request, response);
        } else {
            if (u.getUserType() == 1) {
                RequestDispatcher rd = request.getRequestDispatcher("admin/listClass.jsp");
                rd.forward(request, response);

            } else if (u.getUserType() == 2) {
                RequestDispatcher rd = request.getRequestDispatcher("user/listClass.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("listClass.jsp");
                rd.forward(request, response);
            }
        }
    }

    public void deleteClass(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int subjectID = Integer.valueOf(request.getParameter("subjectID"));
        session.setAttribute("subjectID", subjectID);

        ClassDAO dao = new ClassDAO();
        int classID = Integer.valueOf(request.getParameter("classID"));
        dao.delete(classID);
        response.sendRedirect("ClassController");
    }

    public void addClass(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int subjectID = 1;
        try {
            subjectID = Integer.valueOf(request.getParameter("subjectID"));
        } catch (Exception e) {
            subjectID = (int) session.getAttribute("subjectID");
        }
        session.setAttribute("subjectID", subjectID);

        RequestDispatcher rd = request.getRequestDispatcher("admin/addClass.jsp");
        rd.forward(request, response);
    }

    public void saveAddClass(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int subjectID = (int) session.getAttribute("subjectID");

        String className = request.getParameter("className");
        String classContent = request.getParameter("classContent");

        ClassDAO dao = new ClassDAO();
        dao.insert(className, subjectID, classContent);
        int classID = dao.getNewClassID(subjectID);
        response.sendRedirect("TestController?classID=" + classID);
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
