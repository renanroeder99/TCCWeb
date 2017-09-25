<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaDefesaCivilDAO" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 14/09/2017
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencias Defesa Civil</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
</head>
<tbody>
<script type="text/javascript">
    setTimeout(function(){
        location = ''
    },15000)
</script>
<thead>
<tr>
    <th>Código</th>
    <th>Ocorrencia</th>
    <th>Endereço</th>
    <th>Emissor</th>
    <th>Status</th>
    <th>Detalhes</th>
</tr>
</thead>

<tbody>

<% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaDefesaCivilDAO.retornarOcorrenciasDefesaCivil(); %>
<% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
<tr>
    <%String statusTrote;%>
    <td><%= ocorrencia.getId()%></td>
    <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
    <td><%= ocorrencia.endereco()%></td>
    <td><%= ocorrencia.getEmissor()%></td>
    <%if (ocorrencia.getStatus() == 1){%>
    <%statusTrote = "Trote";%>
    <%}else if (ocorrencia.getStatus() == 2){%>
    <%statusTrote = "Validado";%>
    <%}else{%>
    <%statusTrote = "Em aberto";%>
    <%}%>
    <td><%=statusTrote%></td>
        <td><a href="detalhes_ocorrencia_defesa_civil.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>
    </tr>
    <% } %>
    </tbody>
</table>

<a href="tela_receptor_cadastrar.jsp">Cadastrar Receptor</a>


</tbody>
</html>
