package com.policy.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * A DAO class for Nominee objects. Contains methods to access Nominee information
 * 
 * Created by Nicholas Kauldhar on Aug 17 around 3pm
 */

import com.policy.data.Nominee;
import com.policy.data.Policy;

public class NomineeDao {
	
	/**
	 * A method to return a list of Nominee objects given a PolicyMap ID. It returns 
	 * information about every nominee associated with a particular map.
	 * @param id
	 * @return List of Nominees associated with given map ID
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<Nominee> getNomineesFromMapID(int id) throws ClassNotFoundException, SQLException {
		
		Connection con = OracleConnection.INSTANCE.getConnection();
		String query = "SELECT COUNT(*) FROM NOMINEEMAP WHERE POLICY_MAP_ID = " + id;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		int nomineeAmount = rs.getInt(1);
		int[] ids = new int[nomineeAmount];
		query = "SELECT * FROM NOMINEEMAP WHERE POLICY_MAP_ID = " + id;
		rs.close();
		rs = st.executeQuery(query);
		int index = 0;
		while (rs.next()) {
			ids[index] = rs.getInt(3);
			index++;
		}
		
		rs.close();
		
		query = "SELECT * FROM NOMINEES WHERE NOMINEE_ID = ?";
		
		PreparedStatement pst = con.prepareStatement(query);
		
		List<Nominee> noms = new ArrayList<Nominee>();
		Nominee temp;
		
		for (int x = 0; x < nomineeAmount; x++) {
			pst.setInt(1, ids[x]);
			rs = pst.executeQuery();
			rs.next();
			temp = new Nominee();
			temp.setNomineeId(rs.getInt(1));
			temp.setNomineeName(rs.getString(2));
			temp.setRelationshipToCustomer(rs.getString(3));
			temp.setPurposeOfChanged(rs.getString(4));
			noms.add(temp);
			rs.close();
		}
		
		pst.close();
		st.close();
		OracleConnection.INSTANCE.disconnect();
		
		return noms;
	}
	
	/**
	 * A method to return the number of nominees required given a Policy ID. 
	 * @param id
	 * @return List of Nominees associated with given map ID
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @author Jian An
	 */
	public static int getNumOfNominees(int id) throws ClassNotFoundException, SQLException {
		
		String SELECT_NUM_OF_NOMINEES_FROM_POLICY_ID = "select number_nominees from Policies where "
				+ " policy_id = "+id;
		
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_NUM_OF_NOMINEES_FROM_POLICY_ID);
		ResultSet rs = ps.executeQuery();
		int num = 0;
		while (rs.next()) {
			num = rs.getInt("number_nominees");
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return num;
	}
	public static boolean insertNominee(String nominee_name, String relationship, String purpose, int max_nominee_id) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		String INSERT_INTO_NOMINEE = "insert into Nominees values(?,?,?,?)";
		ps = con.prepareStatement(INSERT_INTO_NOMINEE);
		int nominee_id = max_nominee_id+1;
		ps.setInt(1, nominee_id);
		ps.setString(2, nominee_name);
		ps.setString(3, relationship);
		ps.setString(4, purpose);

		int rowsAffected = ps.executeUpdate();
		
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
	
		if(rowsAffected >= 1) {
			
			System.out.println("Nominee successfully added");
			return true;
		}else {
			System.out.println("Nominee was not added");
			return false;
		}
	}
	public static boolean insertNomineeMap(int max_nominee_map_id, int policy_map_id, int max_nominee_id) throws ClassNotFoundException, SQLException {
		String INSERT_INTO_NOMINEE_MAP = "insert into NomineeMap values(?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		
		ps = con.prepareStatement(INSERT_INTO_NOMINEE_MAP);
		int nominee_map_id = max_nominee_map_id+1;
		int nominee_id = max_nominee_id+1;
		ps.setInt(1, nominee_map_id);
		ps.setInt(2, policy_map_id);
		ps.setInt(3, nominee_id);

		int rowsAffected = ps.executeUpdate();
		
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
			
		if(rowsAffected >= 1) {
			System.out.println("Nominee successfully added");
			return true;
		}else {
			System.out.println("Nominee was not added");
			return false;
		}
	
	
	}
	
	public static void updateNomineeDetails(String nominee_id, String update_nominee_name, String update_relationship, String update_purpose) throws ClassNotFoundException, SQLException {
		String UPDATE_NOMINEE = "update Nominees " +
				"set name = ?, " + 
				"relationship_to_customer = ?, " +
				"purpose_of_changed = ?, " +
				"where nominee_id = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		
		ps = con.prepareStatement(UPDATE_NOMINEE);
		ps.setString(1, update_nominee_name);
		ps.setString(2, update_relationship);
		ps.setString(3, update_purpose);
		ps.setInt(4, Integer.parseInt(nominee_id));

		int rowsAffected = ps.executeUpdate();
		
		//clean up
		ps.close();
		con.close();
			
		if(rowsAffected >= 1) {
			System.out.println("Nominee successfully updated");
		}else {
			System.out.println("Nominee was not updated.");
		}
	
	}
	
	
	
	//Return List of Nominees associated with the PolicyMapID
	public static ArrayList<Integer> getNomineeIDFromPolicyMapID(String policy_map_id) throws ClassNotFoundException, SQLException {
		String SELECT_NOMINEE_ID_FROM_POLICY_MAP_ID = "select nominee_id from PolicyMap where "
				+ "policy_map_id = "+policy_map_id;
		
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
		
		ps = con.prepareStatement(SELECT_NOMINEE_ID_FROM_POLICY_MAP_ID);
		ResultSet rs = ps.executeQuery();
		ArrayList <Integer> nominee_list = new <Integer>ArrayList();
		int ctr = 0;
		while (rs.next()) {
			nominee_list.add(rs.getInt("nominee_id"));
			ctr++;
		}
		
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
			
		return nominee_list;
	}
	
	public static int maxNomineeID() throws ClassNotFoundException, SQLException {
		String SELECT_MAX_NOMINEE_ID = "select max(nominee_ID) from Nominees";
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_MAX_NOMINEE_ID);
		ResultSet rs = ps.executeQuery();
		int max = 0;
		while (rs.next()) {
			max = rs.getInt(1);
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return max;
	
	}
	public static int maxNomineeMapID() throws ClassNotFoundException, SQLException {
		String SELECT_MAX_NOMINEE_MAP_ID = "select max(nominee_map_id) from NomineeMap";
		Connection con = null;
		PreparedStatement ps = null;
		
		con = OracleConnection.INSTANCE.getConnection();
	
		ps = con.prepareStatement(SELECT_MAX_NOMINEE_MAP_ID);
		ResultSet rs = ps.executeQuery();
		int max = 0;
		while (rs.next()) {
			max = rs.getInt(1);
		}
		//clean up
		ps.close();
		OracleConnection.INSTANCE.disconnect();
		return max;
	
	}
	
}
