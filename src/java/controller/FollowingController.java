/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import config.ConnnectDatabase;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Following;

public class FollowingController {

    Connection con = ConnnectDatabase.getConnection();
    public List<Following> getFollowing(int accID){
        try {
            List<Following> list = new ArrayList<>();
            String sql = "select * from FOLLOWING where AccID = "+accID;
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                int followingID = rs.getInt("FollowingID");
                Following following = new Following(accID, followingID);
                list.add(following);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(FollowingController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean isFollow(int accID, int followID){
        try {
            String sql = "select * from FOLLOWING where AccID = "+accID+" and FollowingID = "+followID;
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FollowingController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean addFriend(int accID, int followID){
        try {
            String sql = "insert into FOLLOWING(AccID, FollowingID) values(?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accID);
            stm.setInt(2, followID);
            if(stm.executeUpdate()>0){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FollowingController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
        
    }
     
    public boolean UnFriend(int accID, int followID){
        try {
            String sql = "delete from FOLLOWING where AccID = ? and FollowingID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accID);
            stm.setInt(2, followID);
            if(stm.executeUpdate()>0){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FollowingController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
        
    }
}
