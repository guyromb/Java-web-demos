package org.service;

import java.util.List;

import org.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.dao.*;

@Service("studentService")
public class StudentService {
	
	@Autowired
	private StudentDao studentDao;
	
	//查询所有记录
	public List<Student> queryAll() {
		return studentDao.queryAll();
	}
	
	//增加一条记录
	public String addOne(Student entity) {
		return studentDao.addOne(entity);
	}
	
	//修改一条记录
	public String updateOne(Student entity) {
		return studentDao.updateOne(entity);
	}
	
	//删除一条记录
	public String deleteOne(int id) {
		return studentDao.deleteOne(id);
	}
	
}
