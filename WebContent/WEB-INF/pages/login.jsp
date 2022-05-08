<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<c:url value="/stylesheets/container.css" var="containerCSS"/>
<c:url value="/stylesheets/base.css" var="baseCSS"/>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />

</head>
<body class="main_body">
	<div id="header">
        <div id="title">
            <h3>Student Registration Assignment</h3>     
        </div> 
    </div>

    <div id="container"> 
        <div id="main_contents">     
                <div style="margin-left:35%">
               		<h3 style="color:red;">${error}</h3>
               		<h3 style="color:green;">${status}</h3>
                    <form:form action="/student/login" method="POST" modelAttribute="user">
                    <br />  
                    <table class="sortName">
                        <tr>
                            <td colspan="2" align="center">
                                <h3>Login</h3>
                            </td>
                        </tr>                   
             
                        <tr align="left">
                            <td>
                                User ID
                            </td>
                            
                            <td>
                                <form:input path="userId" value="${user.userId}"/>
                            </td>
                            <td>
                           	 	<form:errors path="userId"/>
                            </td>
                        </tr>
                        
                        <tr align="left">
                            <td><br/>
                                Password
                            </td>
                            
                            <td>
                                <form:password path="password" value="${user.password}"/>
                            </td>
                           <td>
                           	 	<form:errors path="password"/>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="2"><br/>
                            <table>
                            <tr>
                                    <td>
                                       <button type="submit">Login</button>
                                    </td>
                                </tr>
                                
                            </table>
                      </td>
                        </tr>                             
                    </table> 
                    </form:form>  

            </div>  
        </div> <!-- end of main contents --> 
    </div><!-- end of container -->
    
    <div class="footer">    
        <span>Copyright &#169; ACE Inspiration 2016</span>
    </div>   
   
</body>
</html>