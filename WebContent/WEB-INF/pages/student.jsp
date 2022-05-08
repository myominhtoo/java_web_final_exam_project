<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<title>Student</title>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />
<script type="text/javascript" src="/student/javascripts/general.js" ></script>
<script type="text/javascript" src="/student/javascripts/accordion-menu.js" ></script>
<script type="text/javascript">
    window.onload=function()
    {
        menu();
        var param = getPara('flag');
        if(param==1)
        {
            document.getElementById('list').style.display="none";           
        }
        else if(param==2)
        {
            document.getElementById('list').style.display="block";
        }      

    }
    function changeName()
    {
        var ascName = document.getElementById('ascName').style.display;
        var dscName = document.getElementById('dscName').style.display;
        if(ascName == 'none')
        {
            document.getElementById('ascName').style.display = 'inline';
            document.getElementById('dscName').style.display= 'none';
        }
        else if(ascName == 'inline')
        {
            document.getElementById('ascName').style.display = 'none';
            document.getElementById('dscName').style.display= 'inline';
        }
    }
    function searchList()
    {
        document.getElementById('list').style.display="block";
    }

    function resetForm()
    {
        document.getElementById('message').innerHTML = "Message";
        document.getElementById('list').style.display="none";
    }

   
</script>
</head>
<body class="main_body">

	
	<div id="header">
        <div id="title">
            <a href="/student/home">Student Registration Assignment</a>
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
                    <div class="search_form">
                        <h3>Student Search Page</h3>
                    <form:form action="/student/searchstudent" method="post" modelAttribute="student">
                        <table class="tableForm">
                            <tr>
                                <td class="tblLabel">Student No.</td>                       
                                <td class="tblInputShort"><form:input type="text" path="studentId" value="${student.studentId}" cssClass="txt" placeholder="Student'Id" />  </td>
                                <td class="tblLabel">Student Name</td>  
                                <td class="tblInputShort">
                                <form:input type="text" path="studentName" value="${student.studentName}" cssClass="txt" placeholder="Student's Name"/></td>
                            <tr/> 
                            <tr>
                                <td class="tblLabel">Class Name</td> 
                                <td class="tblInputNormal" colspan="3"><form:input path="className" type="text" id="companyName" value="${student.className}" cssClass="txtlong"/></td>   
                            </tr>                                        
                        </table>
                        <br/> 
                            <button type="submit">Search</button>
                            <button type="reset"><a href="/student/student" >Reset</a></button>
                        <br/><br/>
                            <div id="errormsg">
                                <label id="message">${error}</label>
                            </div>      
                            <h3 style="color:green;	">${status}</h3>
                    </form:form>
            <div id="list">
              
                    <br />
                    <table class="resultTable">
                        <tr class="tblHeader">
                            <th width="5%">No</th>
                            <th width="10%">Student No</th>
                            <th width="25%">Student Name</th>
                            <th width="40%">Class Name</th>
                            <th width="10%">Registered Date</th>
                            <th width="10%">Status</th>
                        </tr>
                        <% int idx = 1; %>
                        <c:if test="${students != null && !students.isEmpty()}">
                        	<c:forEach items="${students}" var="student">
                        	<tr>
                        		<td><%= idx %></td>
                        		<td>${student.studentId}</td>
                        		<td><a href="/student/updatestudent/${student.studentId}">${student.studentName}</a></td>
                        		<td>${student.className}</td>
                        		<td>${student.registeredDate}</td>
                        		<td>${student.status}</td>
                        	</tr>
                        	<% ++idx; %>
                        </c:forEach>
                        </c:if>
                        <c:if test="${students == null || students.isEmpty()}" >
                        	<tr><td colspan="6">There is not student to show!</td></tr>
                        </c:if>
                    </table>
                    <br/>
                    
            </div> 
                    </div>   
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