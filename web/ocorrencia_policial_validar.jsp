<%@ page import="dao.OcorrenciaPolicialDAO" %><%

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("feedback"));
    if (id > 0) {
        int codigo = OcorrenciaPolicialDAO.alterarTrote(id, trote);
        if (codigo >-1){

        }

    }
%>