package com.trendypeop.myapp;

import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import java.net.*;
import java.io.*;

public class WeatherInfo {
	public static void main(String[] args) throws Exception {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");         // 포맷 적용        String formatedNow = now.format(formatter);
		String formatedNow = now.format(formatter);
		//System.out.println(formatedNow);
        // API URL을 만듭니다.
        URL url = new URL("https://apihub.kma.go.kr/api/typ01/url/kma_sfcdd.php?tm=" + formatedNow + "&stn=90&help=0&dataType=JSON&authKey=rfjJrTMzQpK4ya0zM6KSpw");
        // HttpURLConnection 객체를 만들어 API를 호출합니다.
        HttpURLConnection con = (HttpURLConnection) url.openConnection(); 
        // 요청 방식을 GET으로 설정합니다.
        con.setRequestMethod("GET");
        // 요청 헤더를 설정합니다. 여기서는 Content-Type을 application/json으로 설정합니다.
        con.setRequestProperty("Content-Type", "application/json");
        
        // API의 응답을 읽기 위한 BufferedReader를 생성합니다.
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "euc-kr"));
        String inputLine;
        StringBuffer response = new StringBuffer();
        
        // 응답을 한 줄씩 읽어들이면서 StringBuffer에 추가합니다.
        while ((inputLine = in.readLine()) != null) {
        	if(inputLine.contains("#")) {
        		
        	}
        	else {
        		response.append(inputLine+"\n");
        	}
           
            
        }
        // BufferedReader를 닫습니다.
        in.close();

        // 응답을 출력합니다.
        
        
        //System.out.println(response.getClass()); 
        
        String newInput = response.toString();
        
        String[] weatherList = newInput.split(",");
        
       
        ArrayList<String> weatherFinal = new ArrayList<String>();
        weatherFinal.add(weatherList[11]);
        weatherFinal.add(weatherList[13]);
        System.out.println(weatherFinal.toString()); 
    }
}
