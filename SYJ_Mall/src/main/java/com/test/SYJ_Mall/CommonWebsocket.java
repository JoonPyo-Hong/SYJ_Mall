package com.test.SYJ_Mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value="/qrecho.action")
public class CommonWebsocket {
	
	public static final List<Session> sessionLists = new ArrayList<Session>();
	public static final Map<String,String> guidLists = new HashMap<String,String>();
	
	private static final Logger logger = LoggerFactory.getLogger(CommonWebsocket.class);
	
	//소켓통신 객체만 생성
	public CommonWebsocket() {
		// TODO Auto-generated constructor stub
		System.out.println("QR 관련 웹소켓(서버) 객체생성");
	}
	
	//소켓통신 직접 연결
	@OnOpen
	public void onOpen(Session session) {
		
		//System.out.println("session id : " + session.getId());
		logger.info("Open session id:" + session.getId());
		
		try {
			final Basic basic = session.getBasicRemote();
			String uuid = UUID.randomUUID().toString();//uuid 생성
			guidLists.put(uuid, session.getId());//uuid 가 key의 역할을 수행
			
			basic.sendText("gen,"+uuid);
			sessionLists.add(session);//새로운 세션 등록
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}	
	}
	
	
	
	
	/*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	//String sender = message.split(",")[1];//보내준 사람 객체.
    	//message = message.split(",")[0];//해당 사람이 보낸 문자.
    	
    	
    	//System.out.println(session.getId());
    	//System.out.println("message : " + message);
    	//System.out.println("message : " + message);
    	
    	
        //logger.info("Message From " + sender + ": "+message);
        
        try {
            final Basic basic = session.getBasicRemote();
            basic.sendText("pass," + message);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        
        sendAllSessionToMessage(session,message);
    }
    
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String message) {
    	
        try {
            for(Session session : CommonWebsocket.sessionLists) {
                if(self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText("message : " + message);
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
	
	
	//에러처리
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println(e.getCause());
	}
	
	//소켓 닫기
	@OnClose
	public void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		guidLists.remove(session.getId());
		sessionLists.remove(session);
		System.out.println(sessionLists.size());
	} 
	
}
