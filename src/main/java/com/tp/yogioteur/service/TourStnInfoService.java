package com.tp.yogioteur.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.scheduling.annotation.Scheduled;

public class TourStnInfoService implements OpenAPIService {

	private String date;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String serviceKey = "Gg6aU7XS52H2mzg7fE0rsB6EskbUYaEGIq+cUukglRDit4bDX4sXDnbnUXBXRmGgh+VLkmq6M8hF/4f7eANimQ==";
		
		// API 주소
		StringBuilder sb = new StringBuilder();
		try {
			sb.append("http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst");
			sb.append("?serviceKey=").append(URLEncoder.encode(serviceKey, "UTF-8"));
			sb.append("&numOfRows=").append(URLEncoder.encode("33", "UTF-8"));
			sb.append("&pageNo=").append(URLEncoder.encode("12", "UTF-8"));
			sb.append("&CURRENT_DATE=").append(URLEncoder.encode(date, "UTF-8"));
			sb.append("&HOUR=").append(URLEncoder.encode("12", "UTF-8"));
			sb.append("&COURSE_ID=").append(URLEncoder.encode("392", "UTF-8"));
			sb.append("&dataType=").append(URLEncoder.encode("JSON", "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
				
		String apiURL = sb.toString();	

		// API 주소 연결
		URL url = null;
		HttpURLConnection con = null;
		try {
			url = new URL(apiURL);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		} catch (MalformedURLException e) {
			e.printStackTrace();  // apiURL이 잘못되었다.
		} catch (IOException e) {
			e.printStackTrace();  // API 연결이 실패하였다.
		}
		
		BufferedReader br = null;
		StringBuilder sb2 = new StringBuilder();
		try {
			if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			// json 읽어 들이기
			String line = null;
			while((line = br.readLine()) != null) {
				sb2.append(line);
			}
			// 스트림, 연결 종료
			if(br != null) {
				br.close();
			}
			if(con != null) {
				con.disconnect();
			}
		} catch (IOException e) {
			e.printStackTrace();  // API 응답이 실패하였다.
		}
		JSONObject obj = new JSONObject(sb2.toString());
		JSONObject items = obj.getJSONObject("response").getJSONObject("body").getJSONObject("items");
		JSONArray item = items.getJSONArray("item");
		int length = item.length();
		
		// 원하는 지점의 날씨정보만 추출
		List<JSONObject> list = new ArrayList<>();
		for(int i = 0; i < length; i++) {
			String spotName = item.getJSONObject(i).getString("spotName");
			String thema = item.getJSONObject(i).getString("thema");
			if((spotName.equals("(서귀포)성산일출봉") == true ||
					spotName.equals("(서귀포)섭지코지") == true ||
						spotName.equals("(서귀포)천지연폭포") == true) && thema.equals("자연/힐링"))  {
				list.add(item.getJSONObject(i));
			}
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(list.toString());
		out.flush();
		out.close();
	}
	
	// API 시간 갱신
	@Override
	@Scheduled(cron = "0 0 6 1/1 * *") //매일 새벽 6시 동작
	public void setDate() {
		
		LocalDateTime now = LocalDateTime.now();
		
		// 시간을 06시로 고정
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd06");
		String date = dtf.format(now);
		
		this.date = date;
	}
	
}