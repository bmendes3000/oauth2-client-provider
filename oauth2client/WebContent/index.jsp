<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.multi.oauth2client.*" %>
<%@ page import="java.util.*" %>
<%
	HashMap<String,String> map = new HashMap<String, String>();
	map.put("client_id", Settings.CLIENT_ID);
	map.put("redirect_uri", Settings.REDIRECT_URI);
	map.put("response_type", "code");
	map.put("scope", Settings.SCOPE);
	map.put("state", OAuth2ClientUtil.generateRandomState());
	
	session.setAttribute("state", map.get("state"));
	
	String url = Settings.AUTHORIZE_URL + "?" + Settings.getParamString(map, false);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>oauth2provider test</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
Client ID : 6f82664b-7ae3-4352-8c58-c9fb176e7710<br>
Client Secret : 9893af00e6f517070cba05dff1ad73c94e458819<br>
Client Name : TestApp1<br>
Description : TestApp1<br>
Client Type : W<br>
Client URL : http://localhost:8080<br>
Redirect URI : http://localhost:8080/oauth2client/callback.jsp<br>
Scope : reademail,sendemail,readboard,personalinfo,calendar<br>

<a href="<%=url %>">Authorize!!</a>
</body>
</html>