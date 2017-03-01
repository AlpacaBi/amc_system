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


import entity.Bsend;

@Controller @Scope("prototype")
public class CreateBsendAction {
	private Bsend bsend;
	private int id;
	private int uid;
	private String sxrq;
	private int isIE;
	@Resource private AssetDao ad;
	
	public String create() throws IOException, ParseException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(sxrq.equals("") || uid == 0 || bsend.getCost().equals("")){
			out.print("empty");
			return null;
		}
		if(!sxrq.equals("")){
			Date date = DateFormat.getDateInstance().parse(sxrq);
			bsend.setBsenddate(new Timestamp(date.getTime()));
		}
		if(!bsend.getDescription().equals("")){
			String des;
			if(isIE == 1){
				des = new String(bsend.getDescription().getBytes("ISO-8859-1"),"gbk");
			}
			else{
				des = new String(bsend.getDescription().getBytes("ISO-8859-1"),"utf-8");
			}
			bsend.setDescription(des);
		}
		ad.bsend(id, bsend, uid);
		out.print("suc");
		return null;
	}

	public Bsend getBsend() {
		return bsend;
	}

	public void setBsend(Bsend bsend) {
		this.bsend = bsend;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getSxrq() {
		return sxrq;
	}

	public void setSxrq(String sxrq) {
		this.sxrq = sxrq;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
}
