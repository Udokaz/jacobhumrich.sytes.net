                                                <%-- 
    Document   : index
    Created on : Aug 10, 2018, 10:09:15 AM
    Author     : IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css"/>
        <title>Welcome</title>
    </head>
    <body>
        <div><%@ include file="header.html" %></div>
        <div class="container">
            <h2>Welcome</h2>
            <p>I set this site up to showcase my skills.</p>
			<ul>
				<li><a class="link" href="${pageContext.request.contextPath}/intro.jsp">Introduction</a> of myself</li>
				<li><a class="link" href="${pageContext.request.contextPath}/examples.jsp">Examples</a> of my work</li>
			</ul>
        </div>
        <div><%@ include file="footer.html" %></div>
    </body>
</html>
