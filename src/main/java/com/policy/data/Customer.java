/*
 * This class is used to create Customer objects.
 * Customers can log in and view own policies.
 * @author					Patrick
 * @version      			1
 * @Class name				Customer
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

import java.util.Date;

public class Customer {
	private int customerId;
	private String firstname;
	private String middlename;
	private String lastname;
	private Date dateOfBirth;
	private String gender;
	private String permanentAddress;
	private String presentAddress;
	private String occupation;
	private double salary;
	private String maritalStatus;
	private int numOfChildren;
	private String email;
	private String phonePrimary;
	private String phoneSecondary;
	private String SIN;
	private String password;

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
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
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public String getPresentAddress() {
		return presentAddress;
	}

	public void setPresentAddress(String presentAddress) {
		this.presentAddress = presentAddress;
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

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public int getNumberOfChildren() {
		return numOfChildren;
	}

	public void setNumberOfChildren(int num) {
		this.numOfChildren = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonePrimary() {
		return phonePrimary;
	}

	public void setPhonePrimary(String phone) {
		this.phonePrimary = phone;
	}

	public String getPhoneSecondary() {
		return phoneSecondary;
	}

	public void setPhoneSecondary(String phone) {
		this.phoneSecondary = phone;
	}

	public String getSIN() {
		return SIN;
	}

	public void setSIN(String sin) {
		SIN = sin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
