/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Policy {
	private int policy_id;
	private String policyType; //Updated by Domenic Garreffa on Aug 15, 2018
	private String policy_name;
	private int number_nominees;
	private double tenure;
	private double min_sum;
	private double max_sum;
	private String pre_reqs;
	private int payments_per_year; // Added by Patrick Yu on Aug 16, 2018
	private double premiumAmount; // Added by Patrick Yu on Aug 16, 2018
	private Date start_date; // Added by Patrick Yu on Aug 16, 2018
	private int agent_id; // Added by Patrick Yu on Aug 16, 2018
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
	public void setPremiumAmonut(double amount) {
		this.premiumAmount = amount;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public int getAgentId() {
		return agent_id;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public void setAgentId(int id) {
		this.agent_id = id;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public int getPaymentsPerYear() {
		return payments_per_year;
	}
	
	// Added by Patrick Yu on Aug 16, 2018
	public void setPaymentsPerYear(int numOfPayments) {
		this.payments_per_year = numOfPayments;
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
		return policy_name;
	}

	public void setPolicyName(String name) {
		this.policy_name = name;
	}

	public int getNumberNominees() {
		return number_nominees;
	}

	public void setNumberNominees(int numberOfNominees) {
		this.number_nominees = numberOfNominees;
	}

	public double getTenure() {
		return tenure;
	}

	public void setTenure(double tenure) {
		this.tenure = tenure;
	}

	public String getPreReqs() {
		return pre_reqs;
	}

	public void setPreReqs(String preReqs) {
		this.pre_reqs = preReqs;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public Date getStartDate() {
		return start_date;
	}

	// Added by Patrick Yu on Aug 16, 2018
	public void setStartDate(Date start_date) {
		this.start_date = start_date;
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
		return min_sum;
	}

	public void setMinSum(double min_sum) {
		this.min_sum = min_sum;
	}

	public double getMaxSum() {
		return max_sum;
	}

	public void setMaxSum(double max_sum) {
		this.max_sum = max_sum;
	}
}
