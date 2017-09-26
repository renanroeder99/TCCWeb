
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="model.Emissor"%>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="java.sql.Date" %>
<%@ page import="database.Utilitario" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Emissor emissor = new Emissor();

    emissor.setNome(request.getParameter("usuario-nome"));


    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    emissor.setDataNascimento(new java.sql.Date(format.parse(request.getParameter("usuario-data-nascimento")).getTime()));
    emissor.setEmail(request.getParameter("usuario-email"));
    emissor.setConfirmarEmail(request.getParameter("usuario-confirmar-email"));
    emissor.setSenha(request.getParameter("usuario-senha"));
    emissor.setConfirmarSenha(request.getParameter("usuario-confirmar-senha"));
    emissor.setRg(Integer.parseInt(request.getParameter("usuario-rg")));
    emissor.setCpf(request.getParameter("usuario-cpf"));
    emissor.setCep(Integer.parseInt(request.getParameter("usuario-cep")));

    if (String.valueOf(emissor.getCep()).charAt(0) != 8){
        request.setAttribute("mensagem","Cep Invalido");
    }

    System.out.println("AAAAA");
    emissor.setTelefone(Integer.parseInt(request.getParameter("usuario-telefone")));
    emissor.setEndereco(request.getParameter("usuario-endereco"));
    emissor.setNumeroResidencia(Integer.parseInt(request.getParameter("usuario-numero-residencia")));
    int codigo = EmissorDAO.alterar(emissor);
    
    System.out.println(codigo);
    if(codigo >= 0){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp?id=" + codigo);
    }else{

    }
%>

