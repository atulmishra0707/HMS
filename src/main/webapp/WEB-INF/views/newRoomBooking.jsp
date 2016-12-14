<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System - Booking</title>
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
	margin-top: 5%;
	text-align: left;	
}

.hide {
	display: none;
}
.error{
	color:red
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
											$("#hcheckindate").val(this.value);
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
											$("#hcheckoutdate").val(this.value);
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
						
						$("form").submit(function(e){
							var flg;
							$('#error').empty();
							if(this.city.value <= 0){
								$('#error').append("Please select City"); flg=true;
							}else if(this.hotel.value <= 0){
								$('#error').append("Please select Hotel");flg=true;
							}else if(this.roomCount.value <= 0 ){
								$('#error').append("Please enter room count 1 or more");flg=true;
							}else if(this.hcheckindate.value == ''){
								$('#error').append("Please select Check-In-Date");flg=true;
							}else if(this.hcheckoutdate.value == ''){
								$('#error').append("Please select Check-Out-Date");flg=true;
							}else{
								$('#error').addClass("hide");flg=false;
							}
							
							if(flg){
								$('#error').removeClass("hide");
								e.preventDefault();
								return false;
							}else if(this.city.value > 0 && this.hotel.value > 0 & this.roomCount.value > 0 && this.hcheckindate.value != '' && this.hcheckoutdate.value != '')
					        {
								$('#error').empty();
								$('#error').addClass("hide");
								return true;
					        }
					    });

					});
</script>
</head>
<body class="body">
	<h2>New Booking for Hotel Room</h2>
	<form:form name="booking" id="booking" method="POST" action="bookRoom" commandName="booking">
	<div id="error" class="error hide"></div>
	<div class="container">
		<table>
			<tr>
				<td>City</td>
				<c:if test="${!empty listCity}">
					<td><form:select path="cityId" id="city" name="city">
							<option value="0">---</option>
							<c:forEach items="${listCity}" var="city">
								<option value="${city.id}">${city.name}</option>
							</c:forEach>
					</form:select></td>
				</c:if>
				<c:if test="${empty listCity}">
					<td><form:select path="cityId" name="city">
							<option value="0">---</option>
					</form:select></td>
				</c:if>
			</tr>
			<tr>
				<td>Hotel</td>
				<td><form:select path="hotelId" id="hotel" name="hotel">
						<option value="0">---</option>
				</form:select></td>
			</tr>
			<tr>
				<td>Check-In-Date</td>
				<td><input type="date" id="checkindate" name="checkindate"/>
				<form:input type="hidden" id="hcheckindate" path="checkInDate"/></td>
				<%-- <form:input path="checkindate" type="hidden" id="checkindate" name="checkindate"/> --%>
			</tr>
			<tr>
				<td>Check-Out-Date</td>
				<td><input type="date" id="checkoutdate" name="checkoutdate"/>
				<form:input type="hidden" id="hcheckoutdate" path="checkOutDate"/></td>
				<%-- <form:input path="checkoutdate" type="date" id="checkoutdate" name="checkoutdate"/> --%>
			</tr>
			<tr>
				<td>Number of Rooms</td>
				<td><form:input path="roomCount" type="number" id="roomCount" name="roomCount"
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