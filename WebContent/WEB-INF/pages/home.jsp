<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<c:if test="${sessionScope.user == null || !sessionScope.isLogin}">
	<% response.sendRedirect("/student/login"); %>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />
<script type="text/javascript" src="/student/javascripts/accordion-menu.js?v=1.1" ></script>
<script type="text/javascript" src="/student/javascripts/general.js?v=1.1" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();  
    }

</script>
</head>
<body class="main_body">

	<div id="header">
        <div id="title">
            <a href="home.html">Student Registration Assignment</a>
        </div>
          <div id="menuLoginTime">
            <table >
                <tr>
                    <td>User</td><td>: ${sessionScope.user.userId} ${sessionScope.user.userName}</td>
                </tr>
                <tr>
                    <td>Current Date</td><td>:  <span id="date"></span></td>
                </tr>
                
                <tr>
                	<td>
                		<button><a href="/student/logout" onclick="return confirm('Are you sure to logout?');">Logout</a></button>
                	</td>
                </tr>
            </table>
        </div>
        
    </div>

    <div id="container"> 
            <div id="left_menu">
                <!-- menu html code exist the menu function of general.js -->
            </div>
            <div id="main_contents">     
                <div id="contents">
                <h5 style="color:green;">${status}</h5>
                <h4 style="color:brown;">Welcome ${sessionScope.user.userName} ...!<br/><br/>
This is the final exam project of the Java Web Development Course.</h4>
                </div>

            </div> 
            
     </div>

    <div class="footer"> 
            <span>Copyright &#169; ACE Inspiration 2016</span>        
    </div>
    
     <!--  for dynamic date -->
   	 <script src="/student/javascripts/date.js" type="text/javascript"></script>
</body>
</html>