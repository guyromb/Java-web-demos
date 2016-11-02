package org.dao;

import org.springframework.stereotype.Repository;
import java.util.List;
import org.entity.*;

@Repository
public interface HotActivityDao {

    //查询所有记录
	public List<HotActivity> queryAll();
	
	//增加一条记录
	public void addOne(HotActivity entity);

	//修改一条记录
	public void updateOne(HotActivity entity);
	
	//删除一条记录
	public void deleteOne(HotActivity entity);
	
}




