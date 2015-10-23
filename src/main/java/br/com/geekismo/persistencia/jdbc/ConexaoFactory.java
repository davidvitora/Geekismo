/*
 * Fabrica de conexao para 
 */
package br.com.geekismo.persistencia.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Administrador
 */
class ConexaoFactory {
    
    public static Connection getConnection() throws ClassNotFoundException{
        try{
            Class.forName("com.mysql.jdbc.Driver"); // essa linha pode resolver o problema
            return DriverManager.getConnection(
                    /*"jdbc:mysql://localhost:3306/geekismo", "root", "potato371105");*/
                    /**"jdbc:mysql://$OPENSHIFT_MYSQL_DB_HOST:$OPENSHIFT_MYSQL_DB_PORT/appgeekismo", "adminuk4CVzm", "K71-t1TPLsf4");**/
                   "jdbc:mysql://${env.OPENSHIFT_MYSQL_DB_HOST}:${env.OPENSHIFT_MYSQL_DB_PORT}/geekismo", "adminj2Mbgwe", "naKkUM1y_uyA");
        } catch (SQLException e) {
            throw new RuntimeException(e);}
    }
    
}
