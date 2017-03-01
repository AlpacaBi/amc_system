package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import entity.User;
import util.HibernateUtil;

@Controller @Scope("prototype")
public class GetName {
	@Resource private HibernateUtil hu;
	
	public String get() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User u = (User)hu.get(User.class, 1);
		response.setCharacterEncoding("utf-8");
		out.print("<li>部门:"+u.getDepartment().getDpname()+"</li>");
		return null;
	}
}
