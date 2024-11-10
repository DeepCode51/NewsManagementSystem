package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Xinwenneirong;

public interface XinwenneirongServer {

  public int add(Xinwenneirong po);

  public int update(Xinwenneirong po);
  
  
  
  public int delete(int id);

  public List<Xinwenneirong> getAll(Map<String,Object> map);
  public List<Xinwenneirong> getsyxinwenneirong1(Map<String,Object> map);
  public List<Xinwenneirong> getsyxinwenneirong2(Map<String,Object> map);
  public List<Xinwenneirong> getsyxinwenneirong3(Map<String,Object> map);
  public Xinwenneirong quchongXinwenneirong(Map<String, Object> acount);

  public Xinwenneirong getById( int id);

  public List<Xinwenneirong> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Xinwenneirong> select(Map<String, Object> map);
}
//	所有List
