package com.hms.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.hms.spring.dao.PersonDAO;
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
		// TODO Auto-generated method stub
		return this.roomDao.listCity();
	}
	
	@Override
	@Transactional
	public List<Hotel> listHotel() {
		// TODO Auto-generated method stub
		return this.roomDao.listHotel();
	}

	@Override
	@Transactional
	public List<Hotel> listHotel(City city) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int roomTotalAvailability() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int addBooking(Booking b) {
		return this.roomDao.addBooking(b);
	}

	@Override
	@Transactional
	public void updateBooking(Booking b) {
		// TODO Auto-generated method stub
		this.roomDao.updateBooking(b);
		
	}
}
