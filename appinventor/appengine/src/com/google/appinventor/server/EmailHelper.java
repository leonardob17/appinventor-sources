
package com.google.appinventor.server;

import com.google.appinventor.server.flags.Flag;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;
import org.json.JSONArray;

public final class EmailHelper {
    private static final Logger LOG = Logger.getLogger(LoginServlet.class.getName());

  	private static final Flag<String> sendGridKey = Flag.createFlag("sendgrid.key", "");
  	private static final Flag<String> noreplyEmail = Flag.createFlag("email.no-reply", "vpn-conexum-daniel@ufrgs.br");

  	private static final String apiURL = "https://api.sendgrid.com/v3/mail/send";

  	public static void EmailHelper() { }

    public void sendEmail(String toEmail, String subject, String message)
    {
        JSONObject data = new JSONObject();
        JSONArray personalizations = new JSONArray();
        JSONObject from = new JSONObject();
        JSONObject to = new JSONObject();
        JSONArray content = new JSONArray();

        from.put("email", noreplyEmail.get());

        to.put("to", new JSONArray().put(new JSONObject().put("email", toEmail)));
        personalizations.put(to);
        content.put(new JSONObject().put("type", "text/plain").put("value", message));

        data.put("subject", subject);
        data.put("from", from);
        data.put("personalizations", personalizations);
        data.put("content", content);

        String jsonData = data.toString();
        HttpPost httpPost = this.createConnectivity();
        this.executeReq( jsonData, httpPost);
    }

    HttpPost createConnectivity()
    {
        HttpPost post = new HttpPost(apiURL);
        String authHeader = "Bearer " + sendGridKey.get();
        post.setHeader("Authorization", authHeader);
        post.setHeader("Content-Type", "application/json");
        return post;
    }

    void executeReq(String jsonData, HttpPost httpPost)
    {
        try{
            executeHttpRequest(jsonData, httpPost);
        }
        catch (UnsupportedEncodingException e){
            LOG.info("error while encoding api url : "+e);
        }
        catch (IOException e){
            LOG.info("ioException occured while sending http request : "+e);
        }
        catch(Exception e){
            LOG.info("exception occured while sending http request : "+e);
        }
        finally{
            // httpPost.releaseConnection();
        }
    }

    void executeHttpRequest(String jsonData,  HttpPost httpPost)  throws UnsupportedEncodingException, IOException
    {
        HttpResponse response = null;
        String line = "";
        StringBuffer result = new StringBuffer();
        httpPost.setEntity(new StringEntity(jsonData));
        HttpClient client = HttpClientBuilder.create().build();
        response = client.execute(httpPost);
        // LOG.info("Request string : " + httpPost.toString() );
        // LOG.info("Post parameters : " + jsonData );
        // LOG.info("Response Code : " +response.getStatusLine().getStatusCode());
        BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        while ((line = reader.readLine()) != null){ result.append(line); }
        // LOG.info(result.toString());
    }
}