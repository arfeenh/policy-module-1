package com.policy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.policy.data.Policy;

/*
 * Created by Domenic Gareffa @ 3:02pm on August 15, 2018
 * 
 * This is a Data Access Object. It will communicate with the Database and return
 * data. More specifically this class will associate itself with the Policy Table.
 */

/**
 * NOTE: We have added a column to the existing Policy Table, 
 *  we have added sum_assured_min
 * 	and altered sum_assured to sum_assured_min
 * 
 * create table Policies (
	policy_id int primary key,
	policy_type varchar(255) not null, -- Accidential, whole life, term, pension
	policy_name varchar(255) not null,
	number_nominees int not null,
	tenure double precision not null,
	sum_assured_min double precision not null,
	sum_assured_max double precision not null,
	pre_reqs varchar(255) not null
);
 * 
 * 
 * @author 1559831
 *
 */

public class PolicyDao {

	private final String tableName = "Policies";
	private final String INSERT_INTO_POLICY = "insert into " + tableName + " values(?,?,?,?,?,?,?,?)";

	private final String SELECT_MAX_ID = "select MAX(policy_id) from " + tableName;
	private final String UPDATE_POLICY = "UPDATE Policies" +
			"SET policy_type = ?, "+
			"policy_name = ?, " + 
			"number_nominees = ?, " +
			"tenure = ?, " +
			"sum_assured_min = ?, " +
			"sum_assured_max = ?, " +
			"pre_reqs = ? " +
			"WHERE policy_id = ? ";
	
	/**
	 *  Will insert a policy object into the database.
	 * @param policy - an instantiated Policy object.
	 * @return true if policy is successfully added or false if not.
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public boolean insert(Policy policy) throws SQLException, ClassNotFoundException {
			Connection con = null;
			PreparedStatement ps = null;
			
			con = OracleConnection.INSTANCE.getConnection();
		
			ps = con.prepareStatement(INSERT_INTO_POLICY);
			
			ps.setInt(1, policy.getPolicyId());
			ps.setString(2, policy.getPolicyType());
			ps.setString(3, policy.getPolicyName());
			ps.setInt(4, policy.getNumberNominees());
			ps.setDouble(5, policy.getTenure());
			ps.setDouble(6, policy.getMinSum());
			ps.setDouble(7, policy.getMaxSum());
			ps.setString(8, policy.getPreReqs());

			int rowsAffected = ps.executeUpdate();
			
			//clean up
			ps.close();
			OracleConnection.INSTANCE.disconnect();
				
			if(rowsAffected >= 1) {
				System.out.println("Policy successfully added");
				return true;
			}else {
				System.out.println("Policy was not added");
				return false;
			}
	}
	
	/**
	 * 
	 * @return An integer holding the largest ID currently in the table.
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Integer getLargestID() throws SQLException, ClassNotFoundException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		ps = con.prepareStatement(SELECT_MAX_ID);
		rs = ps.executeQuery();
		
		rs.next();
		int maxID = rs.getInt(1);
		
		//clean up
		rs.close();
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		
		return maxID;
}
	
	public boolean update(Policy policy) throws SQLException, ClassNotFoundException {
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(UPDATE_POLICY);
		
		ps.setString(1, policy.getPolicyType());
		ps.setString(2, policy.getPolicyName());
		ps.setInt(3, policy.getNumberNominees());
		ps.setDouble(4, policy.getTenure());
		ps.setDouble(5, policy.getMinSum());
		ps.setDouble(6, policy.getMaxSum());
		ps.setString(7, policy.getPreReqs());
		ps.setInt(8, policy.getPolicyId());

		int rowsAffected = ps.executeUpdate();
		
		//clean up
		ps.close();
		con.close();
			
		if(rowsAffected >= 1) {
			System.out.println("Policy successfully updated");
			return true;
		}else {
			System.out.println("Policy was not updated.");
			return false;
		}
	}
	

	
	
}
