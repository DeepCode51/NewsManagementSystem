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

import com.entity.Xinwenfabu;
import com.server.XinwenfabuServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class XinwenfabuController {
	@Resource
	private XinwenfabuServer xinwenfabuService;


   
	@RequestMapping("addXinwenfabu.do")
	public String addXinwenfabu(HttpServletRequest request,Xinwenfabu xinwenfabu,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		xinwenfabu.setAddtime(time.toString().substring(0, 19));
		xinwenfabuService.add(xinwenfabu);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "xinwenfabuList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:xinwenfabuList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateXinwenfabu.do")
	public String doUpdateXinwenfabu(int id,ModelMap map,Xinwenfabu xinwenfabu){
		xinwenfabu=xinwenfabuService.getById(id);
		map.put("xinwenfabu", xinwenfabu);
		return "xinwenfabu_updt";
	}
	
	@RequestMapping("doUpdateXinwenfabu2.do")
	public String doUpdateXinwenfabu2(ModelMap map,Xinwenfabu xinwenfabu,HttpServletRequest request){
		xinwenfabu=xinwenfabuService.getById(Integer.parseInt((String)request.getSession().getAttribute("uid")));
		map.put("xinwenfabu", xinwenfabu);
		return "xinwenfabu_updt2";
	}
	
@RequestMapping("updateXinwenfabu2.do")
	public String updateXinwenfabu2(int id,ModelMap map,Xinwenfabu xinwenfabu){
		xinwenfabuService.update(xinwenfabu);
		return "redirect:doUpdateXinwenfabu2.do";
	}
	
	
	
//	后台详细
	@RequestMapping("xinwenfabuDetail.do")
	public String xinwenfabuDetail(int id,ModelMap map,Xinwenfabu xinwenfabu){
		xinwenfabu=xinwenfabuService.getById(id);
		map.put("xinwenfabu", xinwenfabu);
		return "xinwenfabu_detail";
	}
//	前台详细
	@RequestMapping("xwfbDetail.do")
	public String xwfbDetail(int id,ModelMap map,Xinwenfabu xinwenfabu){
		xinwenfabu=xinwenfabuService.getById(id);
		map.put("xinwenfabu", xinwenfabu);
		return "xinwenfabudetail";
	}
//	
	@RequestMapping("updateXinwenfabu.do")
	public String updateXinwenfabu(int id,ModelMap map,Xinwenfabu xinwenfabu,HttpServletRequest request,HttpSession session){
		xinwenfabuService.update(xinwenfabu);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:xinwenfabuList.do";
	}

//	分页查询
	@RequestMapping("xinwenfabuList.do")
	public String xinwenfabuList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenfabu xinwenfabu, String zhanghao, String mima, String touxiang, String xingming, String lianxidianhua){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 5);
		
		
		if(zhanghao==null||zhanghao.equals("")){pmap.put("zhanghao", null);}else{pmap.put("zhanghao", zhanghao);}		if(mima==null||mima.equals("")){pmap.put("mima", null);}else{pmap.put("mima", mima);}		if(touxiang==null||touxiang.equals("")){pmap.put("touxiang", null);}else{pmap.put("touxiang", touxiang);}		if(xingming==null||xingming.equals("")){pmap.put("xingming", null);}else{pmap.put("xingming", xingming);}		if(lianxidianhua==null||lianxidianhua.equals("")){pmap.put("lianxidianhua", null);}else{pmap.put("lianxidianhua", lianxidianhua);}		
		int total=xinwenfabuService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenfabu> list=xinwenfabuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenfabu_list";
	}
	
	
	
	@RequestMapping("xwfbList.do")
	public String xwfbList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwenfabu xinwenfabu, String zhanghao, String mima, String touxiang, String xingming, String lianxidianhua){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 5);
		
		
		if(zhanghao==null||zhanghao.equals("")){pmap.put("zhanghao", null);}else{pmap.put("zhanghao", zhanghao);}		if(mima==null||mima.equals("")){pmap.put("mima", null);}else{pmap.put("mima", mima);}		if(touxiang==null||touxiang.equals("")){pmap.put("touxiang", null);}else{pmap.put("touxiang", touxiang);}		if(xingming==null||xingming.equals("")){pmap.put("xingming", null);}else{pmap.put("xingming", xingming);}		if(lianxidianhua==null||lianxidianhua.equals("")){pmap.put("lianxidianhua", null);}else{pmap.put("lianxidianhua", lianxidianhua);}		
		int total=xinwenfabuService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwenfabu> list=xinwenfabuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwenfabulist";
	}
	
	@RequestMapping("deleteXinwenfabu.do")
	public String deleteXinwenfabu(int id,HttpServletRequest request){
		xinwenfabuService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:xinwenfabuList.do";
	}
	
	@RequestMapping("quchongXinwenfabu.do")
	public void quchongXinwenfabu(Xinwenfabu xinwenfabu,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("zhanghao", xinwenfabu.getZhanghao());
		   System.out.println("zhanghao==="+xinwenfabu.getZhanghao());
		   System.out.println("zhanghao222==="+xinwenfabuService.quchongXinwenfabu(map));
		   JSONObject obj=new JSONObject();
		   if(xinwenfabuService.quchongXinwenfabu(map)!=null){
				 obj.put("info", "ng");
			   }else{
				   obj.put("info", "账号可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
}
