package dao;

import database.Conexao;
import model.BaseOcorrencia;
import model.BaseTipoOcorrencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Wanderson Ferreira 30/08/2017.
 */
public class TipoOcorrenciaPolicialDAO {

    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) {
        String sql = "INSERT INTO tipo_ocorrencias_policiais (tipo) VALUES (?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, baseTipoOcorrencia.getTipo());

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

    public static int alterar(BaseTipoOcorrencia baseTipoOcorrencia) {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE tipo_ocorrencias_policiais SET tipo = ?,"

                    + "WHERE id = ?";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, baseTipoOcorrencia.getTipo());
            ps.setInt(3, baseTipoOcorrencia.getId());
            int resultado = ps.executeUpdate();
            return resultado;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;

        } finally {
            conexao.conectar();
        }
    }

    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_policiais";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement stt = conexao.conectar().prepareCall(sql);
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

    public static BaseTipoOcorrencia buscarOPPorID(int id) {
        BaseTipoOcorrencia tipoOcorrenciaPolicial = null;
        String sql = "SELECT tipo FROM tipo_ocorrencias_policiais WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                tipoOcorrenciaPolicial = new BaseTipoOcorrencia();
                tipoOcorrenciaPolicial.setId(id);
                tipoOcorrenciaPolicial.setTipo(rs.getString("tipo"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return tipoOcorrenciaPolicial;
    }

    public static ArrayList<BaseTipoOcorrencia> buscarOcorrenciaPolicial() {

        ArrayList<BaseTipoOcorrencia> ocorrenciasPoliciais = new ArrayList<>();
        String sql = "SELECT id, tipo FROM tipo_ocorrencias_policiais";

        Conexao conexao = new Conexao();
        try {
            Statement ps = conexao.conectar().createStatement();
            ps.execute(sql);
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                BaseTipoOcorrencia ocorrenciaPolicial = new BaseTipoOcorrencia();
                ocorrenciaPolicial.setId(rs.getInt("id"));
                ocorrenciaPolicial.setTipo(rs.getString("tipo"));
                ocorrenciasPoliciais.add(ocorrenciaPolicial);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciasPoliciais;


    }
    public static ArrayList<BaseOcorrencia> retornarOcorrenciaBombeiro(){
        ArrayList<BaseOcorrencia> tabelaOcorrenciaPolicial = new ArrayList<>();
        String sql = "SELECT id, id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia FROM ocorrencias_policiais";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
            stt.execute(sql);
            ResultSet rs = stt.getResultSet();
            while (rs.next()){
                BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();
                ocorrenciaPolicial.setId(rs.getInt("id"));
                ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(rs.getInt("id_tipo_ocorrencias_policiais")));
                //Tipo de ocorrencia
                ocorrenciaPolicial.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciaPolicial.setCep(rs.getString("cep"));
                ocorrenciaPolicial.setRua(rs.getString("rua"));
                ocorrenciaPolicial.setNumeroResidencia(rs.getInt("numero_residencia"));
                tabelaOcorrenciaPolicial.add(ocorrenciaPolicial);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            conexao.desconectar();
        }
        return tabelaOcorrenciaPolicial;
    }

}