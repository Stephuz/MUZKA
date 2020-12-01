/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import com.usjt.muzkaCod.Genero;
import com.usjt.muzkaCod.Musica;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author steph
 */
public class GeneroMusicaDAO {
      
    //recebe em int porque duas classes fazem aceso e nem todas conseguem objetos
    public void adicionarGeneroMusica(int idMusica, int idGenero){
        String sql = "insert into generomusica (idgenero,idmusica) values (?,?)";
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection conn = conexaoBD.obterConexao()){
            
            PreparedStatement ps = conn.prepareStatement(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setInt(1, idGenero);
            ps.setInt(2,idMusica);
            ps.execute();
            
         }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no sql para inserir novo gênero a música");
            e.printStackTrace();
        }
    }
    
    public boolean existeGeneroMusica(Musica musica, Genero idGenero) throws Exception {
        String sql = "SELECT * FROM generomusica WHERE idMusica = ? and idGenero = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, musica.getId());
            ps.setInt(2, idGenero.getId());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}
