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
	<title>Save Travel</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="js/app.js"></script>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
<div class="container pt-5">
	<div class="row">
		<h1>Save Travels</h1>
		<table class="table table-striped table-bordered">
		    <thead>
		        <tr>
		            <th class="text-center">Expense</th>
		            <th class="text-center">Vendor</th>
		            <th class="text-center">Amount</th>
		            <th class="text-center">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
				<c:forEach var="expense" items="${expenses}">
					<tr class="align-middle text-center">
						<td><a href="/expenses/detail/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
						<td><c:out value="${expense.vendor}"></c:out></td>
						<td>$<c:out value="${expense.amount}"></c:out></td>
						<td><a href="/expenses/edit/${expense.id}">Edit</a> 
							<form action="/expenses/${expense.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn-danger">
							</form>
						</td>
					</tr>	
				</c:forEach>
		    </tbody>
		</table>
	</div>

	<div class="row pt-5">
		<h1>Add an expense</h1>
		<form:form action="/expenses" method="post" modelAttribute="expense">
			
			<div>
				 <form:label path="expenseName">Expense Name:</form:label><br />
		        <form:errors path="expenseName" class="error"/>
		        <form:input type="text" style="width:300px;" path="expenseName"/>
		    </div>
		    <div>
		        <form:label path="vendor">Vendor: </form:label><br />
				<form:errors path="vendor" class="error"/>
				<form:input type="text" style="width:300px;" path="vendor"/>
		    </div>
		    <div>
		        <form:label path="amount">Amount:</form:label><br />
		        <form:errors path="amount" class="error"/>     
		        <form:input type="number" style="width:300px;" step="0.01" path="amount"/>
		    </div>
		    <div>
		    	<form:label path="description">Description:</form:label><br />
		        <form:errors path="description" class="error"/>
		        <form:textarea stype="text" style="width:300px;" rows="3" path="description"/>
		    </div>
			
			<div>
				<input type="submit" value="Submit"/>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>