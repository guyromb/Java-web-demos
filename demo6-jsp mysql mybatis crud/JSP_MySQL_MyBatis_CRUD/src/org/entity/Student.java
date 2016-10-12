package org.entity;

public class Student {
	private int id;

	private String name;
	
	private String phone;
	
	public void setId(int value) {
		this.id = value;
	}
	public int getId() {
		return this.id;
	}

	public void setName(String value) {
		this.name = value;
	}
	public String getName() {
		return this.name;
	}
	
	public void setPhone(String value) {
		this.phone = value;
	}
	public String getPhone() {
		return this.phone;
	}

}