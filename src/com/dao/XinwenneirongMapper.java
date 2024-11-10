package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Xinwenneirong;

public interface XinwenneirongMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Xinwenneirong record);

    int insertSelective(Xinwenneirong record);

    Xinwenneirong selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Xinwenneirong record);
	
    int updateByPrimaryKey(Xinwenneirong record);
	public Xinwenneirong quchongXinwenneirong(Map<String, Object> tianjiaren);
	public List<Xinwenneirong> getAll(Map<String, Object> map);
	public List<Xinwenneirong> getsyxinwenneirong1(Map<String, Object> map);
	public List<Xinwenneirong> getsyxinwenneirong3(Map<String, Object> map);
	public List<Xinwenneirong> getsyxinwenneirong2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Xinwenneirong> getByPage(Map<String, Object> map);
	public List<Xinwenneirong> select(Map<String, Object> map);
//	所有List
}

