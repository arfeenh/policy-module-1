/*
 * This class is used to create admin objects.
 * Admins only have id and password for loggin in as admin
 * @author					Patrick
 * @version      			1
 * @Class name				Admin
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

public class Admin {
	private int adminId;
	private String password;

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int id) {
		this.adminId = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pwd) {
		this.password = pwd;
	}

}
