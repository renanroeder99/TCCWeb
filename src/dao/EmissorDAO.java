/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Conexao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.Utilitario;
import model.Emissor;

/**
 *Comentario random
 *
 * @author Renan Roeder, 08-23-2017.
 */
public class EmissorDAO {

    public static int cadastrar(Emissor emissor) throws SQLException {
        String sql = "INSERT INTO emissores (senha, nome, cpf, rg, endereco, telefone_celular, email, cep, data_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Conexao conexao = new Conexao();
        String senha = emissor.getSenha();
        try {

            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, Utilitario.gerarHASH(emissor.getSenha()));
            ps.setString(2, emissor.getNome());
            ps.setString(3, emissor.getCpf());
            ps.setInt(4, emissor.getRg());
            ps.setString(5, emissor.getEndereco());
            ps.setString(6, emissor.getTelefone());
            ps.setString(7, emissor.getEmail());
            ps.setString(8, emissor.getCep());
            ps.setDate(9, emissor.getDataNascimento());

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

    public static int alterar(Emissor usuario) {
        Conexao conexao = new Conexao();
        try {

            String sql = "UPDATE emissores SET"
                    + " senha = ?,"
                    + " nome = ?,"
                    + " cpf = ?,"
                    + " rg = ?,"
                    + " endereco = ?,"
                    + " telefone_celular = ?,"
                    + " email = ?,"
                    + " cep = ?, "
                    + " data_nascimento = ? "
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1,Utilitario.gerarHASH(usuario.getSenha()));
            ps.setString(2, usuario.getNome());
            ps.setString(3, usuario.getCpf());
            ps.setInt(4, usuario.getRg());
            ps.setString(5, usuario.getEndereco());
            ps.setString(6, usuario.getTelefone());
            ps.setString(7, usuario.getEmail());
            ps.setString(8, usuario.getCep());
            ps.setInt(10, usuario.getId());
            ps.setDate(9, usuario.getDataNascimento());

            int resultado = ps.executeUpdate();
            return resultado;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        } finally {
            conexao.desconectar();
        }

    }

    public static void excluir(int codigo) {
        String sql = "DELETE FROM emissores WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setInt(1, codigo);
            ps.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
    }

    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM emissores";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
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

    public static Emissor buscarEmissorPorID(int codigo) {
        Emissor cadastroUsuario = null;
        String sql = "SELECT id, senha, nome, cpf, rg, endereco, telefone_celular, email, cep, data_nascimento FROM emissores WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                cadastroUsuario = new Emissor();
                cadastroUsuario.setId(codigo);
                cadastroUsuario.setNome(rs.getString("nome"));
                cadastroUsuario.setSenha(rs.getString("senha"));
                cadastroUsuario.setCpf(rs.getString("cpf"));
                cadastroUsuario.setRg(rs.getInt("rg"));
                cadastroUsuario.setEndereco(rs.getString("endereco"));
                cadastroUsuario.setTelefone(rs.getString("telefone_celular"));
                cadastroUsuario.setEmail(rs.getString("email"));
                cadastroUsuario.setCep(rs.getString("cep"));
                cadastroUsuario.setDataNascimento(rs.getDate("data_nascimento"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return cadastroUsuario;
    }

    public static Emissor realizarLogin(String email, String senha) {
        String sql = "SELECT id FROM emissores WHERE email = ? AND senha = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, Utilitario.gerarHASH(senha));
            ps.execute();
            ResultSet rs = ps.getResultSet();
            if (rs.next()) {
                return buscarEmissorPorID(rs.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return null;
    }


    public static Emissor retornarEmissorPorId(int id) {
        Emissor emissor = null;
        String sql = "SELECT id, senha, nome, data_nascimento, cpf, rg,  endereco, telefone_celular, email, cep FROM emissores WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet resultados = ps.getResultSet();
            if (resultados.next()) {
                emissor = new Emissor();
                emissor.setId(resultados.getInt("id"));
                emissor.setSenha(resultados.getString("usuario-senha"));
                emissor.setNome(resultados.getString("usuario-nome"));
                emissor.setDataNascimento(resultados.getDate("usuario-data-nascimento"));
                emissor.setCpf(resultados.getString("usuario-cpf"));
                emissor.setRg(resultados.getInt("usuario-rg"));
                emissor.setEndereco(resultados.getString("usuario-endereco"));
                emissor.setEndereco(resultados.getString("usuario-telefone"));
                emissor.setEmail(resultados.getString("usuario-email"));
                emissor.setCep(resultados.getString("usuario-cep"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexao.desconectar();
        }
        return emissor;
    }

    public List<Emissor> retornarEmissores() {
        List<Emissor> jogos = new ArrayList<>();
        String sql = "SELECT id, usuario, nome, cpf, rg, endereco, telefone_celular, email, cep, data_nascimento FROM emissores WHERE id = ?";
        Conexao cx = new Conexao();
        try {
            Statement stt = cx.conectar().createStatement();
            stt.execute(sql);
            ResultSet rs = stt.getResultSet();
            while (rs.next()) {
                Emissor emissor = new Emissor();
                emissor.setId(rs.getInt("id"));
                emissor.setUsuario(rs.getString("usuario-username"));
                emissor.setNome(rs.getString("usuario-nome"));
                emissor.setCpf(rs.getString("usuario-cpf"));
                emissor.setRg(rs.getInt("usuario-rg"));
                emissor.setEndereco(rs.getString("usuario-endereco"));
                emissor.setTelefone(rs.getString("usuario-telefone"));
                emissor.setEmail(rs.getString("usuario-email"));
                emissor.setCep(rs.getString("usuario-cep"));
                emissor.setDataNascimento(rs.getDate("data_nascimento"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return jogos;
    }

}