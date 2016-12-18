package com.hms.spring;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hms.spring.model.Booking;
import com.hms.spring.model.City;
import com.hms.spring.model.Hotel;
import com.hms.spring.service.RoomService;

@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	private RoomService roomService;
	
	@Autowired(required=true)
	@Qualifier(value="roomService")
	public void setRoomService(RoomService rs){
		this.roomService = rs;
	}
	
	@RequestMapping(value = "/roomBooking", method = RequestMethod.GET)
	public String newBooking(Model model) {
		Booking booking =new Booking();
		logger.info("newBooking call");
		model.addAttribute("listCity", this.listCity());
		model.addAttribute("listHotel", this.listHotel());
		model.addAttribute("booking", booking);
		return "newRoomBooking";
	}
	
	@RequestMapping(value = "/lowestPriceHotel", method = RequestMethod.GET)
	public String showLowestPriceHotel(Model model) {
		logger.info("showLowestPriceHotel call");
		model.addAttribute("listCity", this.listCity());
		return "lowestPriceHotel";
	}
	@RequestMapping(value = "/lowestPriceHotel/{cityId}", method = RequestMethod.GET)
	public String showLowestPriceHotelList(@PathVariable String cityId, Model model) {
		logger.info("showLowestPriceHotel call");
		model.addAttribute("listCity", this.listCity());
		model.addAttribute("listHotel", roomService.LowestPriceHotelList(cityId));
		model.addAttribute("SelectedCityId",cityId);
		return "lowestPriceHotel";
	}
	@RequestMapping(value = "/bookRoom", method = RequestMethod.POST)
	public String newRoomBooking(@ModelAttribute("booking") Booking b, Model model) {
		logger.info("newRoomBooking call");
		if(b.getId() == 0){
			logger.info("Before addBooking call");
			//new booking, add it
			b.setId(this.roomService.addBooking(b));
		}else{
			logger.info("Before updateBooking call");
			//existing booking, call update/cancel
			this.roomService.updateBooking(b);
		}
		model.addAttribute("bookingConfirmation", b);
		/*model.addAttribute("city", roomService.getCity(b));
		model.addAttribute("hotel", roomService.getHotel(b));*/
		return "bookingConfirmation";
	}
	
	public List<City> listCity() {
		logger.info("listCity call");
		return this.roomService.listCity();
	}
	public List<Hotel> listHotel() {
		logger.info("listhotel call");
		return this.roomService.listHotel();
	}
}
