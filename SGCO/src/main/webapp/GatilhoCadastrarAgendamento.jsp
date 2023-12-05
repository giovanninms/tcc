<%@page import="dao.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="tabelas.TbAgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>


<%
a.setStgFkPaciente(request.getParameter("stgFkPaciente"));
a.setStgFkMedico(request.getParameter("stgFkMedico"));
a.setStgFkHospital(request.getParameter("stgFkHospital"));


int i = AgendamentosCirurgiasDao.insertAgendamento(a);
	response.sendRedirect("ConsultarAgendamento.jsp");
%>