package com.hms.spring.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hms.spring.model.Booking;
import com.hms.spring.model.City;
import com.hms.spring.model.Hotel;

public class RoomDaoImpl implements RoomDao {
	private static final Logger logger = LoggerFactory.getLogger(RoomDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<City> listCity() {
		Session session = this.sessionFactory.getCurrentSession();
		List<City> cityList = session.createQuery("from City").list();
		for(City city : cityList){
			logger.info("city List::"+city);
		}
		return cityList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> listHotel() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Hotel> hotelList = session.createQuery("from Hotel").list();
		for(Hotel hotel : hotelList){
			logger.info("Hotel List::"+hotel);
		}
		return hotelList;
	}

	@Override
	public int addBooking(Booking b) {
		try{
		Session session = this.sessionFactory.getCurrentSession();
		b.setModifyBy("HMS_System");
		b.setModifyOn(new Date());
		
		session.persist(b);
		logger.info("Person saved successfully, Person Details="+b);
		return b.getId();
		}
		catch(Exception ex){}
		return 0;
	}

	@Override
	public void updateBooking(Booking b) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public City getCity(Booking b) {
		Session session = this.sessionFactory.getCurrentSession();		
		City city = (City) session.load(City.class, new Integer(b.getId()));
		logger.info("City Record loaded successfully, "+city);
		return city;
	}

	@Override
	public Hotel getHotel(Booking b) {
		Session session = this.sessionFactory.getCurrentSession();		
		Hotel hotel = (Hotel) session.load(Hotel.class, new Integer(b.getId()));
		logger.info("Hotel Record loaded successfully, "+hotel);
		return hotel;
	}
}
