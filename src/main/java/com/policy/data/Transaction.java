/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.Date;

public class Transaction {
	private int transaction_id;
	private double amount_paid;
	private Date transaction_date;

	public int getTransactionId() {
		return transaction_id;
	}

	public void setTransactionId(int id) {
		this.transaction_id = id;
	}

	public double getAmountPaid() {
		return amount_paid;
	}

	public void setAmountPaid(double amount) {
		this.amount_paid = amount;
	}

	public Date getTransactionDate() {
		return transaction_date;
	}

	public void setTransactionDate(Date date) {
		this.transaction_date = date;
	}
}
