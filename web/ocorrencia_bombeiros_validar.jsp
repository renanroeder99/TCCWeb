<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>

<%  try {

    int id = Integer.parseInt(request.getParameter("id"));
    boolean trote = Boolean.parseBoolean(request.getParameter("feedback"));
    if (id > 0) {
        OcorrenciaCorpoDeBombeirosDAO.alterarTrote(trote);

    }
}catch (SQLException ex){

}
%>