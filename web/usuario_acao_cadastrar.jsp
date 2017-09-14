
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="model.Emissor"%>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="java.sql.Date" %>

<%
    Emissor emissor = new Emissor();
    emissor.setNome(request.getParameter("usuario-nome"));
    emissor.setUsuario(request.getParameter("usuario-username"));
    emissor.setDataNascimento(Date.valueOf(request.getParameter("usuario-data-nascimento")));
    emissor.setEmail(request.getParameter("usuario-email"));
    emissor.setConfirmarEmail(request.getParameter("usuario-confirmar-email"));
    emissor.setSenha(request.getParameter("usuario-senha"));
    emissor.setConfirmarSenha(request.getParameter("usuario-confirmar-senha"));
    emissor.setRg(Integer.parseInt(request.getParameter("usuario-rg")));
    emissor.setCpf(request.getParameter("usuario-cpf"));
    emissor.setCep(Integer.parseInt(request.getParameter("usuario-cep")));
    emissor.setTelefone(Integer.parseInt(request.getParameter("usuario-telefone")));
    emissor.setEndereco(request.getParameter("usuario-endereco"));
    emissor.setNumeroResidencia(Integer.parseInt(request.getParameter("usuario-numero-residencia")));

%>
