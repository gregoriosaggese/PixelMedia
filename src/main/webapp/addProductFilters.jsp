<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    if (request.getParameter("cat") != null ){
        //controlla la categoria dal product bean 
        // setta la sessione
        String category = request.getParameter("cat");
        session.setAttribute("cat", category);
    }
    if (request.getParameter("scat") != null ){
        //controlla la sotto-categoria dal product bean 
        //setta la sessione
        String subcategory = request.getParameter("scat");
        session.setAttribute("scat", subcategory);
    }
    response.sendRedirect("viewProducts_.jsp");
%>
