package com.scut.interceptor;

import com.scut.entity.*;
import org.springframework.web.servlet.*;

import javax.servlet.http.*;

/**
 * Created by pc on 2017/1/7.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        if(user==null){
            httpServletRequest.getRequestDispatcher("/login").forward(httpServletRequest,httpServletResponse);
            return false;
        }else{
            return true;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
