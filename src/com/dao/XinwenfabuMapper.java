package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Xinwenfabu;

public interface XinwenfabuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Xinwenfabu record);

    int insertSelective(Xinwenfabu record);

    Xinwenfabu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Xinwenfabu record);
	
    int updateByPrimaryKey(Xinwenfabu record);
	public Xinwenfabu quchongXinwenfabu(Map<String, Object> zhanghao);
	public List<Xinwenfabu> getAll(Map<String, Object> map);
	public List<Xinwenfabu> getsyxinwenfabu1(Map<String, Object> map);
	public List<Xinwenfabu> getsyxinwenfabu3(Map<String, Object> map);
	public List<Xinwenfabu> getsyxinwenfabu2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Xinwenfabu> getByPage(Map<String, Object> map);
	public List<Xinwenfabu> select(Map<String, Object> map);
//	所有List
}

