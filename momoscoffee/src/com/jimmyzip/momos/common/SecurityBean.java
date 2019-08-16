package com.jimmyzip.momos.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

/**
 	데이터베이스에 비밀번호 넣을 때 일반 텍스트가 아닌
 	보안 목적상 암호화된 데이터로 넣는 용도
 	일반 텍스트를 해시값(16진수 값)으로 변환해 반환하는 메서드 정의
 * */
@Component
public class SecurityBean {
	public String textToHash(String password) {
		StringBuilder sb = new StringBuilder();
		try {
			//사용할 알고리즘을 선택한다. :: 224,256,384,512....
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());//hash화 시킬 데이터를 바이트화
			//암호화 바이트 반환받기, 일반 바이트 배열을 암호화시켜 암호화된 데이터로 반환
			byte[] data = md.digest();
			//바이트라 배열로 사용하기에 무리가 있으므로 스트링화
			for(int i=0;i<data.length;i++) {
				sb.append(Integer.toString((data[i]&0xff)+0x100,16).substring(1));
			}
			System.out.println("생성된 암호의 길이 : "+sb.toString().length());
			System.out.println("생성된 암호는 : "+sb.toString());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
