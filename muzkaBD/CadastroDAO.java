/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import com.usjt.muzkaCod.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;

/**
 *
 * @author steph
 */
public class CadastroDAO {

    public void cadastrar(Usuario usuario) throws Exception {
        //1: Definir o comando SQL
        String sql = "INSERT INTO Usuario(login, senha) VALUES (?, ?)";
        //2: Abrir uma conexão
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection c = conexaoBD.obterConexao()) {
        //3: Pré compila o comando
            PreparedStatement ps = c.prepareStatement(sql);
        //4: Preenche os dados faltantes
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getSenha());
            
        //5: Executa o comando
            ps.execute();
        }
    }
}