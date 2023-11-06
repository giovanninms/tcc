<%@page import="dao.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="tabelas.AgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>
<%
int i = AgendamentosCirurgiasDao.updateAgendamento(a);
	response.sendRedirect("index.jsp");
%>

