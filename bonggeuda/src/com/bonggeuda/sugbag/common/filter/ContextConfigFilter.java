package com.bonggeuda.sugbag.common.filter;

import java.io.IOException;
import java.nio.file.FileSystemLoopException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.bonggeuda.sugbag.common.config.ConfigLocation;

/**
 * Servlet Filter implementation class ContextConfigFilter
 */
@WebFilter("/*")
public class ContextConfigFilter implements Filter {


    public ContextConfigFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		/* DB접속 설정 정보 파일의 경로 정보가 비어있는 경우에만 초기화 해준다.*/
		if(ConfigLocation.CONNECTION_CONFIG_LOCATION == null) {
			String root = request.getServletContext().getRealPath("/");
			String connectionInfoPath = request.getServletContext().getInitParameter("connection-info");
			
			System.out.println("DB접속경로 설정 완료");
			System.out.println(root + connectionInfoPath);
			
			ConfigLocation.CONNECTION_CONFIG_LOCATION = root + "/" + connectionInfoPath;
		}
		
		/* DAO에서 필요한 mapper.xml 가져오기 */
		if(ConfigLocation.MAPPER_LOCATION == null) {
			String root = request.getServletContext().getRealPath("/");
			String mapperLocation = request.getServletContext().getInitParameter("mapper-location");
			
			System.out.println("매퍼 경로 설정완료");
			System.out.println(root + mapperLocation);
			ConfigLocation.MAPPER_LOCATION = root + "/" + mapperLocation;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
