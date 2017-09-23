<%@ page import="dao.OcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseOcorrencia" %>

<% try{
    int id = Integer.parseInt(request.getParameter("id"));

    if(id > 0) {
        OcorrenciaDefesaCivilDAO.excluirDefesaCivil(id);
        BaseOcorrencia ocorrencia = OcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivilPorId(id);
        if (ocorrencia == null) {
            response.sendRedirect("tela_receptor_defesa_civil.jsp?message=ok");
        } else {
            response.sendRedirect("tela_receptor_defesa_civil.jsp?message=errou");
        }
    }
    }catch (NumberFormatException e){

    }
%>