<%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 14/09/2017
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="ocorrencia_policial_acao_emitir.jsp" method="POST">
    <div>
        <label for="ocorrencia-policial-cep">Cep</label>
        <input type="text" id="ocorrencia-policial-cep" name="ocorrencia-policial-cep">
    </div>
    <div>
        <label for="ocorrencia-policial-rua">Rua</label>
        <input type="text" id="ocorrencia-policial-rua" name="ocorrencia-policial-rua">
    </div>
    
    <div>
        <label for="ocorrencia-policial-numero-residencia">Número Residência</label>
        <input type="text" id="ocorrencia-policial-numero-residencia" name="ocorrencia-policial-numero-residencia">
    </div>
    <div>
        <select name="crimes" id="crimes"></select>
        <option value="Assédio">Assédio</option>
        <option value="Furto">Furto</option>
        <option value="Vandalismo"></option>
        <option value="Perturbação à ordem pública">Perturbação à ordem pública</option>
        <option value="Assalto">Assalto</option>
        <option value="Roubo">Roubo</option>
        <option value="Agressão física">Agressão Física</option>
        <option value="Violência Domestica">Violência Domestica</option>
        <option value="Homicídio">Homicídio</option>
        <option value="Latrocínio">Latrocínio</option>
        <option value="Sequestro">Sequestro</option>
        <option value="Estupro">Estupro</option>
        <option value="Abuso de menor">Abuso de Menor</option>
        

    </div>
    
</form>

</body>
</html>
