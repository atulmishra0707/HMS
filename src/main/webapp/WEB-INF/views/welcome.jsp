<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System - Welcome</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<style>
body {
    margin: 0;
    padding: 0;
    text-align:center;
}

.container {
    position: relative;
    left:42%;
    width: 100%;
    display:inline-block;
    margin-top:20%;
}
</style>
</head>
<body class="body">
	<h2>
		<b>Welcome to Hotel Management System.</b>
	</h2>

	<div class="container">
		<table>
			<tr>
				<td></td>
				<td><a href="roomBooking">Book a Room</a></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="lowestPriceHotel">View Lowest Price Hotels</a></td>
			</tr>
		</table>
	</div>
</body>
</html>