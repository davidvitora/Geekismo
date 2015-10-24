/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geekismo.persistencia.entidade;

/**
 *
 * @author Administrador
 */
public class Comentarios {
    private int id;
    private String comentario;
    private int artigo;
    private String nome;
    private String id_usuario;
    
    
    
    /*
        Construtor
    */
    public Comentarios(int id, String comentario, int artigo, String nome, String id_usuario){
        this.id = id;
        this.comentario = comentario;
        this.artigo = artigo;
        this.nome = nome;
        this.id_usuario = id_usuario;
    }
    public Comentarios(){
        
    }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * @return the artigo
     */
    public int getArtigo() {
        return artigo;
    }

    /**
     * @param artigo the artigo to set
     */
    public void setArtigo(int artigo) {
        this.artigo = artigo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the id_usuario
     */
    public String getId_usuario() {
        return id_usuario;
    }

    /**
     * @param id_usuario the id_usuario to set
     */
    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
        
}
