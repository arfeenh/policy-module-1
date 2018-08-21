/*
 * This class is used to create agent objects.
 * Agents help customers buy policies.
 * @author					Patrick
 * @version      			1
 * @Class name				Agent
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

import java.util.Date;

public class Agent {
	private int agentId;
	private String firstname;
	private String middlename;
	private String lastname;
	private Date dateOfBirth;
	private String address;
	private String email;
	private String phonePrimary;
	private String phoneSecondary;
	private double yrsExperience;
	private int cityId;
	private int referenceId;

	public int getAgentId() {
		return agentId;
	}

	public void setAgentId(int id) {
		this.agentId = id;
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

	public double getYearsOfExperience() {
		return yrsExperience;
	}

	public void setYearsOfExperience(double years) {
		this.yrsExperience = years;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int id) {
		this.cityId = id;
	}

	public int getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(int id) {
		this.referenceId = id;
	}
}
