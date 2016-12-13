<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lowest Price Hotel</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

body {
	margin: 0;
	padding: 0;
	text-align: center;
}

.container {
	position: relative;
	left: 42%;
	width: 100%;
	display: inline-block;
	margin-top: 10%;
	text-align: left;
}
</style>
</head>
<body class="body">
	<h2>List of Hotel with Lowest Price</h2>
	<div class="container">
	<div>
		<table>
			<tr>
				<td>City</td>
				<c:if test="${!empty listCity}">
					<td><select name="city">
							<option value="0">---</option>
							<c:forEach items="${listCity}" var="city">
								<option value="${city.id}">${city.name}</option>
							</c:forEach>
					</select></td>
				</c:if>
				<c:if test="${empty listCity}">
					<td><select name="city">
							<option value="0">---</option>
					</select></td>
				</c:if>
			</tr>
		</table>
	</div>
	<div>
		<c:if test="${!empty listHotels}">
			<table class="tg">
				<tr>
					<th width="80">Person ID</th>
					<th width="120">Person Name</th>
					<th width="120">Person Country</th>
					<th width="60">Action</th>
				</tr>
				<c:forEach items="${listHotels}" var="hotel">
					<tr>
						<td>${hotel.id}</td>
						<td>${hotel.name}</td>
						<td>${hotel.country}</td>
						<td><a href="<c:url value='/book/${hotel.id}' />">Book</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>

	<div style="display: inline-block">
		<table>
			<tr>
				<td colspan="2"><a href="/HMS"><input type="button"
						value="Home" /></a></td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>