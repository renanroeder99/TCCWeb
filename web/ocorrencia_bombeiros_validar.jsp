<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>

<%  try {

    int id = Integer.parseInt(request.getParameter("id"));
    int trote = Integer.parseInt(request.getParameter("status"));
    if (id > 0) {
        OcorrenciaCorpoDeBombeirosDAO.alterarTrote(id, trote);

    }
}catch (SQLException ex){

}
%>