package org.service;

import java.util.List;

import org.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.dao.*;

@Service("hotActivityService")
public class HotActivityService {
	
	@Autowired
	private HotActivityDao hotActivityDao;
	
	//查询所有记录
	public List<HotActivity> queryAll() {
		return hotActivityDao.queryAll();
	}
	
	//增加一条记录
	public void addOne(HotActivity entity) {
		hotActivityDao.addOne(entity);
	}
	
	//修改一条记录
	public void updateOne(HotActivity entity) {
		hotActivityDao.updateOne(entity);
	}
	
	//删除一条记录
	public void deleteOne(HotActivity entity) {
		hotActivityDao.deleteOne(entity);
	}
	
}
