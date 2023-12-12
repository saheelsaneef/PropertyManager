
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="Report.css">
<title>Report</title>
</head>
<body>


<section class="Navbar">
	<nav class="nav flex-column">	
		<img src="Images/Revised (1).png" class="border border-5 border-dark mt-5 " alt="Profile">
		<p class="nav-link text-white fs-4 text-center">Property Manager</p>
		<a class="nav-link text-white mt-3 " href="#"><i class="fa-solid fa-house me-3"></i>Dashboard</a>
    	<a class="nav-link text-white" href="#"><i class="fa-solid fa-phone me-3 "></i>Contact</a>
    	<a class="nav-link text-white" href="#"><i class="fa-solid fa-bars me-3"></i>About</a>
    	<a class="nav-link text-white" href="logout" onclick="logout()"><i class="fa-solid fa-arrow-right-from-bracket fa-rotate-180 me-3"></i>LogOut </a>
	</nav>
</section>


<section class="home">

	<div class="button">
		<a href="ReportForm.jsp"><button type="button" class="btn btn-primary">Create Report</button></a>
		<a href="EditReport.jsp"><button type="button" class ="btn btn-dark">Edit Report</button></a>
     	<a href="DeleteReport.jsp"><button type="button" class="btn btn-danger">Delete Report</button></a>
	</div>


	<table class="table table-primary table-striped ">
		<thead>
    		<tr>
    			<th scope="col">ID</th>
      			<th scope="col">Date</th>
      			<th scope="col">Income</th>
      			<th scope="col">Status</th>
      			<th scope="col">Update</th>
      			<th scope="col">Delete</th>
    		</tr>
  		</thead>
  		<tbody>
  		
  			<c:forEach var="report" items="${reportList}">	
   				<tr>	
   					<td>${report.id}</td>
   					<td>${report.income}</td>
   					<td>${report.date}</td>
   					<td>${report.status}</td>
   					<td><a href="EditReport.jsp?id=${report.id}" class="btn btn-primary">Edit</a></td>
            		<td><a href="deleteReport?id=${report.id}" class="btn btn-danger">Delete</a></td>
      			</tr>
      		</c:forEach>
  		</tbody>
	</table> 
	
	
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>function logout() {
    var confirmLogout = confirm("Do you want to log Out!");
    if (confirmLogout) {
        window.location.href = "login.jsp";
    }
} 
</script>

</body>
</html>

        		    	