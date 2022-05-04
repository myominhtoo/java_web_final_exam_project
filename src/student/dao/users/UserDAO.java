package student.dao.users;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import student.dao.DB;
import student.dto.users.UserReqDTO;
import student.dto.users.UserResDTO;

public class UserDAO {
	
	DB db = new DB();
	private Connection con = db.con;
	
	
	//insert query method
	public int insert(UserReqDTO dto) {
		int status = 0;
		String query = "INSERT INTO users (user_id,user_name,password) VALUES(?,?,?) ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getUserId());
			pre.setString(2 , dto.getUserName());
			pre.setString(3 , dto.getPassword());
			status = pre.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//delete query method
	public int delete(UserReqDTO dto) {
		int status = 0 ; 
		String query = "DELETE * FROM users WHERE user_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getUserId());
			status = pre.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//select one data query method
	public UserResDTO  select(UserReqDTO dto) {
		UserResDTO user = new UserResDTO();
		String query = "SELECT  * FROM users WHERE user_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getUserId());
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				user.setCreatedAt(set.getString("created_at"));
				user.setPassword(set.getString("password"));
				user.setUserId(set.getString("user_id"));
				user.setUserName(set.getString("user_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//select all query method
	public ArrayList<UserResDTO> selectAll(){
		ArrayList<UserResDTO> users = new ArrayList<>();
		
		String query = "SELECT * FROM users";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				UserResDTO user = new UserResDTO();
				user.setCreatedAt(set.getString("created_at"));
				user.setPassword(set.getString("password"));
				user.setUserId(set.getString("user_id"));
				user.setUserName(set.getString("user_name"));
				users.add(user);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	//update query method
	public int update(UserReqDTO dto) {
		int status = 0 ;
		String query = "UPDATE users SET user_name = ? , password = ? WHERE user_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getUserName());
			pre.setString(2 , dto.getPassword());
			pre.setString(3 , dto.getUserId());
			status = pre.executeUpdate();
		}catch(SQLException e ) {
			e.printStackTrace();
		}
		return status;
	}
	
}
