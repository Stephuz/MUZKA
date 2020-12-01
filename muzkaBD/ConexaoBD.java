/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usjt.muzkaBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author steph
 */
public class ConexaoBD {
    public Statement stm; //prepara e realiza pesquisas no banco de dados
    public ResultSet rs; //armazena o resultado de uma pesquisa passada para o statement
    private static String host = "localhost";
    private static String porta = "3306";
    private static String db = "dbMuzka";
    private static String usuario = "root";
    private static String senha = "abcd1234";

    public static Connection obterConexao() throws Exception {
        String url = String.format("jdbc:mysql://%s:%s/%s",host,porta,db + "?serverTimezone=UTC");
        return DriverManager.getConnection(url, usuario, senha);
    }
       
    
}
