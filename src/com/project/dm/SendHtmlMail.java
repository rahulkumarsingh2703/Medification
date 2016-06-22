package com.project.dm;

import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  
import java.util.Random;
import javax.activation.*;

  
public class SendHtmlMail{  
	
		 
	    private static final String CHAR_LIST =
	        "abcdefghijklmnopqrstuvwxyz1234567890";
	    private static final int RANDOM_STRING_LENGTH = 6;
	     
	    /**
	     * This method generates random string
	     * @return
	     */
	    public String generateRandomString(){
	         
	        StringBuffer randStr = new StringBuffer();
	        for(int i=0; i<RANDOM_STRING_LENGTH; i++){
	            int number = getRandomNumber();
	            char ch = CHAR_LIST.charAt(number);
	            randStr.append(ch);
	        }
	        return randStr.toString();
	    }
	     
	   
	    private int getRandomNumber() {
	        int randomInt = 0;
	        Random randomGenerator = new Random();
	        randomInt = randomGenerator.nextInt(CHAR_LIST.length());
	        if (randomInt - 1 == -1) {
	            return randomInt;
	        } else {
	            return randomInt - 1;
	        }
	    }

public static void mail(String s,String p)
{
	 
	
  
  String host="smtp.gmail.com";  
  final String user="projectmedification";//change accordingly  
  final String password="projmedi";//change accordingly  
    
  String to=s;//change accordingly  
  
   //Get the session object  
   Properties props1 = new Properties();  
   props1.put("mail.smtp.host",host);  
   props1.put("mail.smtp.starttls.enable", "true");
   props1.put("mail.smtp.auth", "true");  
   props1.put("mail.smtp.port", "587");
   props1.put("mail.smtp.ssl.trust", "smtp.gmail.com");
     
   Session session = Session.getDefaultInstance(props1,  
    new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
  
   //Compose the message  
    try {  
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("Medification: Password");  
     //message.setText("This is simple program of sending email using JavaMail API");  
    
     message.setText("Your password is: "+p);  
     
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
   
     } catch (MessagingException e) {e.printStackTrace();}  
    
}
    public static void main(String[] args) {
    	

    	SendHtmlMail z= new SendHtmlMail();
        String ps=z.generateRandomString();
        String ss="pratik.chintu99@gmail.com";
    	SendHtmlMail.mail(ss,ps);
    
 }  
}  