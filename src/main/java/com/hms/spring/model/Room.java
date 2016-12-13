package com.hms.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ROOM")
public class Room {
	
	@Id
	@Column(name="roomId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int roomId;
	private int hotelId;
	private String roomType;
	private String roomTariff;
	private String roomSts;
	@Column(name="mdfyBy")
	private String modifyBy;
	@Column(name="mdfyOn")
	private Date modifyOn;
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomTariff() {
		return roomTariff;
	}
	public void setRoomTariff(String roomTariff) {
		this.roomTariff = roomTariff;
	}
	public String getRoomSts() {
		return roomSts;
	}
	public void setRoomSts(String roomSts) {
		this.roomSts = roomSts;
	}
	public String getModifyBy() {
		return modifyBy;
	}
	public void setModifyBy(String modifyBy) {
		this.modifyBy = modifyBy;
	}
	public Date getModifyOn() {
		return modifyOn;
	}
	public void setModifyOn(Date modifyOn) {
		this.modifyOn = modifyOn;
	}
	
	
}
