package com.jimmyzip.momos.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ODsayPubTransServiceImpl implements ODsayPubTransService{
	//private String myApiKey = "";
	private String apiKey = "";
	@Override
	public String getPubTransInfo(Double lati, Double longi) {
		System.out.println("서비스 impl에서 로직 수행 전 파라미터 확인 : "+lati);
		System.out.println("서비스 impl에서 로직 수행 전 파라미터 확인 : "+longi);
		StringBuilder urlBuilder = new StringBuilder();
		String url = null;
		urlBuilder.append("https://api.odsay.com/v1/api/pointBusStation");
		urlBuilder.append("?lang=0");
		urlBuilder.append("&x="+lati);
		urlBuilder.append("&y="+longi);
		urlBuilder.append("&apiKey="+apiKey);
		url = urlBuilder.toString();
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		StringBuilder html = new StringBuilder();
		try {
			HttpResponse response = client.execute(request);
			BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			String current="";
			while((current=reader.readLine())!=null) {
				html.append(current);
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
