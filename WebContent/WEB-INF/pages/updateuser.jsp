<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<title>User Update</title>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />
<script type="text/javascript" src="/student/javascripts/general.js" ></script>
<script type="text/javascript" src="/student/javascripts/accordion-menu.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();     

    }
	
	function update()
    {
        var con = confirm("Are you sure to register?");
        if(con)
        {
            window.close();
        }
        
    }
</script>
</head>
<body class="main_body">
 
	<div id="header">
        <div id="title">
            <a href="home.html">Student Registration Assignment</a>
        </div>
          <div id="menuLoginTime">
            <table>
                <tr>
                    <td>User</td><td>: ${sessionScope.user.userId} ${sessionScope.user.userName}</td>
                </tr>
                <tr>
                    <td>Current Date</td><td>:  <span id="date"></span></td>
                </tr>
            </table>
        </div>
        <button style="margin-left:1000px;"><a href="/student/logout" onclick="return confirm('Are you sure to logout?');">Logout</a></button>
    </div>

    <div id="container"> 
		<div id="left_menu">
                <!-- menu html code exist the menu function of general.js -->
        </div>
        <div id="main_contents">   
			<div id="contents">
				<h3>User Update</h3>
				<label id="errormsg" >${error}</label><br/><br/><br/>
t
				<form:form action="/student/updateuser" method="POST" modelAttribute="usr">
					<table class="tableForm">
						<tr>
							<td class="tblSingleLabel"> User ID *</td>
							<td class="tblSingleInput"><form:input path="userId" value="${user.userId}" readonly="true"/></td>
						</tr>
						<tr>
							<td class="tblSingleLabel">User Name</td>
							<td class="tblSingleInput"><form:input path="userName" cssClass="txtlong_popup" id="txtUserName" value="${user.userName}" required="required"/></td>              
						</tr>
	 
						<tr>
							<td class="tblSingleLabel">Password *</td>
							<td class="tblSingleInput"><form:password  path="password" cssClass="txtlong_popup" id="txtUserName" value="${user.password}" required="required"/></td>              
						</tr>
						<tr>
							<td class="tblSingleLabel">Confirm Password *</td>
							<td class="tblSingleInput"><form:password path="comfirmPassword" cssClass="txtlong_popup" id="txtUserName" value="${user.password}" required="required"/></td>              
						</tr>
					</table>
					<br/>
								
					<input type="submit" value="Update" class="button" onclick="return confirm('Are you sure to update?');" />
					<a class="button" href="/student/user">Back</a>
				</form:form>

				<br/><br/><br/>
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