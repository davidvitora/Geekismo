/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geekismo.persistencia.jdbc;

import java.sql.Connection;
import br.com.geekismo.persistencia.entidade.Usuarios;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDAO {
    private Connection con;

    public UsuariosDAO() throws ClassNotFoundException {
        this.con = ConexaoFactory.getConnection();
    }
    
    public void cadastrarUsuario(Usuarios usuario){
        String sql = "insert into usuarios (login,nome,senha) values (?,?,?)";
        try{
        PreparedStatement preparo = con.prepareStatement(sql);
        preparo.setString(1, usuario.getLogin());
        preparo.setString(2, usuario.getNome());
        preparo.setString(3, usuario.getSenha());
        preparo.execute();
        preparo.close();
        }
        catch(SQLException e){
            
        }
    }
    public Usuarios logarUsuario(String login, String senha){
        Usuarios usuario = new Usuarios();
        String sql = "select * from usuarios where login = ? and senha = ?";
        try{
            PreparedStatement preparo = con.prepareStatement(sql);
            preparo.setString(1, login);
            preparo.setString(2, senha);
            ResultSet resultado = preparo.executeQuery();
            while(resultado.next()){
                usuario.setId(Integer.parseInt(resultado.getString("id")));
                usuario.setLogin(resultado.getString("login"));
                usuario.setSenha(resultado.getString("senha"));
                usuario.setNome(resultado.getString("nome"));
                return usuario;
            }
        }
        catch(SQLException e){
           
        }
                return usuario;}

}
