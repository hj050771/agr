package com.cesgroup.agr.utils;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public abstract class HttpUtil {

	private static Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    public static String sendPostParams(String sendUrl,String params){
    	String result = "";
    	HttpURLConnection connection = null;
    	BufferedReader reader = null;
        try {
			URL postUrl = new URL(sendUrl);
			// 打开连接
			connection = (HttpURLConnection) postUrl.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
			connection.setRequestMethod("POST");
			connection.setConnectTimeout(30000);
    		connection.setReadTimeout(30000);
			connection.connect();
			try{
				DataOutputStream out = new DataOutputStream(connection.getOutputStream());
				out.write(params.getBytes("UTF-8"));
				out.flush();
				out.close(); // flush and close
			}catch(IOException e){
				logger.error("The method sendPostParams be executed, when post param error", e);
			}
			reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line = "";
			while ((line = reader.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			logger.error("Send post request error", e);
		}finally{
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					logger.debug(e.getMessage());
				}
			}
			if(connection != null){
				connection.disconnect();
			}
		}
        return result;
    }
    
    
    public static String sendGetParams(String sendUrl,String params){
    	String result = "";
    	HttpURLConnection connection = null;
    	BufferedReader reader = null;
        try {
			URL postUrl = new URL(sendUrl);
			// 打开连接
			connection = (HttpURLConnection) postUrl.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(30000);
    		connection.setReadTimeout(30000);
			connection.connect();
			if(!StringUtils.isEmpty(params)){
				try{
					DataOutputStream out = new DataOutputStream(connection.getOutputStream());
					out.write(params.getBytes("UTF-8")); 
					out.flush();
					out.close(); // flush and close
				}catch(IOException e){
					logger.error("The method sendPostParams be executed, when post param error", e);
				}
			}
			reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line = "";
			while ((line = reader.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			logger.error("Send post request error", e);
		}finally{
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					logger.debug(e.getMessage());
				}
			}
			if(connection != null){
				connection.disconnect();
			}
		}
        return result;
    }
    
    
    /**
     * 接口请求，参数为json格式
     */
    public static String sendJsonPost(String sendUrl,String params){
    	String result = "";
    	HttpURLConnection connection = null;
    	BufferedReader reader = null;
        try {
			URL postUrl = new URL(sendUrl);
			// 打开连接
			connection = (HttpURLConnection) postUrl.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("Content-Type", "application/json;charset=utf-8");
			connection.setRequestMethod("POST");
			connection.setConnectTimeout(30000);
    		connection.setReadTimeout(30000);
			connection.connect();
			try{
				DataOutputStream out = new DataOutputStream(connection.getOutputStream());
				out.write(params.getBytes("UTF-8")); 
				out.flush();
				out.close(); // flush and close
			}catch(IOException e){
				logger.error("The method sendPostParams be executed, when post param error", e);
			}
			reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line = "";
			while ((line = reader.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			logger.error("Send post request error", e);
		}finally{
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					logger.debug(e.getMessage());
				}
			}
			if(connection != null){
				connection.disconnect();
			}
		}
        return result;
    }
}