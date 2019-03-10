package com.roo.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class HttpCommonUtil {
	
	/**
	 * @des	  Post公共请求方法
	 * @param url 请求地址
	 * @param encoding	请求编码
	 * @param param	请求参数
	 * @param connTime	连接时间
	 * @param overTime	超时时间
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	public static String sendPostMethod(String url, String encoding, String param,int connTime, int overTime) throws Exception {
		String result = "";
		BasicHttpParams httpParams = new BasicHttpParams();
		HttpConnectionParams.setConnectionTimeout(httpParams,connTime);  
	    HttpConnectionParams.setSoTimeout(httpParams,overTime);  
	    DefaultHttpClient client = new DefaultHttpClient(httpParams);
		HttpPost post = new HttpPost(url);

		StringEntity stringEntity = new StringEntity(param, encoding);
		post.setEntity(stringEntity);
		try {
			HttpResponse response = client.execute(post);
			if (200 == response.getStatusLine().getStatusCode()) {
				result = EntityUtils.toString(response.getEntity(), encoding);
			} else {
				throw new Exception("响应失败！" + response.toString());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;		
	}

	
	/*public static String sendPostMethod(String reqUrl, String encoding, String param,int connTime, int overTime) throws IOException {
		JsonObject respJson = null;
		User user;
		
		URL url = new URL(reqUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		
		connection.setRequestMethod("POST");//设置请求方式
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("Content-Type", "application/json");
        
        connection.connect();
        
        Gson gson=new GsonBuilder().create();      
        
        InputStream is = connection.getInputStream();
        InputStreamReader r=new InputStreamReader(is,"utf-8");
        BufferedReader br=new BufferedReader(r);
        
        StringBuilder sb = new  StringBuilder();
        String line = br.readLine();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        
        user = gson.fromJson(String.valueOf(sb), User.class);
        
        br.close();
        r.close();
        is.close();
        connection.disconnect();
        
		return String.valueOf(sb);
	}*/
}
