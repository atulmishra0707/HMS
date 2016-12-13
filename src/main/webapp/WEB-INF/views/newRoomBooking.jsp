<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Booking for Hotel Room</title>
<style>
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

.hide {
	display: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#checkindate")
								.change(
										function() {
											var currentDate = new Date();

											var selected = new Date(this.value);
											if (selected <= currentDate) {
												this.value = "";
												alert("Check-in date cannot be less or equal to current date");
											}

										});
						$("#checkoutdate")
								.change(
										function() {
											var selected = this.value;
											var checkindate = $("#checkindate")
													.val();
											if (selected <= checkindate) {
												this.value = "";
												alert("Check-out date cannot be less or equal to Check-in date");
											}

										});
						$("#city")
								.change(
										function() {
											var selected = this.value;
											var hotelList = document
													.getElementById('hotelList'), i;
											$('#hotel').empty();
											$('#hotel')
													.append(
															'<option value="0">---</option>');
											for (i = 0; i < hotelList.length; i++) {
												if (hotelList[i]
														.getAttribute("cityid") == selected)
													$('#hotel')
															.append(
																	'<option value="' + hotelList[i].value + '">'
																			+ hotelList[i].text
																			+ '</option>');
											}
										});
						$("#cancel").click(function() {

						});

					});
</script>
</head>
<body class="body">
	<h2>New Booking for Hotel Room</h2>
	<form:form name="booking" id="booking" method="POST" action="bookRoom" commandName="booking">
	<div class="container">
		<table>
			<tr>
				<td>City</td>
				<c:if test="${!empty listCity}">
					<td><select id="city" name="city">
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
			<tr>
				<td>Hotel</td>
				<td><select id="hotel" name="hotel">
						<option value="0">---</option>
				</select></td>
			</tr>
			<tr>
				<td>Check-In-Date</td>
				<td><input type="date" id="checkindate" name="checkindate"></td>
			</tr>
			<tr>
				<td>Check-Out-Date</td>
				<td><input type="date" id="checkoutdate" name="checkoutdate"></td>
			</tr>
			<tr>
				<td>Number of Rooms</td>
				<td><input type="number" id="totalrooms" name="totalrooms"
					min="0" max="10" step="1" value="1" /></td>
			</tr>
			<tr>
				<td><input id="submit" type="submit" value="Submit" /><input id="id" type="hidden" value="0" /></td>
				<td><a href="/HMS"><input id="cancel" type="button"
						value="Cancel" /></a></td>

			</tr>
		</table>
		</div>
	</form:form>
	<div id="hotel" style="display: none">
		<table>
			<c:if test="${!empty listHotel}">
				<tr>
					<td><select id="hotelList">
							<c:forEach items="${listHotel}" var="hotel">
								<option cityId="${hotel.cityId}" value="${hotel.hotelId}">${hotel.hotelName}</option>
							</c:forEach>
					</select></td>
			</c:if>
			<c:if test="${empty listHotel}">
				<tr>
					<td><select id="hotelList">
							<option value="0">---</option>
					</select></td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>