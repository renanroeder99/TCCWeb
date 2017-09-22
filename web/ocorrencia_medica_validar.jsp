<%@ page import="dao.OcorrenciaMedicaDAO" %><%

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("status"));
    if (id > 0) {
        OcorrenciaMedicaDAO.alterarTrote(id, trote);

    }
%>