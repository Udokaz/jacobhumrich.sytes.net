<%-- 
    Document   : examples
    Created on : Aug 10, 2018, 10:56:30 AM
    Author     : IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css"/>
        <title>Examples</title>
    </head>
    <body>
        <div><%@ include file="header.html" %></div>
        <div class="container">
            <h1>Example Projects</h1>
            <div>
                <h3>Java</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath}/fulfilment.jsp">Fulfilment System</a></li>
				</ul>
            </div>
            <div>
                <h3>Web app</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath}/Calculator.jsp">A simple Calculator</a></li>
					<li><a href="${pageContext.request.contextPath}/Sudoku.jsp">Sudoku</a></li>
				</ul>
            </div><!--
            <div>
                <h3>C++</h3>
				<ul>
					<li>In the works.</li>
					<li><a href="${pageContext.request.contextPath}/.jsp"></a></li>
				</ul>
            </div>
            <div>
                <h3>Python</h3>
				<ul>
					<li>In the works.</li>
					<li><a href="${pageContext.request.contextPath}/.jsp"></a></li>
				</ul>
            </div> -->
        </div>
		<div><%@ include file="footer.html" %></div>
    </body>
</html>
