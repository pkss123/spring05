<%@ page import="src.memberdto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();

	dto.setId(request.getParameter("id"));
	dto.setPassword(request.getParameter("password"));
	
	dto = MemberDAO.getInstance().checkLogin(dto);
	
	boolean check = false;
	String msg = null;
	
	if(dto != null){
		check = true;
		msg = dto.getName() + "님이 로그인 되었습니다.";
		
		session.setAttribute("login",dto);
		
		String ckid = request.getParameter("ckid");
		
		Cookie[] cks = request.getCookies();
		
		if(ckid != null){
			boolean c = true;
			for(Cookie ck : cks){
				if(ck.getName().equals("ckid")){
					if(ckid != null){
						if(!dto.getId().equals(ck.getValue())){
							ck = new Cookie("ckid",dto.getId());
							
							ck.setMaxAge(60 * 60 * 24);
							
							System.out.println("111111111");
							response.addCookie(ck);
						}
					}else{
						if(dto.getId().equals(ck.getValue())){							
							ck.setMaxAge(0);
							
							response.addCookie(ck);
							System.out.println("asdfasdf");
					}
				}
					c = false;
					break;
			}
		}
			if(c&& ckid!=null){
				
			}
			
		}else if(ckid != null){
			Cookie ck = new Cookie("ckid",dto.getId());
			
			ck.setMaxAge(60 * 60 * 24);
			
			response.addCookie(ck);
		}
		
	}else{
		msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
	}
	
	request.setAttribute("check",check);
	request.setAttribute("msg",msg);
	
	pageContext.forward("/login/result.jsp");
%>