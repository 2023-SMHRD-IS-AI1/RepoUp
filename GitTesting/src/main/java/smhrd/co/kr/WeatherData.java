package smhrd.co.kr;

import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import java.net.*;
import java.io.*;

public class WeatherData {

	public static void main(String[] args) throws Exception {
		HttpSession request;
        // API URL을 만듭니다.
        URL url = new URL("https://apihub.kma.go.kr/api/typ01/url/fct_shrt_reg.php?tmfc=0&authKey=rfjJrTMzQpK4ya0zM6KSpw");
        // HttpURLConnection 객체를 만들어 API를 호출합니다.
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        // 요청 방식을 GET으로 설정합니다.
        con.setRequestMethod("GET");
        // 요청 헤더를 설정합니다. 여기서는 Content-Type을 application/json으로 설정합니다.
        con.setRequestProperty("Content-Type", "application/json");

        // API의 응답을 읽기 위한 BufferedReader를 생성합니다.
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        // 응답을 한 줄씩 읽어들이면서 StringBuffer에 추가합니다.
        while ((inputLine = in.readLine()) != null) {
        	byte[] bytes = inputLine.getBytes();
        	String enString = new String(bytes, "UTF-8");
        	System.out.println(enString.toString());
        	//System.out.println(enString);
            response.append(inputLine+"\n");
            
        }
        // BufferedReader를 닫습니다.
        in.close();

        // 응답을 출력합니다.
        
//        System.out.println(response.toString()); 
//        System.out.println(response.getClass().getName()); 

    }

}
