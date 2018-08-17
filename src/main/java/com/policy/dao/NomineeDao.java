package com.policy.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.policy.data.Nominee;

public class NomineeDao {
	
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
			temp.setRelationshipToCustomer(rs.getString(4));
			noms.add(temp);
			rs.close();
		}
		
		pst.close();
		st.close();
		OracleConnection.INSTANCE.disconnect();
		
		
		
		return noms;
		
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		List<Nominee> k = getNomineesFromMapID(1);
		System.out.println(k.get(0).getNomineeName());
		System.out.println(k.get(1).getNomineeName());

	}

}
