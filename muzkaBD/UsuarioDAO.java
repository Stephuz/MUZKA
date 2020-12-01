/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import com.usjt.muzkaCod.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author steph
 */
public class UsuarioDAO {
    
    
    public boolean existe(Usuario usuario) throws Exception {
        String sql = "SELECT * FROM Usuario WHERE login = ? AND senha = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getSenha());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public boolean existeNome(Usuario usuario) throws Exception {
        String sql = "SELECT * FROM Usuario WHERE login = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getNome());
            //ps.setString(2, usuario.getSenha());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public int consultaId(Usuario usuario) throws SQLException, Exception{
        int ID = 0;
        
        String sql = "SELECT idUsuario FROM Usuario WHERE login = ?";
        try (Connection conn = ConexaoBD.obterConexao();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getNome());
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                ID = rs.getInt("idUsuario");
        }
        return ID;
    }
}


