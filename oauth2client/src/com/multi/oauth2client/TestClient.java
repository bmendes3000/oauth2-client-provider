package com.multi.oauth2client;

import java.util.HashMap;

public class TestClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("a", "1");
		map.put("name", "TestApp1");
		map.put("tel", "010-222-3333");
		map.put("client_id", "178dede9-775d-47e0-bf3d-e07df6ae617a");
		map.put("client_secret", "6fbcacc9ffe451854cf067a4dd5d5f0f8ca48abc");
		
		System.out.println(Settings.getParamString(map, true)); 
	}

}
