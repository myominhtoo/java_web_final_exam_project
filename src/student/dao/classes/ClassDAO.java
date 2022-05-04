package student.dao.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import student.dao.DB;
import student.dto.classes.ClassReqDTO;
import student.dto.classes.ClassResDTO;

public class ClassDAO {
	DB db = new DB();
	private Connection con = db.con;
	
	
	//insert query method
	public int insert(ClassReqDTO dto) {
		int status = 0;
		String query = "INSERT INTO users (class_id,class_name) VALUES(?,?) ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getClassId());
			pre.setString(2 , dto.getClassName());
			status = pre.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//delete query method
	public int delete(ClassReqDTO dto) {
		int status = 0 ; 
		String query = "DELETE * FROM classes WHERE class_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getClassId());
			status = pre.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//select one data query method
	public ClassResDTO  select(ClassReqDTO dto) {
		ClassResDTO cls = new ClassResDTO();
		String query = "SELECT  * FROM users WHERE class_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getClassId());
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				cls.setCreatedAt(set.getString("created_at"));
				cls.setClassId(set.getString("class_id"));
				cls.setClassName(set.getString("class_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return cls;
	}
	
	//select all query method
	public ArrayList<ClassResDTO> selectAll(){
		ArrayList<ClassResDTO> clses = new ArrayList<>();
		
		String query = "SELECT * FROM classes";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				ClassResDTO cls = new ClassResDTO();
				cls.setCreatedAt(set.getString("created_at"));
				cls.setClassId(set.getString("class_id"));
				cls.setClassName(set.getString("class_name"));
				clses.add(cls);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return clses;
	}
	
	//update query method
	public int update(ClassReqDTO dto) {
		int status = 0 ;
		String query = "UPDATE classes SET class_name = ? WHERE class_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getClassName());
			pre.setString(2 , dto.getClassId());
			status = pre.executeUpdate();
		}catch(SQLException e ) {
			e.printStackTrace();
		}
		return status;
	}
}
