<%@ page import="dao.OcorrenciaDefesaCivilDAO" %><%

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("feedback"));
    if (id > 0) {
        OcorrenciaDefesaCivilDAO.alterarTrote(id, trote);

    }
%>