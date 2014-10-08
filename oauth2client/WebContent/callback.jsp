<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.multi.oauth2client.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.httpclient.*"%>
<%@ page import="org.apache.commons.httpclient.methods.*"%>
<%
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String prevState = (String)session.getAttribute("state");
	
	String result = "";
	System.out.println(state + " , " + prevState);
	if (!state.equals(prevState)) {
		result = "CSRF(Cross Site Request Forgery";
	} else {

		HashMap<String, String> map = new HashMap<String,String>();
		map.put("client_id", Settings.CLIENT_ID);
		map.put("client_secret", Settings.CLIENT_KEY);
		map.put("redirect_uri", Settings.REDIRECT_URI);
		map.put("grant_type", "authorization_code");
		map.put("code", code);
		map.put("state", OAuth2ClientUtil.generateRandomState());
		
		HttpClient client = new HttpClient();
		client.getParams().setContentCharset("utf-8");
		
		//POST clientsecret
		//String url = Settings.ACCES_TOKEN_URL;
		//PostMethod method = new PostMethod(url);
		//method.addParameter("client_id", map.get("client_id"));
		//method.addParameter("client_secret", map.get("client_secret"));
		//method.addParameter("redirect_uri", map.get("redirect_uri"));
		//method.addParameter("grant_type", map.get("grant_type"));
		//method.addParameter("code", map.get("code"));
		
		//GET client_id, client_secret Header Basic .
		String url = Settings.ACCES_TOKEN_URL + "?" + Settings.getParamString(map, true);
		GetMethod method = new GetMethod(url);
		String authHeader  = OAuth2ClientUtil.generateBasicAuthHeaderString(
				Settings.CLIENT_ID, Settings.CLIENT_KEY);
		method.addRequestHeader("Authorization", authHeader);
		
		int status = client.executeMethod(method);
		
		if (status == 200) {
			String body = method.getResponseBodyAsString();
			System.out.println(body);
			AccessTokenVO token = OAuth2ClientUtil.getObjectFromJSON(body, AccessTokenVO.class);
			if (token.getState() == null || !token.getState().equals(map.get("state"))) {
				System.out.println("@@@ state ");
			}
			session.setAttribute("access_token", token);
			response.sendRedirect("main.jsp");
		} else {
			result = "Falha na autenticação";
		}
	}
%>
<%=result %>
