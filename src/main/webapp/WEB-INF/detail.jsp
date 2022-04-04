<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Expense Detail Page</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="js/app.js"></script>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container pt-5">
 		<div class="row justify-content-between">
		 	<div class="col-4">
				<h1>Expense Details</h1>
			</div>
			<div class="col-4">
				<a href="/expenses/">Go Back</a>
			</div>
			<table style="width:50%" class="table table-borderless mt-3">
				<tbody>
					<tr>
				        <td>Expense Name:</td>
				        <td><c:out value="${expense.expenseName}"></c:out></td>
			        </tr>
			      	<tr>
				        <td>Expense Description:</td>
				        <td><c:out value="${expense.description}"></c:out></td>
			      	</tr>
			      	<tr>
				        <td>Vendor:</td>
				        <td><c:out value="${expense.vendor}"></c:out></td>
					</tr>
					<tr>
				        <td>Amount Spend:</td>
				        <td>$<c:out value="${expense.amount}"></c:out></td>
					</tr>
   				</tbody>
			</table>
		</div>
	</div>
</body>
</html>