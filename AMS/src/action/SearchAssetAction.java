package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.AssetDao;

@Controller @Scope("prototype")
public class SearchAssetAction {
	private String selecttype;
	private String value;
	private String typeid;
	private String isdep;
	private String isuse;
	private String price1;
	private String price2;
	private String uid;
	private String did;
	private int isIE;
	@Resource private AssetDao ad;
	
	@SuppressWarnings("unchecked")
	public String search() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(selecttype.length() > 1){
			out.print("empty");
			return null;
		}
		if(isIE == 1)
			value = new String(value.getBytes("ISO-8859-1"),"gbk");
		else
			value = new String(value.getBytes("ISO-8859-1"),"utf-8");
		if(Integer.valueOf(selecttype)==1){
			List list = ad.searchByAid(value, typeid, isdep, isuse, price1, price2, did, uid);//*********************
			JSONArray json = JSONArray.fromObject(list);
			out.print(json.toString());
			return null;
		}
		if(Integer.valueOf(selecttype)==2){
			List list = ad.searchByName(value, typeid, isdep, isuse, price1, price2, did, uid);//*********************
			JSONArray json = JSONArray.fromObject(list);
			out.print(json.toString());
			return null;
		}
		return null;
	}
	
	public String getSelecttype() {
		return selecttype;
	}
	public void setSelecttype(String selecttype) {
		this.selecttype = selecttype;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getIsdep() {
		return isdep;
	}
	public void setIsdep(String isdep) {
		this.isdep = isdep;
	}
	public String getIsuse() {
		return isuse;
	}
	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}
	public String getPrice1() {
		return price1;
	}
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	public String getPrice2() {
		return price2;
	}
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public int getIsIE() {
		return isIE;
	}
	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
	
}
