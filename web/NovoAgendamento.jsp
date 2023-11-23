<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="Tabelas.AgendamentosCirurgias, DAO.AgendamentosCirurgiasDao, java.text.SimpleDateFormat, java.sql.Date" %>
	
	<form action="GatilhoNovoAgendamento.jsp" method="post">
    
            <h2>Local do Corpo:</h2>
            <select  name="localCorpo">
           		<option value="" selected disabled></option>
            	<option value="joelho" >Joelho</option>
            	<option value="quadril" >Quadril</option>
            	<option value="ombro" >Ombro</option>
            	<option value="tornozelo" >Tornozelo</option>
            </select>
            
      
            <h2>Tipo Cirurgia:</h2>
            <select name="tipoCirurgia">
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
       
           	<h2>Status:</h2>
            <select name="statusAgendamento">
            	<option value="" selected disabled></option>
            	<option value="pre_agendada">Pré Agendada</option>
            	<option value="agendada">Agendada</option>
            </select>
        
            <input type="submit" value="Agendar" >
      
</form>
	
	
	
</body>
</html>