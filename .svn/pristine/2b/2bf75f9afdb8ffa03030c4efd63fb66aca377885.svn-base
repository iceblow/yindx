package com.dianxin.common;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class HttpRequest {
	
	/**
     * post 获取 rest 资源
     * 
     * @param url
     * @param name_value_pair
     * @return
	 * @throws ClientProtocolException 
     * @throws IOException
     */
    public static String do_post(String url, List<NameValuePair> name_value_pair) throws ClientProtocolException, IOException  {
        String body = null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpPost httpost = new HttpPost(url);
            httpost.setEntity(new UrlEncodedFormEntity(name_value_pair, StandardCharsets.UTF_8));
            HttpResponse response = httpclient.execute(httpost);
            HttpEntity entity = response.getEntity();
            body = EntityUtils.toString(entity);
        } finally {
            httpclient.close();
        }
        return body;
    }

    /**
     * get 获取 rest 资源
     * 
     * @param url
     * @return
     * @throws IOException
     */
    public static String do_get(String url) throws IOException {
        String body = null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpGet httpget = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpget);
            HttpEntity entity = response.getEntity();
            body = EntityUtils.toString(entity);
        } finally {
            httpclient.close();
        }
        return body;
    }
}
