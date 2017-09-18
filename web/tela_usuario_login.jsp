<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("emissor") != null){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }
    if(session.getAttribute("receptor") != null){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
        Receptor receptor = (Receptor) session.getAttribute("receptor");
        switch (receptor.getCargo()) {
            case "MED":
                response.sendRedirect("tela_receptor_medico.jsp");
                break;
            case "DFC":
                response.sendRedirect("tela_receptor_defesa_civil.jsp");
                break;
            case "CDB":
                response.sendRedirect("tela_receptor_medico.jsp");
                break;
            case "POL":
                response.sendRedirect("tela_receptor_policial.jsp");
                break;
        }
    }
%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login de usuário</title>
</head>
<body>
    <div>
        <form action="_usuario_acao_login.jsp" method="post">
            <div>
                <label for="usuario-username">Nome de usuário</label>
                <input type="email" name="usuario-username" id="usuario-username">
            </div>
            <div>
                <label for="usuario-senha">Senha</label>
                <input type="password" name="usuario-senha" id="usuario-senha">
            </div>
            <button type="submit">Entrar</button>
        </form>
    </div>
    <a href="tela_usuario_cadastrar.jsp">Cidadão novo? Cadastre-se</a>

    <a href=""></a>
</body>
</html>
