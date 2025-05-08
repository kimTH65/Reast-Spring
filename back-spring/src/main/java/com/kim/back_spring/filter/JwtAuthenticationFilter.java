package com.kim.back_spring.filter;

import java.io.IOException;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.kim.back_spring.provider.JwtProvider;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor 
public class JwtAuthenticationFilter extends OncePerRequestFilter{
    
    private final JwtProvider jwtProvider; // jwtProvider DI

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        try{
            String token = parseBearerToken(request);
            //token 확인
            if (token == null) {
                filterChain.doFilter(request, response);
                return;
            }
    
            String email = jwtProvider.validate(token);
            //token에서 email 확인
            if (email == null){
                filterChain.doFilter(request, response);
                return;
            }
    
            //사용자 정보를 가진 토큰 생성
            AbstractAuthenticationToken authenticationToken = 
                new UsernamePasswordAuthenticationToken(email, null,AuthorityUtils.NO_AUTHORITIES);
            //웹 인증 세부정보 설정
            authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            //Context에 등록
            SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
            securityContext.setAuthentication(authenticationToken);
    
            SecurityContextHolder.setContext(securityContext);
        } catch (Exception exception){
            exception.printStackTrace();
        }

        filterChain.doFilter(request, response);
    }

    //header authorization 확인 후 토큰 전달
    private String parseBearerToken(HttpServletRequest request){
        String authorization = request.getHeader("Authorization");

        boolean hasAuthorization = StringUtils.hasText(authorization);
        if (!hasAuthorization) return null;

        boolean isBearer = authorization.startsWith("Bearer ");
        if (!isBearer) return null;

        String token = authorization.substring(7);
        return token;
    }
    
}
