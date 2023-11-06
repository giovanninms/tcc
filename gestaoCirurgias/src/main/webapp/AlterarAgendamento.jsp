<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="tabelas.TbAgendamentosCirurgias, dao.AgendamentosCirurgiasDao, java.text.SimpleDateFormat, java.sql.Date" %>
<%
    String id = request.getParameter("id");
TbAgendamentosCirurgias agendamento = AgendamentosCirurgiasDao.getRegistroById(Integer.parseInt(id));

%>

<form action="GatilhoAlterarAgendamento.jsp" method="post">
    <input type="text" name="idAgendamento" value="<%=agendamento.getIdAgendamento()%>" readonly="readonly"/>

    
            <h2>Local do Corpo:</h2>
            <select  name="localCorpo" required="required">
           		<option value="" selected disabled></option>
            	<option value="joelho" >Joelho</option>
            	<option value="quadril" >Quadril</option>
            	<option value="ombro" >Ombro</option>
            	<option value="tornozelo" >Tornozelo</option>
            </select>
            
      
            <h2>Tipo Cirurgia:</h2>
            <select name="tipoCirurgia" required="required">
            	<option value="" selected disabled></option>
            	<option value="Artroscopia" >Artroscopia</option>
            	<option value="Substituição de Articulação" >Substituição de Articulação</option>
            	<option value="'manguito rotador', " >Manguito Rotador</option>
            	<option value="tendão de aquiles" >Tendão de Aquiles</option>
            	<option value="lca" >LCA</option>
            	<option value="lcl" >LCL</option>
            	<option value="lcp" >LCP</option>
            	<option value="Menisco" >Menisco</option>
            </select>
       		
       		<h2>Data e Hora</h2>
       		<input name="dataHoraString" type="datetime-local" required="required" >
       		
           	<h2>Status:</h2>
            <select name="statusAgendamento" required="required">
            	<option value="" selected disabled></option>
            	<option value="pre_agendada">Pré Agendada</option>
            	<option value="agendada">Agendada</option>
            </select>
        
            <input type="submit" value="Salvar" >
      
</form>


</body>
</html>
