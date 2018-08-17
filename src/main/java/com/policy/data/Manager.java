/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.Date;

public class Manager {
	private int manager_id;
	private String fullname;
	private Date date_of_birth;
	private int province_id;
	private int city_id;
	private int designation_id;
	private String email;
	private String password;

	public int getManagerId() {
		return manager_id;
	}

	public void setManagerId(int manager_id) {
		this.manager_id = manager_id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getDateOfBirth() {
		return date_of_birth;
	}

	public void setDateOfBirth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public int getProvinceId() {
		return province_id;
	}

	public void setProvinceId(int province_id) {
		this.province_id = province_id;
	}

	public int getCityId() {
		return city_id;
	}

	public void setCityId(int city_id) {
		this.city_id = city_id;
	}

	public int getDesignationId() {
		return designation_id;
	}

	public void setDesignationId(int designation_id) {
		this.designation_id = designation_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
