/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Mark;

/**
 *
 * @author BangPC
 */
public class MarkDAO {

    public void insertMark(int userID, int testID, double Mark) throws Exception {
        String sql = "INSERT Mark VALUES(?,?,?)";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userID);
        ps.setInt(2, testID);
        ps.setDouble(3, Mark);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
    
    public static List<Mark> select(int testID) throws Exception {
        List<Mark> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [Mark] where testID = " + testID + " "
                + "order by mark DESC";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int userID = rs.getInt("userID");
            double mark = rs.getDouble("mark");
            ls.add(new Mark(userID, testID, mark));
        }
        rs.close();
        conn.close();
        return ls;
    }
    public static void main(String[] args) throws Exception {
        List<Mark> ls = select(1);
        for(Mark m : ls){
            System.out.println(m.getMark());
        }
    }
}
