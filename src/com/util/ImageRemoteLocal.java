package com.util;

import java.util.*;
import java.util.regex.*;

import javax.servlet.http.HttpServletRequest;

import java.io.*;
import java.net.*;


public class ImageRemoteLocal {

	public static String getRemoteImage(HttpServletRequest request ,String c )
	{
		//String root = request.getSession().getServletContext().getRealPath("");
		String root = request.getSession().getServletContext().getRealPath("upload");
		List<String> imglist = getImgStr(c);
		for (int i = 0; i < imglist.size(); i++) {
			String file = new Date().getTime()+(1+Math.random()*10000000)+".png";
			creatImg(changeC(imglist.get(i)),root, file);
			String nu = "upload/"+file;
			c = replaceString(c,imglist.get(i),nu);
		}
		
		return c;
	}
	
	public static String replaceString(String a, String b, String c) {
		return a.replaceAll(b, "src=" + c);
	}
	
	// 新加方法
	public static String changeC(String c) {
		return c.substring(5, c.length() - 1);
	}

	/**
	 * 得到网页中图片的地址
	 */
	public static List<String> getImgStr(String htmlStr) {
		String img = "";
		Pattern p_image;
		Matcher m_image;
		List<String> pics = new ArrayList<String>();

		String regEx_img = "<img.*src=(.*?)[^>]*?>"; // 图片链接地址
		p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
		m_image = p_image.matcher(htmlStr);
		while (m_image.find()) {
			// img = img + "," + m_image.group();
			img = m_image.group();
			Matcher m = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(img); // 匹配src
			while (m.find()) {
				pics.add(m.group());
			}
		}
		return pics;
	}

	// 图片抓取
	public static void creatImg(String imginUrl, String imgoutPath, String imgName) {
		try {
			URL url = new URL(imginUrl);
			java.io.BufferedInputStream bis = new BufferedInputStream(url.openStream());
			byte[] bytes = new byte[100];
			OutputStream bos = new FileOutputStream(new File(imgoutPath + "\\" + imgName));
			int len;
			while ((len = bis.read(bytes)) > 0) {
				bos.write(bytes, 0, len);
			}
			bis.close();
			bos.flush();
			bos.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
