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
	//private String myApiKey = "kWAnYhK47E4KTOdcP1N3bg";
	private String apiKey = "kWAnYhK47E4KTOdcP1N3bg";
	@Override
	public String getPubTransInfo(Double lati, Double longi) {
		System.out.println("odsay컨트롤러,서비스인터페이스 타고 요청이 넘어와 수행");
		System.out.println("서비스 impl에서 로직 수행 전 파라미터 확인 : "+lati);
		System.out.println("서비스 impl에서 로직 수행 전 파라미터 확인 : "+longi);
		StringBuilder urlBuilder = new StringBuilder();
		String url = null;
		
		
	
			urlBuilder.append("https://api.odsay.com/v1/api/pointBusStation");
			/*
			urlBuilder.append("?"+URLEncoder.encode("lang", "UTF-8")+"=0");
			urlBuilder.append("&"+URLEncoder.encode("x", "UTF-8")+"="+URLEncoder.encode(longi.toString(), "UTF-8"));
			urlBuilder.append("&"+URLEncoder.encode("y", "UTF-8")+"="+URLEncoder.encode(lati.toString(),"UTF-8"));
			urlBuilder.append("&"+URLEncoder.encode("apiKey", "UTF-8")+"="+URLEncoder.encode(apiKey, "UTF-8"));
			*/
			urlBuilder.append("?lang=0");
			urlBuilder.append("&x="+lati);
			urlBuilder.append("&y="+longi);
			urlBuilder.append("&apiKey="+apiKey);
			url = urlBuilder.toString();
	
		//String url = null;
		/*
		 * try { //String apiKey = URLEncoder.encode(myApiKey, "UTF-8"); url =
		 * "https://api.odsay.com/v1/api/pointBusStation?lang=0&x="+longi+"&y="+lati+
		 * "&apiKey="+apiKey; } catch (UnsupportedEncodingException e) {
		 * e.printStackTrace(); }
		 */
		//String url = "https://api.odsay.com/v1/api/pointBusStation?lang=0&x="+longi+"&y="+lati+"&apiKey="+apiKey;
		//String url = "https://api.odsay.com/v1/api/pointBusStation?lang=0&x="+longi+"&y="+lati+"&apiKey=kWAnYhK47E4KTOdcP1N3bg";
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
