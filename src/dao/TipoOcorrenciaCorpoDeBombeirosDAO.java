package dao;

import com.mysql.jdbc.Statement;
import database.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.TipoOcorrenciaCorpoDeBombeiros;

/**
 *
 * @author Daiane Machado, date = 08/29/17
 */
public class TipoOcorrenciaCorpoDeBombeirosDAO {

    public static int chamadoBombeiros(TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros) {
        String sql = "INSERT INTO tipo_ocorrencias_bombeiros (tipo, descricao) VALUES (?, ?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, corpoDeBombeiros.getTipo());
            ps.setString(2, corpoDeBombeiros.getDescricao());

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

    public static int alterar(TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros) throws SQLException {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE tipo_ocorrencias_bombeiros SET"
                    + " tipo = ?, "
                    + " descricao = ?"
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, corpoDeBombeiros.getTipo());
            ps.setString(2, corpoDeBombeiros.getDescricao());

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
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_bombeiros";
        Conexao conexao = new Conexao();
        try {
            java.sql.Statement stt = conexao.conectar().createStatement();
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

    public static TipoOcorrenciaCorpoDeBombeiros buscarCBPorID(int id) {
        TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros = null;
        String sql = "SELECT id, tipo, descricao FROM tipo_ocorrencias_bombeiros WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                corpoDeBombeiros = new TipoOcorrenciaCorpoDeBombeiros();                
                corpoDeBombeiros.setId(rs.getInt("id"));
                corpoDeBombeiros.setTipo(rs.getString("tipo"));
                corpoDeBombeiros.setDescricao(rs.getString("descricao"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return corpoDeBombeiros;
    }
}
