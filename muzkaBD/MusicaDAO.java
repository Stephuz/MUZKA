/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import com.usjt.muzkaCod.Musica;
import com.usjt.muzkaCod.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

/**
 *
 * @author steph
 */
public class MusicaDAO {
    
       
    public Musica[] obterMusica() throws Exception {
        String sql = "SELECT * FROM Musica order by tituloMusica";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            int totalMusicas = rs.last() ? rs.getRow() : 0;
            Musica[] musica = new Musica[totalMusicas];
            rs.beforeFirst();
            int contador = 0;
            while (rs.next()) {
                int id = rs.getInt("idMusica");
                double nota = rs.getDouble("postoMusica");
                String tituloMusica = rs.getString("tituloMusica");
                musica[contador++] = new Musica(tituloMusica,nota,id);
            }
            return musica;
        }
    }
    
    public boolean verificaNota(Usuario usuario, Musica musica)throws Exception{
        String sql = "SELECT * FROM NotaUsuarioMusica WHERE idMusica = ? AND idUsuario = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, musica.getId());
            ps.setInt(2, usuario.getId());
            
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public void atualizarNota(Usuario usuario, Musica musica, int nota)throws Exception{
        String sql = "update NotaUsuarioMusica set notamusica = ? where idUsuario = ? and idMusica = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setInt(1, nota);
            ps.setInt(2, usuario.getId());
            ps.setInt(3, musica.getId());
            
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
    }
    
    public void inserirNota(Usuario usuario, Musica musica, int nota) throws Exception{
        String sql = "INSERT INTO NotaUsuarioMusica(idUsuario, idMusica, notaMusica) VALUES(?, ?, ?)";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setInt(1, usuario.getId());
            ps.setInt(2, musica.getId());
            ps.setInt(3, nota);
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
    }
    
    public int consultaId(String musica){
        int idMusica = 0;
        String sql = "SELECT idmusica FROM musica where titulomusica = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1,musica);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                idMusica = rs.getInt("idMusica");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
        return idMusica;
    }
    
    public double mediaPosto(Musica musica){
        double nota = 0.0;
        String sql = "SELECT AVG(notaMusica) FROM NotaUsuarioMusica where idMusica = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, musica.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                nota = rs.getDouble("AVG(notaMusica)");
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
        return nota;
    }
    
    public void atualizaPosto(Musica musica, double posto) {
        //JOptionPane.showMessageDialog(null, posto);
        String sql = "UPDATE Musica SET postoMusica = ? where idMusica = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, posto);
            ps.setInt(2, musica.getId());
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela música");
            e.printStackTrace();
        }
    }
    
    public void adicionarMusica(String musica, int idGenero){
        String sql = "insert into musica (titulomusica) values(?)";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1, musica);
            ps.execute();
            int idMusica = consultaId(musica);
            GeneroMusicaDAO gmdao = new GeneroMusicaDAO();
            gmdao.adicionarGeneroMusica(idMusica, idGenero);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no sql para inserir nova música");
            e.printStackTrace();
        }
    }
    
    public boolean existeMusica(String musica) throws Exception {
        String sql = "SELECT titulomusica FROM musica WHERE titulomusica = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, musica);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    
}
