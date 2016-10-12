package org.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.entity.*;

@Repository
public class StudentDao {
	
	private JdbcTemplate template;
	
	public JdbcTemplate getTemplate() {  
        return template;  
    }  
  
    public void setTemplate(JdbcTemplate template) {  
        this.template = template;  
    }  
	
    //查询所有记录
	public List<Student> queryAll() {
		final ArrayList<Student> list = new ArrayList<Student>();
		String strSql = "select * from newstudent2 ";
		template.query(strSql, new Object[] {}, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				Student entity = new Student();
				entity.setId(rs.getInt("id"));
				entity.setName(rs.getString("name"));
				entity.setPhone(rs.getString("phone"));
				list.add(entity);
			}
		});
		return list;
	}
	
	//增加一条记录
	public String addOne(Student entity) {
		String callbackResult = "fail";
		String strSql = "insert into newstudent2 (id,name,phone) values (?,?,?)";
		Object obj[] = {entity.getId(), entity.getName(), entity.getPhone()};
		int ret = template.update(strSql, obj);
		if (ret > 0) {
			callbackResult = "success";
		}
		return callbackResult;
	}

	//修改一条记录
	public String updateOne(Student entity) {
		String callbackResult = "fail";
		String strSql = "update newstudent2 set name=?,phone=? where id=?";
		Object obj[] = {entity.getName(), entity.getPhone(), entity.getId()};
		int ret = template.update(strSql, obj);
		if (ret > 0) {
			callbackResult = "success";
		}
		return callbackResult;
	} 
	
	//删除一条记录
	public String deleteOne(int id) {
		String callbackResult = "fail";
		String strSql = "delete from newstudent2 where id=?";
		Object obj[] = {id};
		int ret = template.update(strSql, obj);
		if (ret > 0) {
			callbackResult = "success";
		}
		return callbackResult;
	}
	
}




