/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BaseOcorrencia;

/**
 *
 * @author Daiane Machado, date = 31/08/17.
 */
public class OcorrenciaCorpoDeBombeirosDAO {

    public static int inserir(BaseOcorrencia ocorrenciaBombeiros){
        String sql = "INSERT INTO ocorrencias_bombeiros (id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia) VALUES (?, ?, ?, ?, ?);";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, ocorrenciaBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaBombeiros.getEmissor().getId());
            ps.setInt(3, ocorrenciaBombeiros.getCep());
            ps.setString(4, ocorrenciaBombeiros.getRua());
            ps.setInt(5, ocorrenciaBombeiros.getNumeroResidencia());

            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();

            while (rs.next()) {
                int codigo = rs.getInt(1);
                return codigo;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return -1;

    }

    public static int alterar(BaseOcorrencia ocorrenciasBombeiros){
        Conexao conexao = new Conexao();
        try{
            String sql = "UPDATE ocorrencias_bombeiros SET id_tipo_ocorrencias_bombeiros = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ? WHERE id = ? ";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setInt(1, ocorrenciasBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciasBombeiros.getEmissor().getId());
            ps.setInt(3, ocorrenciasBombeiros.getCep());
            ps.setString(4, ocorrenciasBombeiros.getRua());
            ps.setInt(5, ocorrenciasBombeiros.getNumeroResidencia());
            ps.setInt(6, ocorrenciasBombeiros.getId());

            int resultado = ps.executeUpdate();
            return resultado;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar();
        }
    }

    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM ocorrencias_bombeiros";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().prepareStatement(sql);
            stt.execute(sql);
            ResultSet resultado = stt.getResultSet();
            if (resultado.next()) {
                return resultado.getInt("quantidade");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return -1;
    }

    public static BaseOcorrencia buscarOcorrenciaBombeiroPorId(int codigo){
        BaseOcorrencia ocorrenciasBombeiros = null;
        String sql = "SELECT id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia FROM ocorrencias_bombeiros WHERE id = ?";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()){
                ocorrenciasBombeiros = new BaseOcorrencia();
                ocorrenciasBombeiros.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(rs.getInt("id_tipo_ocorrencias_bombeiros")));
                ocorrenciasBombeiros.setId(codigo);
                ocorrenciasBombeiros.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciasBombeiros.setCep(rs.getInt("cep"));
                ocorrenciasBombeiros.setRua(rs.getString("rua"));
                ocorrenciasBombeiros.setNumeroResidencia(rs.getInt("numero_residencia"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciasBombeiros;
    }

    public static ArrayList<BaseOcorrencia> retornarOcorrenciaBombeiro(){
        ArrayList<BaseOcorrencia> tabelaOcorrenciaBombeiro = new ArrayList<>();
        String sql = "SELECT id, id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia FROM ocorrencias_bombeiros";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
            stt.execute(sql);
            ResultSet rs = stt.getResultSet();
            while (rs.next()){
                BaseOcorrencia ocorrenciaBombeiro = new BaseOcorrencia();
                ocorrenciaBombeiro.setId(rs.getInt("id"));
                ocorrenciaBombeiro.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(rs.getInt("id_tipo_ocorrencias_bombeiros")));
                ocorrenciaBombeiro.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciaBombeiro.setCep(rs.getInt("cep"));
                ocorrenciaBombeiro.setRua(rs.getString("rua"));
                ocorrenciaBombeiro.setNumeroResidencia(rs.getInt("numero_residencia"));
                tabelaOcorrenciaBombeiro.add(ocorrenciaBombeiro);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            conexao.desconectar();
        }
        return tabelaOcorrenciaBombeiro;
    }

    public static void excluirCorpoDeBombeiros(int id) {
        String sql = "DELETE FROM ocorrencia_bombeiros WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void alterarTrote(int id, int  status) {
        Conexao conexao = new Conexao();
        try {
            /*
            0 - Não foi definido
            1 - Trote
            2 - Ok
             */

            String sql = "UPDATE ocorrencias_bombeiros SET status_trote = ? WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            if(status ==0){

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}