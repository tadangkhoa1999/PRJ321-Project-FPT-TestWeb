/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MarkDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.User;

/**
 *
 * @author BangPC
 */
public class DoTestController extends HttpServlet {

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
            if(request.getParameter("submit") != null){
                HttpSession session = request.getSession(true);
                
                int testID = Integer.valueOf(session.getAttribute("testID").toString());
                //get list question
                QuestionDAO dao = new QuestionDAO();
                List<Question> questions = new ArrayList<>();
                questions = dao.listQuestionByTest(testID);
                //get user answer
                List<String> userAnswers = new ArrayList<>();
                String userAnswer="";
                for (int i = 0; i < questions.size(); i++) {
                    if(request.getParameter(String.valueOf(questions.get(i).getQuestionID())) != null){
                        userAnswer = request.getParameter(String.valueOf(questions.get(i).getQuestionID()));
                    }else{
                        userAnswer = "Not Answer";
                    }
                    userAnswers.add(userAnswer);
                }
                //count right ansewer and calculate mark
                int rightAnswer = 0;
                for (int i = 0; i < questions.size(); i++) {
                    if(questions.get(i).getRightOption().equals(userAnswers.get(i))){
                        rightAnswer++;
                    }
                }
                double mark = rightAnswer * 10.0/ questions.size();
                session.setAttribute("mark", mark);
                request.setAttribute("userAnswers", userAnswers);
                request.setAttribute("rightAnswers", rightAnswer);
                //Add to Mark table in database
                MarkDAO mdao = new MarkDAO();
                User u = (User) session.getAttribute("login");
                mdao.insertMark(u.getUserID(), testID, mark);
                
                RequestDispatcher rd = request.getRequestDispatcher("user/mark.jsp");
                rd.forward(request, response);
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
