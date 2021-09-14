<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

	boolean check = false;
	String id = "";
	
	Cookie[] cks = request.getCookies();
	
	if(cks != null){
		for(Cookie ck : cks){
			if(ck.getName().equals("ckid")){
				id = ck.getValue();
				check=true;
				break;
			}
		}
		
	}
	
	request.setAttribute("id",id);
	request.setAttribute("check",check);
	
	pageContext.forward("/login.jsp");
<%@ include file="footer.jsp"%>