/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaCod;

/**
 *
 * @author steph
 */
public class Usuario {
    private String nome, senha;
    private int id;
    
    public void setId(int id){
        this.id = id;
    }
    
    public int getId(){
        return id;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    public void setSenha(String senha){
        this.senha = senha;
    }
    public String getNome(){
        return nome;
    }
    public String getSenha(){
        return senha;
    }
    
    public Usuario(String nome, String senha){
        this.nome = nome;
        this.senha = senha;
    }
    
    public Usuario(){
        
    }
    
    public Usuario(int id){
        this.id = id;
    }
    
    public String toString(){
        return this.id + " " + this.nome + " " + this.senha;
    }
}
