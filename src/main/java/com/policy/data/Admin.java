/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

public class Admin {
	private int admin_id;
	private String password;

	public int getAdminId() {
		return admin_id;
	}

	public void setAdminId(int id) {
		this.admin_id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pwd) {
		this.password = pwd;
	}

}
