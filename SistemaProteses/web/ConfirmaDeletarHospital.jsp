<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
    int i = ConexaoDAO.DeletarHospital(h);
    response.sendRedirect("ConsultaHospitais.jsp");
    
%>