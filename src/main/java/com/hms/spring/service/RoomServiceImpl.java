package com.hms.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.hms.spring.dao.RoomDao;
import com.hms.spring.model.Booking;
import com.hms.spring.model.City;
import com.hms.spring.model.Hotel;

public class RoomServiceImpl implements RoomService {
	private static final Logger logger = LoggerFactory.getLogger(RoomServiceImpl.class);
	
	private RoomDao roomDao;
	
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	
	@Override
	@Transactional
	public List<City> listCity() {
		return this.roomDao.listCity();
	}
	
	@Override
	@Transactional
	public List<Hotel> listHotel() {
		return this.roomDao.listHotel();
	}

	@Override
	@Transactional
	public List<Hotel> listHotel(City city) {
		return null;
	}

	@Override
	@Transactional
	public int roomTotalAvailability() {
		return 0;
	}

	@Override
	@Transactional
	public int addBooking(Booking b) {
		logger.info("addBooking Call");
		return this.roomDao.addBooking(b);
	}

	@Override
	@Transactional
	public void updateBooking(Booking b) {
		this.roomDao.updateBooking(b);
		
	}

	@Override
	public City getCity(Booking b) {
		return this.roomDao.getCity(b);
	}

	@Override
	public Hotel getHotel(Booking b) {
		return this.roomDao.getHotel(b);
	}

	@Override
	public List<Hotel> LowestPriceHotelList(String cityId) {
		return this.roomDao.getLowestPriceHotelList(cityId);
	}
}
