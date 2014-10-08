<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.multi.oauth2client.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.httpclient.*" %>
<%@ page import="org.apache.commons.httpclient.methods.*"%>
<%
	/*
	--Como utilizar o token
	1.  token(AccessTokenVO) Verificar as informacoes.
	2. token expires_in * 1000 + created_at < curretTimestamp sE
	3. refresh token call process token.
	4.   Do provider OAuth2Constant.USE_REFRESH_TOKEN true로 alter pattern:false)
	5. clients token?grant_type=refresh_token especificando pedido.
	6. Aqui sao mantidos refresh_token, client_id, client_secret, state send value.
	7. Deve ser programado para automaticamente remover o token não é atualizado há muito tempo.
	8. invalid token
	9. Deve retornar o token novamente ao client.
	*/
	if (session.getAttribute("access_token") == null)
		response.sendRedirect("index.jsp");

	AccessTokenVO tokenVO = (AccessTokenVO)session.getAttribute("access_token");
	String access_token = tokenVO.getAccess_token();
	HashMap<String, String> map = new HashMap<String,String>();
	map.put("output", "json");
	String url = Settings.PERSONAL_INFO_URL + "?" + Settings.getParamString(map, false);
	
	HttpClient client = new HttpClient();
	client.getParams().setContentCharset("utf-8");
	GetMethod method = new GetMethod(url);
	method.addRequestHeader("Authorization", "Bearer " + access_token);
	int status = client.executeMethod(method);
	String result = "";
	
	if (status == 200) {
		result = method.getResponseBodyAsString();	
	} else {
		result = method.getResponseBodyAsString();
	}
%><%=result %>