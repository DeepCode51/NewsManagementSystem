package com.controller;

import java.io.File;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Xinwenneirong;
import com.entity.Xinwentongzhi;
import com.entity.Yonghuzhuce;
import com.entity.Xinwenfenlei;
//jixacxishxu1
import com.server.XinwenneirongServer;
import com.server.XinwentongzhiServer;
import com.server.YonghuzhuceServer;
import com.server.XinwenfenleiServer;
//jixacxishxu2

import com.util.PageBean;

@Controller
public class IndexController {
	
	
	@Resource
	private XinwentongzhiServer xinwentongzhiService;
	@Resource
	private YonghuzhuceServer yonghuzhuceServer;
	
	@Resource
	private XinwenneirongServer xinwenneirongServer;
	
	@Resource
	private XinwenfenleiServer xinwenfenleiServer;
	//jixacxishxu3
	
	
	
@SuppressWarnings("all")
	//	首页显示内容
	@RequestMapping("index.do")
	public String showIndex(ModelMap map){
		
		Map fenleiMap = new HashMap();
		fenleiMap.put("pageno", 0);
		fenleiMap.put("pageSize", 1000);
		
		List<Xinwenfenlei> fenlei = xinwenfenleiServer.getByPage(fenleiMap);
		
		Map where = new HashMap();
		where.put("pageno", 0);
		where.put("pageSize", 1000);
		ArrayList xinwenList = new ArrayList();
		
		for(Xinwenfenlei xfl: fenlei) {
			where.put("xinwenfenlei", xfl.getFenlei());
			
			List<Xinwenneirong> rowList = xinwenneirongServer.getByPage(where);
			Map obj = new HashMap();
			obj.put("fenlei", xfl.getFenlei());
			obj.put("list", rowList);
			xinwenList.add(obj);
			
		}
		
		
		List<Xinwentongzhi> syxinwentongzhi1=xinwentongzhiService.getsyxinwentongzhi1(null);
		List<Xinwentongzhi> syxinwentongzhi2=xinwentongzhiService.getsyxinwentongzhi2(null);
		List<Xinwentongzhi> syxinwentongzhi3=xinwentongzhiService.getsyxinwentongzhi3(null);
		
		List<Yonghuzhuce> syyonghuzhuce1=yonghuzhuceServer.getsyyonghuzhuce1(null);
		//jixacxishxu4
		
	    map.put("syxinwentongzhi1", syxinwentongzhi1);
	    map.put("syxinwentongzhi2", syxinwentongzhi2);
	    map.put("syxinwentongzhi3", syxinwentongzhi3);
	    map.put("syyonghuzhuce1", syyonghuzhuce1);
	    map.put("xinwenList", xinwenList);
	    map.put("fenlei", fenlei);
	    //jixacxishxu5

		return "default";
	}

	

	
}
