<%@page import="dao.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="tabelas.TbAgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>
<%
String id = request.getParameter("id");
int idInt = Integer.parseInt(id);
idInt = a.getIdAgendamento();
a.setStgFkMedico(request.getParameter("stgFkMedico"));
a.setStgFkHospital(request.getParameter("stgFkHospital"));
int i = AgendamentosCirurgiasDao.insertAgendamento(a, request);

if(i ==1){
	
	response.sendRedirect("ConsultarAgendamento.jsp");
}else{
	response.sendRedirect("CadastrarAgendamento.jsp");
}

%>