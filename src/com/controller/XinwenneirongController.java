package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Xinwenneirong;
import com.server.XinwenneirongServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class XinwenneirongController {
	@Resource
	private XinwenneirongServer xinwenneirongService;


   
	@RequestMapping("addXinwenneirong.do")
	public String addXinwenneirong(HttpServletRequest request,Xinwenneirong xinwenneirong,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		xinwenneirong.setAddtime(time.toString().substring(0, 19));
		xinwenneirongService.add(xinwenneirong);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "xinwenneirongList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:xinwenneirongList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateXinwenneirong.do")
	public String doUpdateXinwenneirong(int id,ModelMap map,Xinwenneirong xinwenneirong){
		xinwenneirong=xinwenneirongService.getById(id);
		map.put("xinwenneirong", xinwenneirong);
		return "xinwenneirong_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("xinwenneirongDetail.do")
	public String xinwenneirongDetail(int id,ModelMap map,Xinwenneirong xinwenneirong){
		xinwenneirong=xinwenneirongService.getById(id);
		map.put("xinwenneirong", xinwenneirong);
		return "xinwenneirong_detail";
	}
//	前台详细
	@RequestMapping("xwnrDetail.do")
	public String xwnrDetail(int id,ModelMap map,Xinwenneirong xinwenneirong){
		xinwenneirong=xinwenneirongService.getById(id);
		map.put("xinwenneirong", xinwenneirong);
		return "xinwenneirongdetail";
	}
//	
	@RequestMapping("updateXinwenneirong.do")
	public String updateXinwenneirong(int id,ModelMap map,Xinwenneirong xinwenneirong,HttpServletRequest request,HttpSession session){
		xinwenneirongService.update(xinwenneirong);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:xinwenneirongList.do";
	}

//	分页查询
	@RequestMapping("xinwenneirongList.do")
	public String xinwenneirongList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenneirong xinwenneirong, String xinwenfenlei, String biaoti, String neirong, String miaoshu, String tupian, String dianjilv1,String dianjilv2, String tianjiaren){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 5);
		
		
		if(xinwenfenlei==null||xinwenfenlei.equals("")){pmap.put("xinwenfenlei", null);}else{pmap.put("xinwenfenlei", xinwenfenlei);}
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(miaoshu==null||miaoshu.equals("")){pmap.put("miaoshu", null);}else{pmap.put("miaoshu", miaoshu);}
		if(tupian==null||tupian.equals("")){pmap.put("tupian", null);}else{pmap.put("tupian", tupian);}
		if(dianjilv1==null||dianjilv1.equals("")){pmap.put("dianjilv1", null);}else{pmap.put("dianjilv1", dianjilv1);}
		if(dianjilv2==null||dianjilv2.equals("")){pmap.put("dianjilv2", null);}else{pmap.put("dianjilv2", dianjilv2);}
		if(tianjiaren==null||tianjiaren.equals("")){pmap.put("tianjiaren", null);}else{pmap.put("tianjiaren", tianjiaren);}
		
		int total=xinwenneirongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenneirong> list=xinwenneirongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenneirong_list";
	}
	
	@RequestMapping("xinwenneirongList2.do")
	public String xinwenneirongList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenneirong xinwenneirong, String xinwenfenlei, String biaoti, String neirong, String miaoshu, String tupian, String dianjilv1,String dianjilv2, String tianjiaren,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("tianjiaren", (String)request.getSession().getAttribute("username"));
		if(xinwenfenlei==null||xinwenfenlei.equals("")){pmap.put("xinwenfenlei", null);}else{pmap.put("xinwenfenlei", xinwenfenlei);}
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(miaoshu==null||miaoshu.equals("")){pmap.put("miaoshu", null);}else{pmap.put("miaoshu", miaoshu);}
		if(tupian==null||tupian.equals("")){pmap.put("tupian", null);}else{pmap.put("tupian", tupian);}
		if(dianjilv1==null||dianjilv1.equals("")){pmap.put("dianjilv1", null);}else{pmap.put("dianjilv1", dianjilv1);}
		if(dianjilv2==null||dianjilv2.equals("")){pmap.put("dianjilv2", null);}else{pmap.put("dianjilv2", dianjilv2);}
		
		
		int total=xinwenneirongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenneirong> list=xinwenneirongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenneirong_list2";
	}
	
	
	@RequestMapping("xwnrList.do")
	public String xwnrList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenneirong xinwenneirong, 
			String xinwenfenlei, String biaoti, String neirong, 
			String miaoshu, String tupian, String dianjilv1,
			String dianjilv2, String tianjiaren)
	{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 5);
		
		/*try {
			xinwenfenlei = URLDecoder.decode(new String(xinwenfenlei.getBytes("ISO8859-1"),"utf-8"));

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		if(xinwenfenlei==null||xinwenfenlei.equals("")){pmap.put("xinwenfenlei", null);}else{pmap.put("xinwenfenlei", xinwenfenlei);}
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(miaoshu==null||miaoshu.equals("")){pmap.put("miaoshu", null);}else{pmap.put("miaoshu", miaoshu);}
		if(tupian==null||tupian.equals("")){pmap.put("tupian", null);}else{pmap.put("tupian", tupian);}
		if(dianjilv1==null||dianjilv1.equals("")){pmap.put("dianjilv1", null);}else{pmap.put("dianjilv1", dianjilv1);}
		if(dianjilv2==null||dianjilv2.equals("")){pmap.put("dianjilv2", null);}else{pmap.put("dianjilv2", dianjilv2);}
		if(tianjiaren==null||tianjiaren.equals("")){pmap.put("tianjiaren", null);}else{pmap.put("tianjiaren", tianjiaren);}
		
		
		int total=xinwenneirongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenneirong> list=xinwenneirongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("fenlei", URLEncoder.encode(xinwenfenlei));
		
		
		session.setAttribute("p", 1);
		return "xinwenneironglist";
	}
	
	@RequestMapping("deleteXinwenneirong.do")
	public String deleteXinwenneirong(int id,HttpServletRequest request){
		xinwenneirongService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:xinwenneirongList.do";
	}
	
	
}
