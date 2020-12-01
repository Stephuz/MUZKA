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
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author steph
 */
public class PreencherTabelaDAO {
    private ArrayList dadosTabela = new ArrayList();
    
    public ArrayList getDadosTabela(){
        return dadosTabela;
    }
    
    public void preencherTabelaRecomendacao(Usuario usuario) throws Exception{
        
        //JOptionPane.showMessageDialog(null, usuario.getId());
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection c = conexaoBD.obterConexao()) {
                String sql ="select m.tituloMusica, round(m.postoMusica,1) as postoMusica from usuariogeneropreferido ug" +
                        " inner join generoMusica gm on gm.idGenero=ug.idGenero" +
                        " inner join musica m on m.idMusica=gm.idMusica" +
                        " left join notausuariomusica n on n.idMusica=m.idMusica and n.idUsuario=ug.idUsuario" +
                        " where n.notaMusica is null and ug.idUsuario = ? "
                        + "order by postoMusica desc";
                PreparedStatement ps = c.prepareStatement(sql);
                ps.setInt(1,usuario.getId());
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    dadosTabela.add(new Object[]{rs.getString("tituloMusica"),rs.getString("postoMusica")});
                }
                ps.execute();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao atualizar tabela recomendação");
            e.printStackTrace();
        }
    }
    
    public void preencherTabelaMusicasEGeneros(int i) throws Exception{
       if(i == 1) {
            // Definir o comando SQL
            String sql = "select titulomusica, descricaogenero from musica as m inner join generomusica as gm "
                + "on m.idmusica = gm.idmusica inner join genero as g on gm.idgenero = g.idgenero order by titulomusica";
        
            //2: Abrir uma conexão
            ConexaoBD conexaoBD = new ConexaoBD();
            try (Connection c = conexaoBD.obterConexao()) {
                //3: Pré compila o comando
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    dadosTabela.add(new Object[]{rs.getString("titulomusica"),rs.getString("descricaogenero")});
                }
                //5: Executa o comando
                ps.execute();
                //JOptionPane.showMessageDialog(null, dados);
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Erro no comando sql para pegar as músicas");
                e.printStackTrace();
            }
       }else{
           // Definir o comando SQL
            String sql = "select titulomusica, descricaogenero from musica as m inner join generomusica as gm "
                + "on m.idmusica = gm.idmusica inner join genero as g on gm.idgenero = g.idgenero order by descricaogenero";
        
            //2: Abrir uma conexão
            ConexaoBD conexaoBD = new ConexaoBD();
            try (Connection c = conexaoBD.obterConexao()) {
                //3: Pré compila o comando
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    dadosTabela.add(new Object[]{rs.getString("titulomusica"),rs.getString("descricaogenero")});
                }
                //5: Executa o comando
                ps.execute();
                //JOptionPane.showMessageDialog(null, dados);
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Erro no comando sql para pegar as músicas");
                e.printStackTrace();
            }
       }
    }
    
    public void preencherTabelaGeneroPreferido(Usuario usuario) throws Exception{
        
       //JOptionPane.showMessageDialog(null, usuario.getId()); teste funcionamento objeto usuário
       // Definir o comando SQL
        String sql = "select descricaoGenero, DATE_FORMAT(dataInsercao, '%d %M, %Y') from Genero inner join UsuarioGeneroPreferido on "
                + "Genero.idGenero = UsuarioGeneroPreferido.idGenero where UsuarioGeneroPreferido.idUsuario = ?";
        
        //2: Abrir uma conexão
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection c = conexaoBD.obterConexao()) {
        //3: Pré compila o comando
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1,usuario.getId());
            ResultSet rs = ps.executeQuery();
            //ps.getResultSet().findColumn(sql);
            while(rs.next()){
                dadosTabela.add(new Object[]{rs.getString("descricaoGenero"),rs.getString("DATE_FORMAT(dataInsercao, '%d %M, %Y')")});
                }
        //5: Executa o comando
            ps.execute();
            //JOptionPane.showMessageDialog(null, dados);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Problemas técnicos. Tentenovamente mais tarde");
            e.printStackTrace();
        }
    }
    
    public void preencherTabelaGeneros() throws Exception{
        
       // Definir o comando SQL
        String sql = "select descricaogenero from genero where ativo = 1 order by descricaogenero";
        
        //2: Abrir uma conexão
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection c = conexaoBD.obterConexao()) {
        //3: Pré compila o comando
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                dadosTabela.add(new Object[]{rs.getString("descricaogenero")});
                }
        //5: Executa o comando
            ps.execute();
            //JOptionPane.showMessageDialog(null, dados);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro no comando sql para pegar os gêneros");
            e.printStackTrace();
        }
    }
    
    public void preencherTabelaAvaliarMusica(Usuario usuario) throws Exception{
        
       //JOptionPane.showMessageDialog(null, id);
       // Definir o comando SQL
        String sql = "select tituloMusica, notaMusica from Musica inner join NotaUsuarioMusica on "
                + "Musica.idMusica = NotaUsuarioMusica.idMusica where NotaUsuarioMusica.idUsuario = ?"
                + " order by notaMusica desc";
        
        //2: Abrir uma conexão
        ConexaoBD conexaoBD = new ConexaoBD();
        try (Connection c = conexaoBD.obterConexao()) {
        //3: Pré compila o comando
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1,usuario.getId());
            ResultSet rs = ps.executeQuery();
            //ps.getResultSet().findColumn(sql);
            while(rs.next()){
                dadosTabela.add(new Object[]{rs.getString("tituloMusica"),rs.getInt("notaMusica")});
                }
        //5: Executa o comando
            ps.execute();
            //JOptionPane.showMessageDialog(null, dados);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Problemas técnicos. Tentenovamente mais tarde");
            e.printStackTrace();
        }
    }
}
