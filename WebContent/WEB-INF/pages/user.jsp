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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User</title>
<link rel="stylesheet" type="text/css" href="/student/stylesheets/container.css" />
<link rel="stylesheet" type="text/css" href="/student/stylesheets/base.css" />
<script type="text/javascript" src="/student/javascripts/general.js" ></script>
<script type="text/javascript" src="/student/javascripts/accordion-menu.js" ></script>
<script type="text/javascript">
	window.onload=function()
    {
    	menu();

        var param = getPara( 'flag');
        if(param==1)
        {
            document.getElementById('list').style.display="block";           
        }
        else
        {
            document.getElementById('list').style.display="none";
        }
    }

    function searchList(flag)
    {
        if(flag==1){
             document.getElementById('list').style.display="block";
        
        }else{
            document.getElementById('list').style.display="none";
           
        }
    }
	function resetForm()
	{
		document.getElementById('message').innerHTML = "Message";
		document.getElementById('list').style.display="none";
	}

	function checkDelete()
    {
        var con = confirm("Are you sure to delete?");
        if(con)
        {
            window.location.replace('user.html')
        }

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
				<h3>User Search</h3>
				<form:form action="/student/searchuser" method="POST" modelAttribute="user">
				<h6 style="color:green;">${status}</h6>
				<table class="tableForm">
					<tr>
						<td class="tblLabel"><label>User ID</label></td>
						<td class="tblInputNormal"><form:input path="userId"  cssClass="txt" placeholder="User'Id" />	</td>
	
						<td class="tblLabel">User Name	</td>
						<td class="tblInputNormal"><form:input  path="userName"  cssClass="txt" placeholder="Username"/>	　</td>
						
					</tr>
				</table>
				<br/>
				<a>
					<button type="submit">Search</button>
				</a>
				<a href="/student/registeruser">
                    <input type="button" value="Add" class="button" id="userInsert" />
                 </a>
				<a href="/student/user">Reset</a>
				</form:form>
				<br/>
				<br/>	
				<div id="errormsg">
					<label id="message">${error}</label>
				</div>
			</div>   

                <br/><br/><br/>
			<div>
				<form name="listForm" >
					<table class="" border="2" >
						<tr class="tblHeader">
							<th width="1%">Delete</th>
							<th width="1%">Update</th>
							<th width="12%">User ID</th>
							<th width="24%">User Name</th>
							
						</tr>
						<c:if test="${users != null && !users.isEmpty()}">
							<c:forEach items="${users}" var="user">
								<!-- to make not able to delete current user account -->
								<% 
									String status = "";
								%>
								<c:if test="${user.userId.equals(sessionScope.user.userId)}">
									<% status = "disabled"; %>
								</c:if>
								<tr>
								 	<td>
		                             	<a href="/student/deleteuser/${user.userId}"><input type="button" value="Delete" id="delete" class="button" <%= status %> onclick="return confirm('Are you sure to delete?');"/></a>
		                            </td>
									<td>
										<a href="/student/updateuser/${user.userId}">
		                            		<input type="button" value="Update" class="button" id="userUpdate" />
		                        		</a>
		                        	</td>
		                           
									<td>${user.userId}</td>
									<td>${user.userName}</td>                
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${users == null || users.isEmpty()}">	
							<tr style="text-align:center,color:red;">
								<td colspan="4" >There is no user to show!</td>
							</tr>
						</c:if>
					</table>
				</form>
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
