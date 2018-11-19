<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    if(request.getParameter("id").equals(getMemberById(id))){
    out.print(false);
    }else{
    out.print(true);
    }
    