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

import database.Utilitario;
import model.Receptor;

/**
 *
 * @author Renan Roeder, 08-23-2017.
 */
public class ReceptorDAO {

    public static int cadastrar(Receptor cadastroAdministrador) throws SQLException {
        String sql = "INSERT INTO receptores (nome_completo, senha, cpf, cargo, endereco, telefone_celular, email, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        Conexao conexao = new Conexao();
        String senha = cadastroAdministrador.getSenha();

        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cadastroAdministrador.getNome());
            ps.setString(2, Utilitario.gerarHASH(cadastroAdministrador.getSenha()));
            ps.setString(3, cadastroAdministrador.getCpf());
            ps.setString(4, cadastroAdministrador.getCargo());
            ps.setString(5, cadastroAdministrador.getEndereco());
            ps.setString(6, cadastroAdministrador.getTelefone());
            ps.setString(7, cadastroAdministrador.getEmail());
            ps.setString(8, cadastroAdministrador.getCep());

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

    public static int alterar(Receptor cadastroAdministrador) {
        Conexao conexao = new Conexao();
        try {

            String sql = "UPDATE receptores SET nome_completo = ?,"
                    + " senha = ?,"
                    + " cpf = ?,"
                    + " cargo = ?,"
                    + " endereco = ?,"
                    + " telefone_celular = ?,"
                    + " email = ?,"
                    + " cep = ? "
                    + "WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setString(1, cadastroAdministrador.getNome());
            ps.setString(2, Utilitario.gerarHASH(cadastroAdministrador.getSenha()));
            ps.setString(3, cadastroAdministrador.getCpf());
            ps.setString(4, cadastroAdministrador.getCargo());
            ps.setString(5, cadastroAdministrador.getEndereco());
            ps.setString(6, cadastroAdministrador.getTelefone());
            ps.setString(7, cadastroAdministrador.getEmail());
            ps.setString(8, cadastroAdministrador.getCep());
            ps.setInt(9, cadastroAdministrador.getId());

            int resultado = ps.executeUpdate();
            return resultado;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar();
        }

    }

    public static void excluir(int codigo) {
        String sql = "DELETE FROM receptores WHERE id = ?;";
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
        String sql = "SELECT COUNT (id) AS quantidade FROM receptores";
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

    public static Receptor buscarReceptorPorID(int codigo) {
        Receptor administrador = null;
        String sql = "SELECT nome_completo, senha, cpf, cargo, endereco, telefone_celular, email, cep FROM receptores WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                administrador = new Receptor();
                administrador.setId(codigo);
                administrador.setNome(rs.getString("nome_completo"));
                administrador.setSenha(rs.getString("senha"));
                administrador.setCpf(rs.getString("cpf"));
                administrador.setCargo(rs.getString("cargo"));
                administrador.setEndereco(rs.getString("endereco"));
                administrador.setTelefone(rs.getString("telefone_celular"));
                administrador.setEmail(rs.getString("email"));
                administrador.setCep(rs.getString("cep"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return administrador;
    }

    public static Receptor realizarLogin(String email, String senha) {
        String sql = "SELECT id FROM receptores WHERE email = ? AND senha = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, Utilitario.gerarHASH(senha));
            ps.execute();
            ResultSet rs = ps.getResultSet();
            if (rs.next()) {
                    return buscarReceptorPorID(rs.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return null;

    }
}
