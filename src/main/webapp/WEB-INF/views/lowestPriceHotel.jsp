<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System - Lowest Price Hotel</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#go").click(function() {
			var cityId= $("#city").val();
			if(cityId && cityId!="0"){
				window.location='/HMS/lowestPriceHotel/'+cityId;
				return true;
			}else{
				e.preventDefault();
				return false;
			}
			
			/* alert(cityId);
			$.ajax({
		        url: "lowestPriceHotel/"+cityId,
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        type: "get",
		        //data: '{cityId:cityId}',
		        success: function (response) {
		        	alert(response);
		        	document.getElementById("hoteldata").innerHTML = response.document.getElementById("hoteldata").innerHTML;
		    }
		}); */
		});
	});
</script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
	table-layout:fixed;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 10px;
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
	overflow: hidden;
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
	margin-top: 5%;
	text-align: left;
}
.table {
	position: relative;
	left: 10%;
	width: 100%;
	display: inline-block;
	text-align: left;
}
.div{
    padding: 0.4em;
    text-align: center;
    overflow: auto;
  }
</style>
</head>
<body class="body">
	<h2>List of Hotel with Lowest Price</h2>
	<div>
		<div class="container div">
		<form name="lowestPriceHotel" id="lowestPriceHotel" method="GET" action="lowestPriceHotel">
			<table>
				<tr>
					<td>City</td>
					<c:if test="${!empty listCity}">
						<td><select id="city" name="city">
								<option value="0">---</option>
								<c:forEach items="${listCity}" var="city">
								    <c:if test ="${SelectedCityId.toString() == city.cityId.toString()}">
									<option value="${city.cityId}" selected >${city.name}</option>
									</c:if>
									<c:if test ="${SelectedCityId.toString() != city.cityId.toString()}">
									<option value="${city.cityId}">${city.name}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</c:if>
					<c:if test="${empty listCity}">
						<td><select id="city" name="city">
								<option value="0">---</option>
						</select></td>
					</c:if>
					<td><input type="button" value="Go" id="go"/></td>
				</tr>
			</table>
			</form>
		</div>
		<div class=" table div">
			<table class="tg">
				<tr>
				
					<th width="60">Action</th>
					<th width="80">City</th>
					<th width="80">Hotel</th>
					<th width="100">Price(per Day)</th>
					<th width="140">Address</th>
					<th width="90">Phone</th>
					<th width="200">Email</th>
				</tr>
			</table>
			<c:if test="${!empty listHotel}">
				<table id="hoteldata" class="tg">
					<c:forEach items="${listHotel}" var="hotel">
						<tr>
							<td width="60"><a href="#">Book</a></td><%--  <c:url value='/book/${hotel.hotelId}'/> --%>
							<td width="80"><input type="hidden" value="${hotel.cityId}"/>${hotel.cityName}</td>
							<td width="80">${hotel.hotelName}</td>
							<td width="100">${hotel.hotelTariff}</td>
							<td width="140">${hotel.hotelAddress}</td>
							<td width="90">${hotel.hotelPhone}</td>
							<td width="200">${hotel.hotelEmail}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>

		<div class="container div" style="display: inline-block">
			<table>
				<tr>
					<td width="120"><a href="/HMS"><input type="button"
							value="Cancel" /></a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>