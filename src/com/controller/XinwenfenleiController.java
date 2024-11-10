package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Xinwenfenlei;
import com.server.XinwenfenleiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class XinwenfenleiController {
	@Resource
	private XinwenfenleiServer xinwenfenleiService;


   
	@RequestMapping("addXinwenfenlei.do")
	public String addXinwenfenlei(HttpServletRequest request,Xinwenfenlei xinwenfenlei,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		xinwenfenlei.setAddtime(time.toString().substring(0, 19));
		xinwenfenleiService.add(xinwenfenlei);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "xinwenfenleiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:xinwenfenleiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateXinwenfenlei.do")
	public String doUpdateXinwenfenlei(int id,ModelMap map,Xinwenfenlei xinwenfenlei){
		xinwenfenlei=xinwenfenleiService.getById(id);
		map.put("xinwenfenlei", xinwenfenlei);
		return "xinwenfenlei_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("xinwenfenleiDetail.do")
	public String xinwenfenleiDetail(int id,ModelMap map,Xinwenfenlei xinwenfenlei){
		xinwenfenlei=xinwenfenleiService.getById(id);
		map.put("xinwenfenlei", xinwenfenlei);
		return "xinwenfenlei_detail";
	}
//	前台详细
	@RequestMapping("xwflDetail.do")
	public String xwflDetail(int id,ModelMap map,Xinwenfenlei xinwenfenlei){
		xinwenfenlei=xinwenfenleiService.getById(id);
		map.put("xinwenfenlei", xinwenfenlei);
		return "xinwenfenleidetail";
	}
//	
	@RequestMapping("updateXinwenfenlei.do")
	public String updateXinwenfenlei(int id,ModelMap map,Xinwenfenlei xinwenfenlei,HttpServletRequest request,HttpSession session){
		xinwenfenleiService.update(xinwenfenlei);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:xinwenfenleiList.do";
	}

//	分页查询
	@RequestMapping("xinwenfenleiList.do")
	public String xinwenfenleiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenfenlei xinwenfenlei, String fenlei){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(fenlei==null||fenlei.equals("")){pmap.put("fenlei", null);}else{pmap.put("fenlei", fenlei);}		
		int total=xinwenfenleiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenfenlei> list=xinwenfenleiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenfenlei_list";
	}
	
	
	
	@RequestMapping("xwflList.do")
	public String xwflList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenfenlei xinwenfenlei, String fenlei){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(fenlei==null||fenlei.equals("")){pmap.put("fenlei", null);}else{pmap.put("fenlei", fenlei);}		
		int total=xinwenfenleiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenfenlei> list=xinwenfenleiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenfenleilist";
	}
	
	@RequestMapping("deleteXinwenfenlei.do")
	public String deleteXinwenfenlei(int id,HttpServletRequest request){
		xinwenfenleiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:xinwenfenleiList.do";
	}
	
	
}
