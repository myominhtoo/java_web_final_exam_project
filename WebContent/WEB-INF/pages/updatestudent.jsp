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
<title>Student Update</title>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />
<script type="text/javascript" src="/student/javascripts/general.js" ></script>
<script type="text/javascript" src="/student/javascripts/accordion-menu.js" ></script>
<script type="text/javascript">
     window.onload=function()
    {
        menu();  
    }

    function deleteBudget()
    {
        var isOk= confirm("Are you sure to delete?");
        if(isOk)
        {
            window.location.replace('BUD001.html?flag=2')  
        }
    }

    function update()
    {
        var con = confirm("Are you sure to update?");
        if(con)
        {
            window.location.replace('BUD001.html?flag=2')
        }
        
    }
    
    function showMessage(){     
        var message = confirm("Are you sure to register?");
        if(message)                 
        document.getElementById('errormsg').innerHTML = "Registration completed.";    
    }
    
    function addListData(source,destination)
    {
        var sourceList=document.getElementById(source.id);
        var sourceSelect=sourceList.selectedIndex;
        
        var len=sourceList.length;
        
        if(sourceSelect!=-1)
        {
            for(i=0;i<len;i++)
            {
                var isExist = false;
                var sourceText=sourceList.options[i].text;
                var destinationList=document.getElementById(destination.id);
                if(sourceList[i].selected)
                {
                    for(var j=0;j<destinationList.length;j++)
                    {
                        if(destinationList.options[j].text == sourceText)
                        {
                            isExist = true;
                        }
                    }
                    if(!isExist)
                    {
                        destinationList.options[destinationList.length]=new Option(sourceText,"0");     
                    }
                }
            }           
        }
    }
    function delListData(source)
    {
        var sourceList=document.getElementById(source.id);
        for(var index=0;index<sourceList.length;index++){   
            if (sourceList[index].selected) {
                sourceList.remove(index);
                delListData(source);
            }
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
                <form:form action="/student/updatestudent" method="POST" modelAttribute="student" class="search_form">
                    <h3>Student Update</h3>
                    <label id="errormsg"> ${error}</label><br/><br/><br/>
                    <table class="tableForm">
                        <tr height="30px">
                            <td class="tblSingleLabel">Student No.</td>
                            <td class="tblSingleInput"><form:input path="studentId" value="${student.studentId}" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td class="tblSingleLabel">Student Name *</td>
                            <td class="tblSingleInput">
                            <form:input path="studentName" value="${student.studentName}" cssClass="txtlong" required="required" />
                            </td>
                        </tr>
                        <tr>
                            <td class="tblSingleLabel">Class Name *</td>
                            <td class="tblSingleInput">  
                                <form:select path="className" id="expenseType" value="${student.className}" cssClass="normal_sel" required="required">
                                   <form:options path="className" items="${classes}"/>
                                </form:select>  
                            </td>                  
                        </tr>
                        <tr>
                            <td class="tblSingleLabel">Registered Date	 *</td>
                            <td class="tblSingleInput">  
                                <form:input path="registeredDate" type="date" value="${student.registeredDate}" required="required"/>
                            </td>                  
                        </tr>
                        <tr>
                            <td class="tblSingleLabel">Status *</td>
                            <td class="tblSingleInput">
                                <form:select id="expenseType" path="status" value="${student.status}" cssClass="normal_sel" required="required">
                                    <form:options path="status" items="${statuses}"/>
                                </form:select>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <div id="btnGroup">
                        <button type="submit" onclick="return confirm('Are you sure to update?');">Update</button>
                        <button><a href="/student/deletestudent/${student.studentId}" onclick="return confirm('Are you sure to delete?');">Delete</a></button>
                        <button><a href="/student/student">Back</a></button>
                    </div>
                </form:form> 
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