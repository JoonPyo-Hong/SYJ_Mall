package com.test.SYJ_Mall.sockets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
    @Autowired
    private EchoHandler echoHandler;
 
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(echoHandler, "/sockets/echos").setAllowedOrigins("*")
    	.withSockJS()
        .setClientLibraryUrl(
          "https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js")
        .setInterceptors(new HttpSessionHandshakeInterceptor());
    	
    	
    	//registry.addHandler(echoHandler, "/sockets/echos").setAllowedOrigins("*").withSockJS();
      //registry.addHandler(echoHandler,"/echos")
    	//.setAllowedOrigins("http://byeanma.kro.kr:9089")
    	
    }
    
    
    
    
}

