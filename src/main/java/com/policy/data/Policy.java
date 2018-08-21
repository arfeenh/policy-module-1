/*
 * This class is used to create policy objects.
 * Policies are bounded to nominees and customers.
 * @author					Patrick
 * @version      			1
 * @Class name				Policy
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Policy {
	private int policy_id;
	private String policyType; //Updated by Domenic Garreffa on Aug 15, 2018
	private String policyName;
	private int numberNominees;
	private double tenure;
	private double minSum;
	private double maxSum;
	private String preReqs;
	private int paymentsPerYear; // Added by Patrick Yu on Aug 16, 2018
	private double premiumAmount; // Added by Patrick Yu on Aug 16, 2018
	private Date startDate; // Added by Patrick Yu on Aug 16, 2018
	private int agentId; // Added by Patrick Yu on Aug 16, 2018
	private List<Nominee> nominees = new ArrayList<Nominee>(); // Added by Patrick Yu on Aug 16, 2018

	public int getPolicyId() {
		return policy_id;
	}
	
	public void setPolicyId(int id) {
		this.policy_id = id;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public double getPremiumAmount() {
		return premiumAmount;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public void setPremiumAmount(double amount) {
		this.premiumAmount = amount;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public int getAgentId() {
		return agentId;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public void setAgentId(int id) {
		this.agentId = id;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public int getPaymentsPerYear() {
		return paymentsPerYear;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public void setPaymentsPerYear(int numOfPayments) {
		this.paymentsPerYear = numOfPayments;
	}

	//Added by Domenic Garreffa on Aug 15, 2018
	public String getPolicyType() {
		return policyType;
	}

	//Added by Domenic Garreffa on Aug 15, 2018
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}

	public String getPolicyName() {
		return policyName;
	}

	public void setPolicyName(String name) {
		this.policyName = name;
	}

	public int getNumberNominees() {
		return numberNominees;
	}

	public void setNumberNominees(int numberOfNominees) {
		this.numberNominees = numberOfNominees;
	}

	public double getTenure() {
		return tenure;
	}

	public void setTenure(double tenure) {
		this.tenure = tenure;
	}

	public String getPreReqs() {
		return preReqs;
	}

	public void setPreReqs(String preReqs) {
		this.preReqs = preReqs;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public Date getStartDate() {
		return startDate;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public List<Nominee> getNominees() {
		return nominees;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public void setNominees(List<Nominee> myNominees) {
		for(Nominee n : myNominees) {
			this.nominees.add(n);
		}
	}

	public double getMinSum() {
		return minSum;
	}

	public void setMinSum(double minSum) {
		this.minSum = minSum;
	}

	public double getMaxSum() {
		return maxSum;
	}

	public void setMaxSum(double maxSum) {
		this.maxSum = maxSum;
	}
	
	public void addNomineeToList(Nominee obj) {
		nominees.add(obj);
	}
}
