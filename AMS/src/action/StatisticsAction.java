package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.AssetDao;

@Controller @Scope("prototype")
public class StatisticsAction {
	private String t1;
	private String t2;
	private String type;
	@Resource private AssetDao ad;
	
	@SuppressWarnings("unchecked")
	public String search() throws IOException, ParseException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(t1.equals("") || t2.equals("") || type.equals("undefined")){
			out.print("empty");
			return null;
		}
		Date date1 = DateFormat.getDateInstance().parse(t1);
		Timestamp time1 = new Timestamp(date1.getTime());
		Date date2 = DateFormat.getDateInstance().parse(t2);
		Timestamp time2 = new Timestamp(date2.getTime());
		List list = null;
		if(type.equals("1")){
			list = ad.searchNewAssets(time1, time2);
		}
		if(type.equals("2")){
			list = ad.searchBsendAssets(time1, time2);
		}
		JSONArray json = JSONArray.fromObject(list);
		out.print(json.toString());
		return null;
	}

	public String getT1() {
		return t1;
	}
	public void setT1(String t1) {
		this.t1 = t1;
	}
	public String getT2() {
		return t2;
	}
	public void setT2(String t2) {
		this.t2 = t2;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
