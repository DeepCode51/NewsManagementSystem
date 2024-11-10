package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Xinwenfenlei;

public interface XinwenfenleiServer {

  public int add(Xinwenfenlei po);

  public int update(Xinwenfenlei po);
  
  
  
  public int delete(int id);

  public List<Xinwenfenlei> getAll(Map<String,Object> map);
  public List<Xinwenfenlei> getsyxinwenfenlei1(Map<String,Object> map);
  public List<Xinwenfenlei> getsyxinwenfenlei2(Map<String,Object> map);
  public List<Xinwenfenlei> getsyxinwenfenlei3(Map<String,Object> map);
  public Xinwenfenlei quchongXinwenfenlei(Map<String, Object> acount);

  public Xinwenfenlei getById( int id);

  public List<Xinwenfenlei> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Xinwenfenlei> select(Map<String, Object> map);
}
//	所有List
