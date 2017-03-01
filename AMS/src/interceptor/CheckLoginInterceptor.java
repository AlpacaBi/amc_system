package interceptor;

import java.util.Map;

import org.springframework.stereotype.Controller;

import action.LoginAction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@Controller
public class CheckLoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		Object action = ai.getAction();
		if (action instanceof LoginAction) {
            return ai.invoke();
        }
		Map session = ai.getInvocationContext().getSession();
		Object admin = session.get("admin");
		if(admin != null){
			return ai.invoke();
		}
		else{
			return "login";
		}
	}
	
}
