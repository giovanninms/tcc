<%@page import="dao.*"%>
<jsp:useBean id="h" class="tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    int i = HospitalDao.CadastrarHospital(h, request); 
if(i==1){
	response.sendRedirect("ConsultarHospitais.jsp");
}else{
	response.sendRedirect("CadastrarHospital.jsp");
}
    
    
    

%>
