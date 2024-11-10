package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.XinwenneirongMapper;
import com.entity.Xinwenneirong;
import com.server.XinwenneirongServer;
@Service
public class XinwenneirongServerImpi implements XinwenneirongServer {
   @Resource
   private XinwenneirongMapper gdao;
	@Override
	public int add(Xinwenneirong po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Xinwenneirong po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Xinwenneirong> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Xinwenneirong> getsyxinwenneirong1(Map<String, Object> map) {
		return gdao.getsyxinwenneirong1(map);
	}
	public List<Xinwenneirong> getsyxinwenneirong2(Map<String, Object> map) {
		return gdao.getsyxinwenneirong2(map);
	}
	public List<Xinwenneirong> getsyxinwenneirong3(Map<String, Object> map) {
		return gdao.getsyxinwenneirong3(map);
	}
	
	@Override
	public Xinwenneirong quchongXinwenneirong(Map<String, Object> account) {
		return gdao.quchongXinwenneirong(account);
	}

	@Override
	public List<Xinwenneirong> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Xinwenneirong> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Xinwenneirong getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

