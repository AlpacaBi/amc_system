package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.PersonDao;
import entity.Admin;

@Controller @Scope("prototype")
public class ChangePassAction {
	private String old;
	private String newp;
	private String rep;
	@Resource private PersonDao cpd;
	
	public String change() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Admin admin = (Admin)session.getAttribute("admin");
		if(!old.equals(admin.getPassword())){
			out.print("wrong");
			return null;
		}
		if(!newp.equals(rep)){
			out.print("same");
			return null;
		}
		if(newp.length()<6){
			out.print("length");
			return null;
		}
		admin.setPassword(newp);
		cpd.update(admin);
		session.setAttribute("admin", admin);
		out.print("yes");
		return null;
	}
	
	public String getOld() {
		return old;
	}
	public void setOld(String old) {
		this.old = old;
	}
	public String getNewp() {
		return newp;
	}
	public void setNewp(String newp) {
		this.newp = newp;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	
	
}
