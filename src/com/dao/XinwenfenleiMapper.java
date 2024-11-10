package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Xinwenfenlei;

public interface XinwenfenleiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Xinwenfenlei record);

    int insertSelective(Xinwenfenlei record);

    Xinwenfenlei selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Xinwenfenlei record);
	
    int updateByPrimaryKey(Xinwenfenlei record);
	public Xinwenfenlei quchongXinwenfenlei(Map<String, Object> fenlei);
	public List<Xinwenfenlei> getAll(Map<String, Object> map);
	public List<Xinwenfenlei> getsyxinwenfenlei1(Map<String, Object> map);
	public List<Xinwenfenlei> getsyxinwenfenlei3(Map<String, Object> map);
	public List<Xinwenfenlei> getsyxinwenfenlei2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Xinwenfenlei> getByPage(Map<String, Object> map);
	public List<Xinwenfenlei> select(Map<String, Object> map);
//	所有List
}

