package com.sterling.model;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailSend {


	
		//SMTP Server
		private static final String SMTP_SERVER = "bh-ht-3.webhostbox.net";
		
		//SMTP Server Port Number
		private static final int SMTP_PORT = 465;
		
		//SMTP Login
		private static final String LOGIN = "webmaster@sterlinginstitute.in";
		
		//SMTP password
		private static final String PASSWORD = "$terling@1234";
		
		private static Properties props = new Properties();
		
		static{
			
			props.put("mail.transport.protocol", "smtps");
			props.put("mail.smtps.host",SMTP_SERVER);
			props.put("mail.smtps.port", SMTP_PORT);
			props.put("mail.smtps.auth", "true");	
		}
		
		private static String from = "webmaster@sterlinginstitute.in";
		
		public static void sendEmail(String toemail,String name) throws Exception{
			
			String subject = "Register";
			String msg = "  your are Sussfully Register";
			String m = "Hello  ";
			msg = m.concat(name).concat(msg);
			
			//Load the configuration
			Session session = Session.getDefaultInstance(props);
			
			//to create message by mimeMessage Class
			MimeMessage message = new MimeMessage(session);
			
			//Call Setter Methods and set the Properties
			message.setFrom(new InternetAddress(from));
			
			//Recipient add
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toemail));
			
			//add subject & msg
			message.setSubject(subject);
			message.setText(msg);
			
			Transport transport = session.getTransport();
			transport.connect(SMTP_SERVER, SMTP_PORT,LOGIN,PASSWORD);
			
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			transport.close();
		}
		

}
