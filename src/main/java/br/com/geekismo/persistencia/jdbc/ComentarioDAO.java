/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geekismo.persistencia.jdbc;

import br.com.geekismo.persistencia.entidade.Comentarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class ComentarioDAO {
    
    private Connection con;

    public ComentarioDAO() throws ClassNotFoundException {
        this.con = ConexaoFactory.getConnection();
    }
    
    public void inserirComentario(String comentario,String nome, String artigo, String userid){
        String sql = "insert into comentarios (comentario,nome,artigo,id_usuario) values (?,?,?,?)";
        try {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setString(1, comentario);//Substitui ? pelo
            preparador.setString(2, nome);
            preparador.setString(3, artigo);
            preparador.setString(4, userid);
            //Executando comando SQL
            preparador.execute();
            //Encerrando Objeto
            preparador.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void excluirComentario(int id){
        String sql = "delete from comentarios where id = ?";
        try {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setString(1, Integer.toString(id));//Substitui ? pelo comentario
            //Executando comando SQL
            preparador.execute();
            //Encerrando Objeto
            preparador.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void editarComentario(String comentarioEditado,int id){
        String sql = "update comentarios1 set comentario = ? where id = ?";
        try {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setString(1, comentarioEditado);//Substitui ? pelo 
            preparador.setInt(2, id);
            //Executando comando SQL
            preparador.execute();
            //Encerrando Objeto
            preparador.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Comentarios> buscarComentarios(int artigo){
        String sql = "select * from comentarios where artigo = ?";
        List<Comentarios> comentarios = new ArrayList<Comentarios>();
        try {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setInt(1, artigo);
            ResultSet resultado = preparador.executeQuery();
            while( resultado.next()){
            //adicionando comentarios na lista    
                comentarios.add(new Comentarios
        (Integer.parseInt(resultado.getString("id")),resultado.getString("comentario"),
                Integer.parseInt(resultado.getString("artigo")),resultado.getString("nome")
                ,resultado.getString("id_usuario")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return comentarios;
    
    }
    
}
