package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.XinwenfabuMapper;
import com.entity.Xinwenfabu;
import com.server.XinwenfabuServer;
@Service
public class XinwenfabuServerImpi implements XinwenfabuServer {
   @Resource
   private XinwenfabuMapper gdao;
	@Override
	public int add(Xinwenfabu po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Xinwenfabu po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Xinwenfabu> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Xinwenfabu> getsyxinwenfabu1(Map<String, Object> map) {
		return gdao.getsyxinwenfabu1(map);
	}
	public List<Xinwenfabu> getsyxinwenfabu2(Map<String, Object> map) {
		return gdao.getsyxinwenfabu2(map);
	}
	public List<Xinwenfabu> getsyxinwenfabu3(Map<String, Object> map) {
		return gdao.getsyxinwenfabu3(map);
	}
	
	@Override
	public Xinwenfabu quchongXinwenfabu(Map<String, Object> account) {
		return gdao.quchongXinwenfabu(account);
	}

	@Override
	public List<Xinwenfabu> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Xinwenfabu> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Xinwenfabu getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

