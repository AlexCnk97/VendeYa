/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author cnk
 */
public class Database {
    private Connection db;
    private ResultSet resultset;
    private Statement statement;
    
    public Database(){
        String user = "developer";
        String pass = "Hola.hola1";
        String database = "VendeYa";
        String url = "jdbc:mysql://localhost:3306/"+database;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            this.db = DriverManager.getConnection(url, user, pass);
            System.out.println("Conection success");
            this.statement = this.db.createStatement();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public ResultSet excuteQuery(String query) throws SQLException{
        this.resultset = this.statement.executeQuery(query);
        return this.resultset;
    }
    
    public void excuteUpdate(String query) throws SQLException{
        this.statement.executeUpdate(query);
    }
    

    
}
