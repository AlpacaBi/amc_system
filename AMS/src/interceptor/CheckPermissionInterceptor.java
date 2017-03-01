package interceptor;

import java.util.Map;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import entity.Admin;

@Controller
public class CheckPermissionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		Map session = ai.getInvocationContext().getSession();
		if(session.get("admin") == null)
			return "login";
		Admin admin = (Admin)session.get("admin");
		if(admin.getPermission() == 0){
			return ai.invoke();
		}
		else{
			return "permission";
		}
	}
	
}
