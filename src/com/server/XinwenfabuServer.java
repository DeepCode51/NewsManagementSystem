package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Xinwenfabu;

public interface XinwenfabuServer {

  public int add(Xinwenfabu po);

  public int update(Xinwenfabu po);
  
  
  
  public int delete(int id);

  public List<Xinwenfabu> getAll(Map<String,Object> map);
  public List<Xinwenfabu> getsyxinwenfabu1(Map<String,Object> map);
  public List<Xinwenfabu> getsyxinwenfabu2(Map<String,Object> map);
  public List<Xinwenfabu> getsyxinwenfabu3(Map<String,Object> map);
  public Xinwenfabu quchongXinwenfabu(Map<String, Object> acount);

  public Xinwenfabu getById( int id);

  public List<Xinwenfabu> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Xinwenfabu> select(Map<String, Object> map);
}
//	所有List
