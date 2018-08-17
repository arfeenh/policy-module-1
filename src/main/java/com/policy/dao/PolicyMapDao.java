package com.policy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.policy.data.Policy;

public class PolicyMapDao {
	private
	ArrayList<String> custid_list = new ArrayList<String>();
	ArrayList<String> policyid_list = new ArrayList<String>();
	Policy info;
	String agentid;
	String custid;
	String policyid;
	
	
	public PolicyMapDao(){}
	public PolicyMapDao(String agentid, String custid, String policyid){
		this.agentid = agentid;
		this.custid = custid;
		this.policyid = policyid;
	}
	
	//SELECT ALL CUSTOMER ID BASED ON AGENT ID. PolicyMap Table is used.
	public ArrayList<String> getCustomers(String agentid) throws SQLException, ClassNotFoundException{
		custid_list.clear();
		String SELECT_CUSTOMER_FROM_AGENT = "select customer_ID from PolicyMap where "
				+ "agent_ID = "+agentid;
		
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_CUSTOMER_FROM_AGENT);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			int custid = rs.getInt("customer_ID");
			custid_list.add(Integer.toString(custid));
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return custid_list;
	}
	
	public ArrayList<String> getPolicies(String agentid, String custid) throws SQLException, ClassNotFoundException{
		policyid_list.clear();
		
		String SELECT_POLICIES_FROM_CUSTOMER = "select policy_ID from PolicyMap where "
				+ "customer_ID = "+custid+ " AND agent_ID = "+agentid;

		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_POLICIES_FROM_CUSTOMER);
		ResultSet rs = ps.executeQuery();
		System.out.println(SELECT_POLICIES_FROM_CUSTOMER);
		while (rs.next()) {
			int policyid = rs.getInt("policy_ID");
			policyid_list.add(Integer.toString(policyid));
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return policyid_list;
	}
	
	public Policy getPolicyInfo() { //QUERY POLICY DATA
		
		
		return info;
	}
	String getAgentID(){
		return this.agentid;
	}
	String getCustID() {
		return this.custid;
	}
	String getPolicyID() {
		return policyid;
	}

}
