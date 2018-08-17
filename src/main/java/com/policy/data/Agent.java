/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.Date;

public class Agent {
	private int agent_id;
	private String firstname;
	private String middlename;
	private String lastname;
	private Date date_of_birth;
	private String address;
	private String email;
	private String phone_primary;
	private String phone_secondary;
	private double years_of_experience;
	private int city_id;
	private int reference_id;

	public int getAgentId() {
		return agent_id;
	}

	public void setAgentId(int id) {
		this.agent_id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Date getDateOfBirth() {
		return date_of_birth;
	}

	public void setDateOfBirth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonePrimary() {
		return phone_primary;
	}

	public void setPhonePrimary(String phone) {
		this.phone_primary = phone;
	}

	public String getPhoneSecondary() {
		return phone_secondary;
	}

	public void setPhoneSecondary(String phone) {
		this.phone_secondary = phone;
	}

	public double getYearsOfExperience() {
		return years_of_experience;
	}

	public void setYearsOfExperience(double years) {
		this.years_of_experience = years;
	}

	public int getCityId() {
		return city_id;
	}

	public void setCityId(int id) {
		this.city_id = id;
	}

	public int getReferenceId() {
		return reference_id;
	}

	public void setReferenceId(int id) {
		this.reference_id = id;
	}
}
