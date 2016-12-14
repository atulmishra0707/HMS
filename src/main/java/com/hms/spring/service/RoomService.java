package com.hms.spring.service;

import java.util.List;

import com.hms.spring.model.Booking;
import com.hms.spring.model.City;
import com.hms.spring.model.Hotel;

public interface RoomService {

	public List<City> listCity();
	public List<Hotel> listHotel(City city);
	public int roomTotalAvailability();
	public List<Hotel> listHotel();
	public int addBooking(Booking b);
	public void updateBooking(Booking b);
	public City getCity(Booking b);
	public Hotel getHotel(Booking b);

}
