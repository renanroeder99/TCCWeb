<%@ page import="dao.OcorrenciaPolicialDAO" %><%

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("status"));
    if (id > 0) {
        OcorrenciaPolicialDAO.alterarTrote(id, trote);

    }
%>