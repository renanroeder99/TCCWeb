<%--
  Created by IntelliJ IDEA.
  User: wanderson
  Date: 12/09/2017
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="model.Receptor" %>
<%@ page import="dao.ReceptorDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>

<%
    Receptor receptor = new Receptor();
    receptor.setNome(request.getParameter("receptor-nome"));
    receptor.setCpf(request.getParameter("receptor-cpf"));
    receptor.setEmail(request.getParameter("receptor-email"));
    receptor.setSenha(request.getParameter("receptor-senha"));
    receptor.setTelefone(request.getParameter("receptor-telefone"));
    receptor.setEndereco(request.getParameter("receptor-endereco"));
    receptor.setCep(request.getParameter("receptor-cep"));
    receptor.setCargo(request.getParameter("receptor-cargo"));
    int codigo = ReceptorDAO.cadastrar(receptor);
    if(codigo > 0){
        response.sendRedirect("tela_usuario_login.jsp");
    }else{

    }
%>
</body>
</html>