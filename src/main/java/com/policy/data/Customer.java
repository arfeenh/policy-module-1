/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.Date;

public class Customer {
	private int customer_id;
	private String firstname;
	private String middlename;
	private String lastname;
	private Date date_of_birth;
	private String gender;
	private String permanent_address;
	private String present_address;
	private String occupation;
	private double salary;
	private String marital_status;
	private int number_of_children;
	private String email;
	private String phone_primary;
	private String phone_secondary;
	private String SIN;
//	private String photo;
	private String password;

	public int getCustomerId() {
		return customer_id;
	}

	public void setCustomerId(int customer_id) {
		this.customer_id = customer_id;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPermanentAddress() {
		return permanent_address;
	}

	public void setPermanentAddress(String permanent_address) {
		this.permanent_address = permanent_address;
	}

	public String getPresentAddress() {
		return present_address;
	}

	public void setPresentAddress(String present_address) {
		this.present_address = present_address;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}

	public int getNumberOfChildren() {
		return number_of_children;
	}

	public void setNumberOfChildren(int number_of_children) {
		this.number_of_children = number_of_children;
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

	public void setPhonePrimary(String phone_primary) {
		this.phone_primary = phone_primary;
	}

	public String getPhoneSecondary() {
		return phone_secondary;
	}

	public void setPhoneSecondary(String phone_secondary) {
		this.phone_secondary = phone_secondary;
	}

	public String getSIN() {
		return SIN;
	}

	public void setSIN(String sIN) {
		SIN = sIN;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
