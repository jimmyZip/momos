package com.jimmyzip.momos.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;

@Service
public class NaverApiServiceImpl implements NaverApiService{

	@Override
	public String coordSearch(String addr) {
		System.out.println("주소로 좌표검색 요청이 서비스impl로 넘어와서 수행");
		System.out.println("서비스 impl에서 로직 수행 전 address확인 : "+addr);
		
		String url=null;
		try {
			String address = URLEncoder.encode(addr, "UTF-8");
			System.out.println("address가 encoding 잘 되었나 : "+address);
			url = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+address;//요청 url을 encodeURIComponent로 인코딩
			//url = URLEncoder.encode("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+address+"", "UTF-8");
			System.out.println("address가 합쳐진 url확인 : "+url);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String ncpClientId = "pg5xr50eua";
		String clientSecret = "x65EBiXdYRur5OmgKMUbRo5OskVgIV8Er2p5keOH";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		//header에 clientId와 clientSecret 주입
		request.addHeader("X-NCP-APIGW-API-KEY-ID", ncpClientId);
		request.addHeader("X-NCP-APIGW-API-KEY", clientSecret);
		System.out.println("serviceImpl에서 확인한 request : "+request);
		
		StringBuilder html = new StringBuilder();
		
		try {
			HttpResponse response = client.execute(request);
			//BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent(),"UTF-8"));
			BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			//BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			//BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			String current = "";
			while((current=reader.readLine())!=null) {
				html.append(current);
				//html.append(URLDecoder.decode(current, "UTF-8"));
			}
			reader.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return html.toString();
	}
	
}
