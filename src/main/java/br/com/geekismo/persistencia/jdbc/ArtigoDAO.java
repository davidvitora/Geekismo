/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geekismo.persistencia.jdbc;

import br.com.geekismo.persistencia.entidade.Artigo;
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
public class ArtigoDAO {
    Connection con;
    
    public ArtigoDAO() throws ClassNotFoundException{
        this.con = ConexaoFactory.getConnection();
    }
    
    public Artigo getArtigo(int id){
        Artigo artigo = null;
        String sql = "select * from artigos where id = ?";
        try{
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setString(1, Integer.toString(id));
            ResultSet resultado = preparador.executeQuery();
            artigo = new Artigo();
            while(resultado.next()){
                artigo.setId(Integer.parseInt(resultado.getString("id")));
                artigo.setAutor(resultado.getString("autor"));
                artigo.setCorpo(resultado.getString("corpo"));
                artigo.setData(resultado.getString("data"));
                artigo.setTitulo(resultado.getString("titulo"));
                return artigo;
            }
            
        } catch(SQLException e){
            e.printStackTrace();
        }
            return artigo;
    }
        public int contarArtigos(){
            int quantidadeArtigos = 0;
            String sql = "SELECT COUNT(id) FROM artigos";
            try{
               PreparedStatement preparador = con.prepareStatement(sql);
               ResultSet resultado = preparador.executeQuery();
               while(resultado.next()){
                   quantidadeArtigos = Integer.parseInt(resultado.getString("COUNT(id)"));
               }
                return quantidadeArtigos;
            }
            catch(SQLException e){
                e.printStackTrace();
            }
                return quantidadeArtigos;
        }
        
        public int contarComentario(int artigo){
            int quantidadeComentarios = 0;
             String sql = "SELECT COUNT(id) FROM comentarios where artigo = ?";
            try{
               PreparedStatement preparador = con.prepareStatement(sql);
               preparador.setString(1, Integer.toString(artigo));
               ResultSet resultado = preparador.executeQuery();
               while(resultado.next()){
                   quantidadeComentarios = Integer.parseInt(resultado.getString("COUNT(id)"));
               }
                return quantidadeComentarios;
            }
            catch(SQLException e){
                e.printStackTrace();
            }
                return quantidadeComentarios;
        }
        
    public List<Artigo> getArtigos(int artigo1, int artigo2, int artigo3){
        List<Artigo> listaArtigos = new ArrayList<Artigo>();
        Artigo artigo = null;
        String sql = "select * from artigos where id = ? or id = ? or id = ?";
        try{
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setString(1, Integer.toString(artigo1));
            preparador.setString(2, Integer.toString(artigo2));
            preparador.setString(3, Integer.toString(artigo3));
            ResultSet resultado = preparador.executeQuery();
            while(resultado.next()){
                artigo = new Artigo(Integer.parseInt(resultado.getString("id")), resultado.getString("corpo"), resultado.getString("titulo"), resultado.getString("data"), resultado.getString("autor"));
                listaArtigos.add(artigo);
            }
            return listaArtigos;
        } catch(SQLException e){
            e.printStackTrace();
            System.out.print("Nao ta dando");
        }
            return listaArtigos;
            
    }
    
    
}

