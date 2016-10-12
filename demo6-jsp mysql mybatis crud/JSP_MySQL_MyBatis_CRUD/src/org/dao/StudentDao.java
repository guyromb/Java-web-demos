package org.dao;

import org.springframework.stereotype.Repository;
import java.util.List;
import org.entity.*;

@Repository
public interface StudentDao {

    //查询所有记录
	public List<Student> queryAll();
	
	//增加一条记录
	public void addOne(Student entity);

	//修改一条记录
	public void updateOne(Student entity);
	
	//删除一条记录
	public void deleteOne(int id);
	
}




