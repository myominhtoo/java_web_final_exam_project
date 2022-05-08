package student.dao.students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import student.dao.DB;
import student.dto.students.*;

@Service("studentDAO")
public class StudentDAO {

	DB db = new DB();
	private Connection con = db.con;
	
	
	//insert query method
	public int insert(StudentReqDTO dto) {
		int status = 0;
		String query = "INSERT INTO students (student_id,student_name,class_name,registered_date,status) VALUES(?,?,?,?,?) ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getStudentId());
			pre.setString(2 , dto.getStudentName());
			pre.setString(3 , dto.getClassName());
			pre.setString(4 , dto.getRegisteredDate());
			pre.setString(5 , dto.getStatus());
			status = pre.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//delete query method
	public int delete(StudentReqDTO dto) {
		int status = 0 ; 
		String query = "DELETE FROM students WHERE student_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getStudentId());
			status = pre.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	//select one data query method
	public StudentResDTO  select(StudentReqDTO dto) {
		StudentResDTO student = new StudentResDTO();
		String query = "SELECT  * FROM students WHERE student_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getStudentId());
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				student.setClassName(set.getString("class_name"));
				student.setRegisteredDate(set.getString("registered_date"));
				student.setStatus(set.getString("status"));
				student.setStudentId(set.getString("student_id"));
				student.setStudentName(set.getString("student_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return student;
	}
	
	//select all query method
	public ArrayList<StudentResDTO> selectAll(){
		ArrayList<StudentResDTO> students = new ArrayList<>();
		
		String query = "SELECT * FROM students";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				StudentResDTO student = new StudentResDTO();
				student.setClassName(set.getString("class_name"));
				student.setRegisteredDate(set.getString("registered_date"));
				student.setStatus(set.getString("status"));
				student.setStudentId(set.getString("student_id"));
				student.setStudentName(set.getString("student_name"));
				students.add(student);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return students;
	}
	
	//update query method
	public int update(StudentReqDTO dto) {
		int status = 0 ;
		String query = "UPDATE students SET student_name = ? , class_name = ? , status = ? , registered_date = ?   WHERE student_id = ? ";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1 , dto.getStudentName());
			pre.setString(2 , dto.getClassName());
			pre.setString(3 , dto.getStatus());
			pre.setString(4 , dto.getRegisteredDate());
			pre.setString(5 , dto.getStudentId());
			status = pre.executeUpdate();
		}catch(SQLException e ) {
			e.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<StudentResDTO> search(StudentReqDTO dto){
		ArrayList<StudentResDTO> students = new ArrayList<>();
		String query = "SELECT *FROM students WHERE student_id = ? OR (student_name LIKE '%"+dto.getStudentName()+"%' AND class_name LIKE '%"+dto.getClassName()+"%')";
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString( 1 , dto.getStudentName());
			ResultSet set = pre.executeQuery();
			while(set.next()) {
				StudentResDTO student = new StudentResDTO();
				student.setClassName(set.getString("class_name"));
				student.setRegisteredDate(set.getString("registered_date"));
				student.setStatus(set.getString("status"));
				student.setStudentId(set.getString("student_id"));
				student.setStudentName(set.getString("student_name"));
				students.add(student);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
}
