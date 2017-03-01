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

import dao.UserDao;

@Controller @Scope("prototype")
public class SearchUserAction {
	private String type;
	private String value;
	private String did;
	private int isIE;
	@Resource private UserDao ud;
	
	@SuppressWarnings("unchecked")
	public String search() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(value == null || type.length() > 1 || value.equals("")){
			out.print("empty");
			return null;
		}
		if(isIE == 1)
			value = new String(value.getBytes("ISO-8859-1"),"gbk");
		else
			value = new String(value.getBytes("ISO-8859-1"),"utf-8");
		if(Integer.valueOf(type)==1){
			List list = ud.searchByName(value, did);
			JSONArray json = JSONArray.fromObject(list);
			out.print(json.toString());
			return null;
		}
		if(Integer.valueOf(type)==2){
			List list = ud.searchByEmail(value, did);
			JSONArray json = JSONArray.fromObject(list);
			out.print(json.toString());
			return null;
		}
		return null;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
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
