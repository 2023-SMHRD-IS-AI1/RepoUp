package com.trendypeop.myapp;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;





public class DataLAb {
	@SuppressWarnings("null")
	public static void data_main() {
		Map<String, Double> ratioData = new HashMap<String, Double>();
		
		
		
		String data1 = "패딩";
		String data2 = "원피스";
		String data3 = "코트";
		String data4 = "티셔츠";
		String data5 = "재킷";
		String data6 = "트위트자켓";
		String data7 = "여성코트";
		String data8 = "숏패딩";
		String data9 = "니트원피스";
		String data10 = "톰보이코트";
		
        String clientId = "2wfu86SPC0J9dFdG2iJq"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "Yv305cvfq_"; // 애플리케이션 클라이언트 시크릿

        String apiUrl = "https://openapi.naver.com/v1/datalab/search";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        requestHeaders.put("Content-Type", "application/json");

//        String requestBody = String.format("{\"startDate\":\"2023-12-12\"," +
//                "\"endDate\":\"2023-12-12\"," + 
//                "\"timeUnit\":\"date\"," +
//                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," + 
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," + 
//                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
//                "\"device\":\"pc\"," +
//                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
//                "\"gender\":\"f\"}", data1, data1, data2, data2, data3, data3, 
//                						data4, data4, data5, data5);
        
        String requestBody = makeQuery(data1, data2, data3, data4);
        String responseBody = post(apiUrl, requestHeaders, requestBody);
       
        ratioData = makeMap(responseBody, ratioData);
        
        requestBody = makeQuery(data1, data5, data6, data7);
        responseBody = post(apiUrl, requestHeaders, requestBody);
        
        ratioData = makeMap(responseBody, ratioData);
        
        requestBody = makeQuery(data1, data8, data9, data10);
        responseBody = post(apiUrl, requestHeaders, requestBody);
        
        ratioData = makeMap(responseBody, ratioData);
       
        System.out.println(ratioData.toString());
//        JSONParser parser = new JSONParser();
//        try {
//			Object obj = parser.parse(responseBody);
//			JSONObject jsonObject = (JSONObject) obj;
//			
//			JSONArray resultsArray = (JSONArray) jsonObject.get("results");
//			System.out.println(resultsArray);
//			Map<String, Double> ratioData = new HashMap<String, Double>();
//			for (Object result : resultsArray) {
//	               JSONObject resultObject = (JSONObject) result;
//	               String title = (String) resultObject.get("title");
//
//	                // "data" 배열에 접근
//	               JSONArray dataArray = (JSONArray) resultObject.get("data");
//	                
//	                // 각 데이터에 대한 정보 출력a
//	               for (Object data : dataArray) {
//	                   JSONObject dataObject = (JSONObject) data;
//	                   Object ratio = dataObject.get("ratio");
//	                   if(ratio.getClass().getName().equals("java.lang.Long")) {
//	                	   ratio = Double.valueOf(dataObject.get("ratio").toString());
//	                   }
//  
//	                   System.out.println("비율: " + ratio);
//	                   ratioData.put(title, (Double) ratio);
//	               }         
//			}
//			System.out.println(ratioData.toString());
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
    }
	
	private static String makeQuery(String data1, String data2, String data3, String data4) {
		
		return String.format("{\"startDate\":\"2023-12-12\"," +
                "\"endDate\":\"2023-12-12\"," + 
                "\"timeUnit\":\"date\"," +
                "\"keywordGroups\":[{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}," +             
                "{\"groupName\":\"%s\"," + "\"keywords\":[\"%s\"]}]," +
                "\"device\":\"pc\"," +
                "\"ages\":[\"3\",\"4\",\"5\",\"6\"]," +
                "\"gender\":\"f\"}", data1, data1, data2, data2, data3, data3, 
                						data4, data4);
	}
	
	private static Map<String, Double> makeMap(String responseBody, Map<String, Double> ratioData) {
		JSONParser parser = new JSONParser();
        try {
			Object obj = parser.parse(responseBody);
			JSONObject jsonObject = (JSONObject) obj;
			
			JSONArray resultsArray = (JSONArray) jsonObject.get("results");
			
			for (Object result : resultsArray) {
	               JSONObject resultObject = (JSONObject) result;
	               String title = (String) resultObject.get("title");

	                // "data" 배열에 접근
	               JSONArray dataArray = (JSONArray) resultObject.get("data");
	                
	                // 각 데이터에 대한 정보 출력a
	               for (Object data : dataArray) {
	                   JSONObject dataObject = (JSONObject) data;
	                   Object ratio = dataObject.get("ratio");
	                   if(ratio.getClass().getName().equals("java.lang.Long")) {
	                	   ratio = Double.valueOf(dataObject.get("ratio").toString());
	                   }
	                   ratioData.put(title, (Double) ratio);
	               }         
			}
			
			return ratioData;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
        
        
	}
    private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(requestBody.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
        }
    }

    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
