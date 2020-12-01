/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaCod;

import java.awt.PopupMenu;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author steph
 */
public class PreencheTabela extends AbstractTableModel{
    private ArrayList linhas = null; //número de linhas 
    private String[] colunas = null; //número de colunas
    
    public PreencheTabela(ArrayList linhas, String[] colunas){
        setLinhas(linhas);
        setColunas(colunas);
    }

    public PreencheTabela() {
        
    }
    
    public ArrayList getLinhas(){
        return linhas;
    }
    public String[] getColunas(){
        return colunas;
    }
    
    public void setLinhas(ArrayList linhas){
        this.linhas = linhas;
    }
    public void setColunas(String[] colunas){
        this.colunas = colunas;
    }
    
    //contagem do número de colunas
    @Override
    public int getColumnCount(){
        return colunas.length;
    }
    
    //contagem do número de linhas
    @Override
    public int getRowCount(){
        return linhas.size();
    }
    
    //pega o número de colunas
    @Override
    public String getColumnName(int numColuna){
        return colunas[numColuna]; 
    }
    
    //montagem da tabela
    @Override
    public Object getValueAt(int numLinhas, int numColunas){
        Object[] linha = (Object[])getLinhas().get(numLinhas);
        return linha[numColunas];
    }

    /*    public PopupMenu get(int selectedRow) {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/
}
