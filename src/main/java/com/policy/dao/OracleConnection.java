package com.policy.dao;

import java.sql.*;
/**
 * enum to manage connection with oracle database.
 * 
 * Note that this is a singleton and only one instance of it will exist. 
 * 
 * Use the disconnect() method when connection needs to be closed.
 * 
 * To access the single instance of this enum use OracleConnection.INSTANCE
 * Example: Connection = OracleConnection.INSTANCE.getConnection();
 * 
 * @author Nicholas, created 8/15
 *
 */
public enum OracleConnection {
	
	INSTANCE;
	
	private static Connection con = null;
	
	
	/**
	 * connect opens a connection to the oracle database. It will be called whenever
	 * the database is accessed.
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void connect() throws ClassNotFoundException, SQLException {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uname = "system";
		String pwd = "tcs12345";
		
		//step 2
		con = DriverManager.getConnection(url, uname, pwd);
	}
	
	/**
	 * Method to get a connection object to access the database
	 * 
	 * @return connection object
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		connect();
		return con;
	}

	/**
	 * Used to close the connection.
	 */
	public void disconnect(){
		try {
			con.close();
		} catch (SQLException e) {}
	}
}
