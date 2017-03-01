package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.TypeDao;
import entity.Type;

@Controller @Scope("prototype")
public class CreateTypeAction {
	private Type type;
	private int isIE;
	@Resource private TypeDao td;
	
	public String create() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(type.getTypename().equals("")){
			out.print("empty");
			return null;
		}
		String name, des;
		if(isIE == 1){
			name = new String(type.getTypename().getBytes("ISO-8859-1"),"gbk");
			des = new String(type.getDescription().getBytes("ISO-8859-1"),"gbk");
		}
		else{
			name = new String(type.getTypename().getBytes("ISO-8859-1"),"utf-8");
			des = new String(type.getDescription().getBytes("ISO-8859-1"),"utf-8");
		}
		type.setTypename(name);
		type.setDescription(des);
		td.add(type);
		out.print("suc");
		return null;
	}
	
	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
	
}
