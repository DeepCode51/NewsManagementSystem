package com.entity;

public class Xinwenneirong {
    private Integer id;
	private String xinwenfenlei;	private String biaoti;	private String neirong;	private String miaoshu;	private String tupian;	private String dianjilv;	private String tianjiaren;	
    private String addtime;

    

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
	
	public String getXinwenfenlei() {
        return xinwenfenlei;
    }
    public void setXinwenfenlei(String xinwenfenlei) {
        this.xinwenfenlei = xinwenfenlei == null ? null : xinwenfenlei.trim();
    }	public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? null : biaoti.trim();
    }	public String getNeirong() {
        return neirong;
    }
    public void setNeirong(String neirong) {
        this.neirong = neirong == null ? null : neirong.trim();
    }	public String getMiaoshu() {
        return miaoshu;
    }
    public void setMiaoshu(String miaoshu) {
        this.miaoshu = miaoshu == null ? null : miaoshu.trim();
    }	public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? null : tupian.trim();
    }	public String getDianjilv() {
        return dianjilv;
    }
    public void setDianjilv(String dianjilv) {
        this.dianjilv = dianjilv == null ? null : dianjilv.trim();
    }	public String getTianjiaren() {
        return tianjiaren;
    }
    public void setTianjiaren(String tianjiaren) {
        this.tianjiaren = tianjiaren == null ? null : tianjiaren.trim();
    }	
	
	
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }
}
//   设置字段信息
