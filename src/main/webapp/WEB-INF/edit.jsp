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
	<title>Edit Expense</title>
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
	 <div class="row justify-content-between">
	 	<div class="col-4">
			<h1>Edit Expense</h1>
		</div>
		<div class="col-4">
			<a href="/expenses/">Go Back</a>
		</div>
	</div>
		<form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense">
		    <input type="hidden" name="_method" value="put">
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
		    	<input type="submit" value="Update">
		    </div>
		</form:form>
	</div>
</div>
</body>
</html>