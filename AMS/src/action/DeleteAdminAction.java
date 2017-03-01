package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.AdminDao;
import entity.Admin;

@Controller @Scope("prototype")
public class DeleteAdminAction {
	private Integer id;
	@Resource private AdminDao ad;
	
	public String delete() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Admin adm = (Admin)ServletActionContext.getRequest().getSession().getAttribute("admin");
		if(adm.getPermission()!=0){
			return null;
		}
		ad.delete(id);
		out.print("success");
		return null;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
