package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.AssetDao;

import entity.Assets;

@Controller @Scope("prototype")
public class CreateAssetAction {
	private Assets asset;
	private int typeid;
	private int did;
	private int uid;
	private String isuse;
	private String isdep;
	private String ccrq;
	private String gmrq;
	private int isIE;
	@Resource private AssetDao ad;
	
	public String create() throws IOException, ParseException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(typeid == 0 || asset.getAid().equals("") || asset.getAssetname().equals("") || asset.getPrice().equals("")){
			out.print("empty");
			return null;
		}
		if(isuse.length() > 1 || isdep.length() > 1 || gmrq.equals("")){
			out.print("empty");
			return null;
		}
		if(Integer.valueOf(isuse) == 2){
			if(did == 0 || uid == 0){
				out.print("empty");
				return null;
			}
		}
		String name, mp = "";
		if(isIE == 1){
			name = new String(asset.getAssetname().getBytes("ISO-8859-1"),"gbk");
			if(!asset.getManufacturer().equals(""))
				mp = new String(asset.getManufacturer().getBytes("ISO-8859-1"),"gbk");
		}
		else{
			name = new String(asset.getAssetname().getBytes("ISO-8859-1"),"utf-8");
			if(!asset.getManufacturer().equals(""))
				mp = new String(asset.getManufacturer().getBytes("ISO-8859-1"),"utf-8");
		}
		if(!ccrq.equals("")){
			Date date = DateFormat.getDateInstance().parse(ccrq);
			asset.setManufacturedate(new Timestamp(date.getTime()));
		}
		if(!gmrq.equals("")){
			Date date = DateFormat.getDateInstance().parse(gmrq);
			asset.setBuydate(new Timestamp(date.getTime()));
		}
		asset.setAssetname(name);
		if(!asset.getManufacturer().equals(""))
			asset.setManufacturer(mp);
		asset.setUsestate(Integer.valueOf(isuse));
		asset.setDeprecition(Integer.valueOf(isdep));
		ad.add(asset, typeid, did, uid);
		out.print("suc");
		return null;
	}
	
	public Assets getAsset() {
		return asset;
	}
	public void setAsset(Assets asset) {
		this.asset = asset;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getIsIE() {
		return isIE;
	}
	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}

	public String getIsuse() {
		return isuse;
	}

	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}

	public String getIsdep() {
		return isdep;
	}

	public void setIsdep(String isdep) {
		this.isdep = isdep;
	}

	public String getCcrq() {
		return ccrq;
	}

	public void setCcrq(String ccrq) {
		this.ccrq = ccrq;
	}

	public String getGmrq() {
		return gmrq;
	}

	public void setGmrq(String gmrq) {
		this.gmrq = gmrq;
	}
	
	
}
