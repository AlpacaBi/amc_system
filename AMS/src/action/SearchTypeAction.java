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

import dao.TypeDao;

@Controller @Scope("prototype")
public class SearchTypeAction {
	private String value;
	private int isIE;
	@Resource private TypeDao td;
	
	@SuppressWarnings("unchecked")
	public String search() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(!value.equals("")||value!=null){
			if(isIE == 1)
				value = new String(value.getBytes("ISO-8859-1"),"gbk");
			else
				value = new String(value.getBytes("ISO-8859-1"),"utf-8");
		}
		List list = td.search(value);
		JSONArray json = JSONArray.fromObject(list);
		out.print(json.toString());
		return null;
	}
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
}
