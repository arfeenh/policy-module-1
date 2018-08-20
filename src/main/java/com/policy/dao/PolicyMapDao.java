
package com.policy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.policy.data.Policy;

/*
 * This Class contains Select Queries for the following:
 * 		1. All Customer IDs based on Agent ID
 * 		2. All Policy IDs based on Agent ID and Customer ID
 * 		3. Information of Particular Policy based on Policy ID
 *   @author: Jian An Chiang 
 *   @version: 1.0
 *   @name: PolicyMapDao
 *   @Creation Date: August 15 2018 8:00PM 
 *   @History: Created Query Methods for 1 and 2  
 *   @Reviewed by:
 */
public class PolicyMapDao {
	private
	ArrayList<String> custid_list = new ArrayList<String>();	//Customer ID Array
	ArrayList<String> policyid_list = new ArrayList<String>();  //Policy ID Array
	String agentid;
	String custid;
	String policyid;
	
	
	public PolicyMapDao(){}
	/*This constructor gets called in ViewPolicyByAgent and auto stores the ids whenever the jsp gets refreshed
	 * @param	
	 * 		agentid: The Agent ID inputed from ViewPolicyByAgent
	 * 		custid: The Customer ID inputed from ViewPolicyByAgent
	 * 		policyid: The Policy ID inputed from ViewPolicyByAgent
	 */
	public PolicyMapDao(String agentid, String custid, String policyid){
		this.agentid = agentid;
		this.custid = custid;
		this.policyid = policyid;
	}
	
	/*The getCustomers method takes in the agent id from ViewPolicyByAgent.jsp and queries all customer ids
	 * associated with the agent id.
	 * @param
	 * 		agentid: The Agent ID inputed from ViewPolicyByAgent
	 * @return
	 * 		custid_list: An ArrayList containing the customer ids are returned to ViewPolicyByAgent.jsp for
	 * 					 dynamic population
	 */
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
	
	/*The getPolicies method takes in the agent id and customer id from ViewPolicyByAgent.jsp and 
	 * queries all customer ids associated with the agent id and customer id.
	 * @param
	 * 		agentid: The Agent ID inputed from ViewPolicyByAgent
	 * 		custid: The Customer ID inputed from ViewPolicyByAgent
	 * @return
	 * 		custid_list: An ArrayList containing the policy ids are returned to ViewPolicyByAgent.jsp for
	 * 					 dynamic population
	 */
	public ArrayList<String> getPolicies(String agentid, String custid) throws SQLException, ClassNotFoundException{
		policyid_list.clear();
		
		String SELECT_POLICIES_FROM_CUSTOMER = "select policy_ID from PolicyMap where "
				+ "customer_ID = "+custid+ " AND agent_ID = "+agentid;

		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_POLICIES_FROM_CUSTOMER);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			int policyid = rs.getInt("policy_ID");
			policyid_list.add(Integer.toString(policyid));
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return policyid_list;
	}
	
	/*The getPolicyInfo method takes in the agent id and customer id from ViewPolicyByAgent.jsp and 
	 * queries all customer ids associated with the agent id and customer id.
	 * @param
	 * 		agentid: The Agent ID inputed from ViewPolicyByAgent
	 * 		custid: The Customer ID inputed from ViewPolicyByAgent
	 * @return
	 * 		custid_list: An ArrayList containing the policy ids are returned to ViewPolicyByAgent.jsp for
	 * 					 dynamic population
	 */
	public Policy getPolicyInfo() throws ClassNotFoundException, SQLException { //QUERY POLICY DATA
		
		String SELECT_INFO_FOR_POLICY = "select Policies.policy_id, policy_name, tenure, sum_assured_min, sum_assured_max, "
				+ "payments_per_year, premium_amount, start_date from Policies join PolicyMap on PolicyMap.policy_ID "
				+ "= Policies.policy_id where Policies.policy_id="+this.policyid;
	
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		ps = con.prepareStatement(SELECT_INFO_FOR_POLICY);
		ResultSet rs = ps.executeQuery();
		Policy info = new Policy();
		while (rs.next()) {
			int policyid = rs.getInt("policy_ID");
			String policy_name = rs.getString("policy_name");
			double tenure = rs.getDouble("tenure");
			double sum_assured_min = rs.getDouble("sum_assured_min");
			double sum_assured_max = rs.getDouble("sum_assured_max");
			int payments_per_year = rs.getInt("payments_per_year");
			double premium_amount = rs.getDouble("premium_amount");
			info.setPolicyId(policyid);
			info.setPolicyName(policy_name);
			info.setTenure(tenure);
			info.setMinSum(sum_assured_min);
			info.setMaxSum(sum_assured_max);
			info.setPaymentsPerYear(payments_per_year);
			info.setPremiumAmount(premium_amount);
		}
		
		
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		
		return info;
	}
	public String getAgentID(){
		return this.agentid;
	}
	public String getCustID() {
		return this.custid;
	}
	public String getPolicyID() {
		return this.policyid;
	}

}
