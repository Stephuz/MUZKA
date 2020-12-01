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
public class Musica {
    private String nome;
    private double media;
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
    public void setMedia(double media){
        this.media = media;
    }
    
    public String getNome(){
        return nome;
}
    public double getMedia(){
        return media;
    }
        
    public Musica(String nome, double media, int id){
        this.nome = nome;
        this.media = media;
        this.id = id;
    }
    
    public Musica(String nome, int id){
        this.nome = nome;
        this.id = id;
    }
    
    public String toString(){
        return this.nome;
    }
}
