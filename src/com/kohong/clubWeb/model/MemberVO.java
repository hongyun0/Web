package com.kohong.clubWeb.model;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String gender;
	private String birthDate;
	private String phoneNumber;
	private String email;
	private String city;
	
	public MemberVO(String id, String pw, String name, String nickname, String gender, 
			String birthDate, String phoneNumber, String email, String city) {
		setId(id);
		setPw(pw);
		setName(name);
		setNickname(nickname);
		setGender(gender);
		setBirthDate(birthDate);
		setPhoneNumber(phoneNumber);
		setEmail(email);
		setCity(city);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	
}
