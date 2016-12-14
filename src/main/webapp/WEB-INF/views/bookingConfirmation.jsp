<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System - Booking Confirmation</title>
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
    margin-top:5%;
}

.container {
    position: relative;
    left:42%;
    width: 100%;
    display:inline-block;
    margin-top:5%;
}
</style>
</head>
<body class="body">
	<h2>
		<b><font color="green">Congratulation....Your booking is successfully completed.</font>	</b>
	</h2>
	<%-- <div class="container">
		<table>
			<tr>
				<td width="120">City</td>
				<td width="120">Hotel</td>
				<td width="120">Hotel Address</td>
				<td width="120">HotelContact</td>
				<td width="120">Booking ID</td>
				<td width="120">Check-In</td>
				<td width="120">Check-Out</td>
				<td width="120">Room Count</td>
				<td width="120">Booked On</td>
			</tr>
			<tr>
				<td>${city.name}</td>
				<td>${hotel.hotelName}</td>
				<td>${hotel.hotelAddress}</td>
				<td>${hotel.hotelPhone}</td>
				<td>${bookingConfirmation.id}</td>
				<td>${bookingConfirmation.checkInDate}</td>
				<td>${bookingConfirmation.checkOutDate}</td>
				<td>${bookingConfirmation.roomCount}</td>
				<td>${bookingConfirmation.modifyOn}</td>
				
			</tr>
		</table>
	</div> --%>
	<div class="container">
		<table>
			<tr>
				<td></td>
				<td width="120"><a href="/HMS"><input type="button"
							value="Home" /></a></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>