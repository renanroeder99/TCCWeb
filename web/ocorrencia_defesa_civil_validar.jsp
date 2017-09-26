<%@ page import="dao.OcorrenciaDefesaCivilDAO" %><%

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("feedback"));
    String statusTrote;
    if (id > 0) {
        OcorrenciaDefesaCivilDAO.alterarTrote(id, trote);
        if (trote == 1){
            statusTrote = "Trote";
        }else if (trote == 2){
            statusTrote = "Validado";
        }
    }
%>