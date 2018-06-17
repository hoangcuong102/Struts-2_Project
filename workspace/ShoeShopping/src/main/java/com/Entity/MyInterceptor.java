package com.Entity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class MyInterceptor extends ActionSupport implements Interceptor, StrutsStatics {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2112792066290617978L;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		final ActionContext context = ai.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
		HttpSession session = request.getSession(true);
		User u = (User) session.getAttribute("LoginUser");
		if(u == null) {
			ServletActionContext.getRequest().getSession().setAttribute("errorMess", "You need to login first");
			return ERROR;
		}else {
			return ai.invoke();
		}
	}

}
