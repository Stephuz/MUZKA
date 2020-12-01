/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;
import com.usjt.muzkaCod.Genero;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

/**
 *
 * @author steph
 */
public class GeneroDAO {
        
    public Genero[] obterGenero() throws Exception {
        String sql = "SELECT * FROM Genero where ativo = 1 order by descricaoGenero";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            int totalGeneros = rs.last() ? rs.getRow() : 0;
            Genero[] genero = new Genero[totalGeneros];
            rs.beforeFirst();
            int contador = 0;
            while (rs.next()) {
                String nome = rs.getString("descricaoGenero");
                int id = rs.getInt("idGenero");
                genero[contador++] = new Genero(nome,id);
            }
            return genero;
        }
    }
    
    public int consultaId(String genero){
        int idGenero = 0;
        String sql = "SELECT idGenero FROM Genero where descricaoGenero = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1,genero);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                idGenero = rs.getInt("idGenero");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
        return idGenero;
    }
    
    public boolean existeGenero(String genero) throws Exception {
        String sql = "SELECT descricaogenero FROM genero WHERE descricaogenero = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, genero);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public void adicionarGenero(String genero){
        String sql = "insert into genero (descricaogenero) values(?)";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1, genero);
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no sql para inserir novo gênero");
            e.printStackTrace();
        }
    }
    
    public void desativaGenero(String genero){
        String sql = "UPDATE Genero SET ativo=0 WHERE descricaogenero = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1, genero);
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no sql para inserir novo gênero");
            e.printStackTrace();
        }
    }
    
    public void ativaGenero(String genero){
        String sql = "UPDATE Genero SET ativo=1 WHERE descricaogenero = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1, genero);
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no sql para inserir novo gênero");
            e.printStackTrace();
        }
    }
    
    public int generoAtivo(String genero){
        int idGenero = 0;
        String sql = "SELECT ativo FROM Genero where descricaoGenero = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1,genero);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                idGenero = rs.getInt("ativo");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
        return idGenero;
    }
}
