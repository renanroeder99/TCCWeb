<%@ page import="model.Receptor" %>
<%@ page import="dao.ReceptorDAO" %><%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 18/09/2017
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
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
    receptor.setConfirmarSenha(request.getParameter("receptor-confirmar-senha"));
    receptor.setSenha(request.getParameter("senha"));
    receptor.setTelefone(request.getParameter("receptor-telefone")));
    receptor.setEndereco(request.getParameter("receptor-enderenco"));
    receptor.setCep(request.getParameter("receptor-cep"));
    receptor.setCargo(request.getParameter("receptor-cargo"));
    int codigo = ReceptorDAO.alterar(receptor);
    if(codigo > 0){
        response.sendRedirect("tela_escolher_ocorrencia.jsp?id=" + codigo);
    }else{

    }
%>

</body>
</html>
