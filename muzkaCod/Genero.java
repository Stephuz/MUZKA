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
public class Genero {
    private String nome;
    private int id;
    
    public Genero(String nome, int id){
        this.nome = nome;
        this.id = id;
    }
    public Genero(int id){
        this.id = id;
    }
    public Genero(){
        
    }
    public String toString(){
        return this.nome;
    }
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public String getNome(){
        return nome;
    }
}
