
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="model.Emissor"%>
<%@ page import="dao.EmissorDAO" %>

<%
    Emissor emissor = new Emissor();
    emissor.setNome(request.getParameter("usuario-nome"));
    emissor.setUsuario();
    emissor.setDataNascimento();
    emissor.setEmail();
    emissor.setConfirmarEmail();
    emissor.setSenha();
    emissor.setConfirmarSenha();
    emissor.setRg();
    emissor.setCpf();
    emissor.setCep();
    emissor.setTelefone();
    emissor.setEndereco();
    emissor.setR
%>
