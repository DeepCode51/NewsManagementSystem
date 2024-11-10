package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.XinwenfenleiMapper;
import com.entity.Xinwenfenlei;
import com.server.XinwenfenleiServer;
@Service
public class XinwenfenleiServerImpi implements XinwenfenleiServer {
   @Resource
   private XinwenfenleiMapper gdao;
	@Override
	public int add(Xinwenfenlei po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Xinwenfenlei po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Xinwenfenlei> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Xinwenfenlei> getsyxinwenfenlei1(Map<String, Object> map) {
		return gdao.getsyxinwenfenlei1(map);
	}
	public List<Xinwenfenlei> getsyxinwenfenlei2(Map<String, Object> map) {
		return gdao.getsyxinwenfenlei2(map);
	}
	public List<Xinwenfenlei> getsyxinwenfenlei3(Map<String, Object> map) {
		return gdao.getsyxinwenfenlei3(map);
	}
	
	@Override
	public Xinwenfenlei quchongXinwenfenlei(Map<String, Object> account) {
		return gdao.quchongXinwenfenlei(account);
	}

	@Override
	public List<Xinwenfenlei> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Xinwenfenlei> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Xinwenfenlei getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

