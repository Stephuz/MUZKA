/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import com.usjt.muzkaCod.Usuario;
import com.usjt.muzkaCod.Genero;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author steph
 */
public class UsuarioGeneroDAO {
      
       
    public void excluirGeneroPreferido(int genero, Usuario usuario){
        //JOptionPane.showMessageDialog(null, genero.getId()+ " " + usuario.getNome());
        String sql = "delete FROM UsuarioGeneroPreferido where idUsuario = ? and idGenero = ?";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setInt(1,usuario.getId());
            ps.setInt(2, genero);
            ps.execute();
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao excluir genero");
            e.printStackTrace();
        }
    }
    
    public void inserirGeneroPreferido(Usuario usuario, Genero genero) throws Exception{
        //JOptionPane.showMessageDialog(null, usuario.toString() + " " + genero);
        String sql = "INSERT INTO UsuarioGeneroPreferido(idUsuario, idGenero) VALUES(?, ?)";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setInt(1, usuario.getId());
            ps.setInt(2, genero.getId());
            ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela");
            e.printStackTrace();
        }
    }
    
    public boolean existeGeneroPreferido(Usuario usuario, Genero genero) throws Exception {
        String sql = "SELECT * FROM usuariogeneropreferido WHERE idusuario = ? and idgenero = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, usuario.getId());
            ps.setInt(2, genero.getId());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}
