package com.fse.user.captcha;

import com.captcha.botdetect.web.servlet.SimpleCaptcha;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CaptchaFilter extends OncePerRequestFilter {

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        SimpleCaptcha captcha = SimpleCaptcha.load(request, "userSecurityCaptcha");

        if (request.getParameter("type") != null) {
            if (request.getParameter("type").equals("loginForm")) {
                if (request.getParameter("captchaCode") != null) {
                    String captchaCode = request.getParameter("captchaCode");
                    boolean isHuman = captcha.validate(captchaCode);

                    if (!isHuman) {
                        // Do something if captcha invalidate.
                        String contextPath = ((HttpServletRequest) request).getContextPath();
                        response.sendRedirect(contextPath + "/login?wrongcaptcha="+captchaCode);
                        return;
                    }
                }
            }
        }
        System.out.println(request.getRequestURL());
        chain.doFilter(request, response);
    }
}