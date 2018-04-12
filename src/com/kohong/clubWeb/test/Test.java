package com.kohong.clubWeb.test;

import java.time.LocalDate;

public class Test {
	public static void main(String[] args) {
		LocalDate now = LocalDate.now();
		String month;
		if(now.getMonthValue() < 10) {
			month = "0" + String.valueOf(now.getMonthValue());
		} else {
			month = String.valueOf(now.getMonthValue());
		}
		String day;
		if(now.getDayOfMonth() < 10) {
			day = "0" + String.valueOf(now.getDayOfMonth());
		} else {
			day = String.valueOf(now.getDayOfMonth());
		}
		String today = String.valueOf(now.getYear()) + month + day;
		System.out.println(today);
	}
}
