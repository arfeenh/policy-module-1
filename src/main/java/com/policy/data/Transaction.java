/*
 * This class is used to create transaction objects.
 * Every time customers pay premiums, a transaction occures.
 * @author					Patrick
 * @version      			1
 * @Class name				Transaction
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

import java.util.Date;

public class Transaction {
	private int transactionId;
	private double amountPaid;
	private Date transactionDate;

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int id) {
		this.transactionId = id;
	}

	public double getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(double amount) {
		this.amountPaid = amount;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date date) {
		this.transactionDate = date;
	}
}
