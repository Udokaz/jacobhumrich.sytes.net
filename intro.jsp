<%-- 
    Document   : intro
    Created on : Aug 10, 2018, 10:56:09 AM
    Author     : IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css"/>
        <title>Intro</title>
    </head>
    <body>
        <div><%@ include file="header.html" %></div>
        <div class="container">
            <h1>About Me</h1>
			<div id="paragraphs">
            <p>I graduated from California State University, East Bay with a Bachelors of Science in Computer Science with an emphasis on Software Engineering in 2018. 
                The emphasis on Software Engineering required that I take 3 extra classes. These classess were: Software Engineering 1, Software Engineering 2, and Software Testing.
			</p>
			<p>
				Software Engineering 1 focused on working in a group of about 5 people creating a project from start to finish. We had to come up with our own idea. Pick any language that we wanted and then create the project. 
				My group decided to use JavaFX to create a fulfilment system. You can learn more about it at <a href="${pageContext.request.contextPath}/fulfilment.jsp">Fulfilment System</a>.
				We wrote up a document paper, specs paper, and UMLs for the project. The class followed the waterfall approach but we coded everything in the agile approach.
			</p>
			<p>
				Software Engineering 2 focused on different design patterents. All of the assignemnts were done in Java. I learned factory, adaptor, iterator, compound, observer, command, and template patterns.
			</p>
			<p>
				Software Testing focused on using Python to test different programs. I tested the schools website by using Selenium. I wrote unit test to test code that was given to me that had errors in it.
			</p>
			</div>
			<div id="pic">
				<img>
			</div>
        </div>
		<div><%@ include file="footer.html" %></div>
    </body>
</html>
