package com.kohong.clubWeb.model;

public class ClubVO {
private	String clubName , phoneNumber, email, category, limit, captainId, createrId;

public ClubVO(String clubName, String phoneNumber, String email, String category, String limit, String captainId,
		String createrId) {
	this.clubName = clubName;
	this.phoneNumber = phoneNumber;
	this.email = email;
	this.category = category;
	this.limit = limit;
	this.captainId = captainId;
	this.createrId = createrId;
}

public String getClubName() {
	return clubName;
}

public void setClubName(String clubName) {
	this.clubName = clubName;
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

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
}

public String getLimit() {
	return limit;
}

public void setLimit(String limit) {
	this.limit = limit;
}

public String getCaptainId() {
	return captainId;
}

public void setCaptainId(String captainId) {
	this.captainId = captainId;
}

public String getCreaterId() {
	return createrId;
}

public void setCreaterId(String createrId) {
	this.createrId = createrId;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((clubName == null) ? 0 : clubName.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	ClubVO other = (ClubVO) obj;
	if (clubName == null) {
		if (other.clubName != null)
			return false;
	} else if (!clubName.equals(other.clubName))
		return false;
	return true;
}

@Override
public String toString() {
	return clubName + " " + phoneNumber + " " + email + " " + category + " " + limit + " " + captainId + " " + createrId;
}




}

