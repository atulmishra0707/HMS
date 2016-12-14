package com.hms.spring.dao;

import java.util.List;

import com.hms.spring.model.Booking;
import com.hms.spring.model.City;
import com.hms.spring.model.Hotel;

public interface RoomDao {

	public List<City> listCity();

	public List<Hotel> listHotel();

	public int addBooking(Booking b);

	public void updateBooking(Booking b);

	public City getCity(Booking b);

	public Hotel getHotel(Booking b);

}
