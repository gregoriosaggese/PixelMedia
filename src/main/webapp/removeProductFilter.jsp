<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (request.getParameter("cat") != null ){
        session.removeAttribute("cat");
    }
    if (request.getParameter("scat") != null ){
        session.removeAttribute("scat");
    }
    response.sendRedirect("viewProducts_.jsp");
%>
