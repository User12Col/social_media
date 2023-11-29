/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import config.ConnnectDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP ADMIN
 */
public class LikeController {

    Connection con = ConnnectDatabase.getConnection();

    public boolean likePost(int accID, int postID) {
        try {
            String sql = "insert into dbo.[LIKE](AccID, PostID) values (?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accID);
            stm.setInt(2, postID);
            if (stm.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean UnlikePost(int accID, int postID) {
        try {
            String sql = "delete from dbo.[LIKE] where AccID = ? and PostID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accID);
            stm.setInt(2, postID);
            if (stm.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }
    
    public int getNumberOfLike(int postID){
        int number = 0;
        try {
            String sql = "select * from dbo.[LIKE] where postID = "+postID;
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                number++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }
    
    public boolean isLike(int accID, int postID){
        try {
            String sql = "select * from dbo.[LIKE] where AccID = "+accID+" and PostID = "+postID;
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
