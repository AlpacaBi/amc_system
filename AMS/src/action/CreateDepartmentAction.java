package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.DepartmentDao;
import entity.Department;

@Controller @Scope("prototype")
public class CreateDepartmentAction {
	private Department dp;
	private int isIE;
	@Resource private DepartmentDao dd;
	
	public String create() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(dp.getDpname().equals("")){
			out.print("empty");
	    	return null;
		}
		String name, des;
		if(isIE == 1){
			name = new String(dp.getDpname().getBytes("ISO-8859-1"),"gbk");
			des = new String(dp.getDescription().getBytes("ISO-8859-1"),"gbk");
		}
		else{
			name = new String(dp.getDpname().getBytes("ISO-8859-1"),"utf-8");
			des = new String(dp.getDescription().getBytes("ISO-8859-1"),"utf-8");
		}
		dp.setDpname(name);
		dp.setDescription(des);
		dd.add(dp);
		out.print("suc");
		return null;
	}
	
	public Department getDp() {
		return dp;
	}
	public void setDp(Department dp) {
		this.dp = dp;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
	
}
