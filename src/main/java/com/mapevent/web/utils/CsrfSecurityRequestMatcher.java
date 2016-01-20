package com.mapevent.web.utils;

import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

public class CsrfSecurityRequestMatcher implements RequestMatcher {
    private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
    private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/ext/**", null);

    public boolean matches(HttpServletRequest httpServletRequest) {
        if(allowedMethods.matcher(httpServletRequest.getMethod()).matches()){
            return false;
        }
        return !unprotectedMatcher.matches(httpServletRequest);
    }
}
