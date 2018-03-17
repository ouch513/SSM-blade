<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String webPath = request.getContextPath();

    request.setAttribute("webPath",webPath);
    request.setAttribute("staticResourcePath",webPath+"/module/static");
%>
