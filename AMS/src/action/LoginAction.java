package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.LoginDao;
import entity.Admin;

@Controller @Scope("prototype")
public class LoginAction {
	private Admin admin;
	@Resource private LoginDao ld;
	
	public String login() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Admin a = ld.login(admin);
		if(a != null){
			session.setAttribute("lasttime", a.getLasttime());
			session.setAttribute("admin", a);
			ld.update(a);
			if(a.getPermission() == 0)
				session.setAttribute("manageadmin", "<li><a href=\"adminsetting.jsp\">管理员设置</a></li>");
			out.print("yes");
			return null;
		}
		else{
			out.print("no");
			return null;
		}
	}
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
}
