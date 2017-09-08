package dao;

import database.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.TipoOcorrenciaDefesaCivil;

/**
 *
 * @author 98930
 */
public class TipoOcorrenciaDefesaCivilDAO {

    public static int chamarDefesaCivil(TipoOcorrenciaDefesaCivil defesaCivil) {
        String sql = "INSERT INTO tipo_ocorrencias_defesa_civil (descricao, localizacao, chamar_ambulancia) VALUES (?,?,?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, defesaCivil.getDescricao());
            ps.setString(2, defesaCivil.getLocalizacao());
            ps.setBoolean(3, defesaCivil.isChamarAmbulancia());

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

    public static int alterar(TipoOcorrenciaDefesaCivil defesaCivil) throws SQLException {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE tipo_ocorrencias_defesa_civil SET"
                    + " descricao = ?, "
                    + " localizacao = ?"
                    + "WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            
            ps.setString(1, defesaCivil.getDescricao());
            ps.setString(2, defesaCivil.getLocalizacao());
            ps.setBoolean(3, defesaCivil.isChamarAmbulancia());
            
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
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_defesa_civil";
        Conexao conexao = new Conexao();
        try {
            java.sql.Statement stt = conexao.conectar().createStatement();
            stt.execute(sql);
            ResultSet resultado = stt.getResultSet();
            if (resultado.next()) {
                return resultado.getInt("quantidades");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return -1;
    }

    public static TipoOcorrenciaDefesaCivil buscarDCPorId(int codigo) {
        TipoOcorrenciaDefesaCivil defesaCivil = null;
        String sql = "SELECT descricao, localizacao, chamar_ambulancia FROM tipo_ocorrencias_defesa_civil WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                defesaCivil = new TipoOcorrenciaDefesaCivil();
                defesaCivil.setId(codigo);
                defesaCivil.setDescricao(rs.getString("descricao"));
                defesaCivil.setLocalizacao(rs.getString("localizacao"));
                defesaCivil.setChamarAmbulancia(rs.getBoolean("chamar_ambulancia"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return defesaCivil;
    }

}
