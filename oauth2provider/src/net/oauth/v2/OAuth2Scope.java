package net.oauth.v2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

public class OAuth2Scope {

	public static final String SCOPE_PERSONAL_INFO = "personalinfo";
	public static final String SCOPE_READ_EMAIL = "reademail";
	public static final String SCOPE_SEND_EMAIL = "sendemail";
	public static final String SCOPE_WRITE_BOARD = "writeboard";
	public static final String SCOPE_READ_BOARD = "readboard";
	public static final String SCOPE_CALENDAR = "calendar";

	private static HashMap<String, String> scopeUrlMap;
	public static TreeMap<String,String> scopeMsgMap;
	
	static {
		scopeUrlMap = new HashMap<String, String>();
		scopeMsgMap = new TreeMap<String, String>();
		
		scopeUrlMap.put("GET /resource/myinfo.do", SCOPE_PERSONAL_INFO);
		scopeUrlMap.put("GET /resource2/boardlist.do", SCOPE_READ_BOARD);

		scopeMsgMap.put(SCOPE_READ_EMAIL, "Ler Email.");
		scopeMsgMap.put(SCOPE_SEND_EMAIL, "Enviar Email.");
		scopeMsgMap.put(SCOPE_WRITE_BOARD, "Escrita Mural.");
		scopeMsgMap.put(SCOPE_READ_BOARD, "°Leitura Mural.");
		scopeMsgMap.put(SCOPE_PERSONAL_INFO, "Informações Pessoais.");
		scopeMsgMap.put(SCOPE_CALENDAR, "Calendario.");

	}
	
	public static String getScopeFromURI(String uri) {
		return scopeUrlMap.get(uri);
	}

	public static String getScopeMsg(String scopeKey) {
		return scopeMsgMap.get(scopeKey);
	}
	
	public static boolean isScopeExistInMap(String strScope) {
		boolean isValid = true;
		String[] scopes = strScope.split(",");
		for (int i=0; i < scopes.length; i++) {
			String v = getScopeMsg(scopes[i]);
			if (v == null) {
				isValid = false; break;
			}
		}
		
		return isValid;
	}
	
	public static boolean isScopeValid(String receivedScope, String registeredClientScope) {
		String rscopes[] = receivedScope.split(",");
		String temp[] = registeredClientScope.split(",");
		
		List<String> sscopes = Arrays.asList(temp);
		//System.out.println(sscopes);
		boolean isValid = true;
		for (int i=0; i < rscopes.length; i++) {
			if (sscopes.contains(rscopes[i]) == false) {
				isValid = false;
				break;
			}
		}
		return isValid;
	}

	public static boolean isUriScopeValid(String uriScope, String tokenScopes) {
		String temp[] = tokenScopes.split(",");
		List<String> sscopes = Arrays.asList(temp);
		if (sscopes.contains(uriScope))
			return true;
		else
			return false;
	}
}
