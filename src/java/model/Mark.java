/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.UserDAO;

/**
 *
 * @author dell
 */
public class Mark {

    private int userID;
    private int testID;
    private double mark;

    public Mark(int userID, int testID, double mark) {
        this.userID = userID;
        this.testID = testID;
        this.mark = mark;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    
    public User getUser() throws Exception {
        UserDAO UserDAO = new UserDAO();
        return UserDAO.selectbyId(userID);
    }

}
