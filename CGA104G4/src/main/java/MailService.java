
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	
	// �]�w�ǰe�l��:�ܦ��H�H��Email�H�c,Email�D��,Email���e
	public void sendMail(String to, String subject, String messageText) {
			
	   try {
		   // �]�w�ϥ�SSL�s�u�� Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

       // ���]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
       // ��1) �n�J�A��Gmail��: 
       // ��2) �I��i�޲z�A�� Google �b��j
       // ��3) �I�索�����i�w���ʡj
       
       // ��4) �����i��B�J���ҡj���Ҧ��n�D�p�U:
       //     ��4-1) (�Цۦ�̷ӨB�J�n�D�ާ@��.....)
       
       // ��5) �����i���ε{���K�X�j���Ҧ��n�D�p�U:
       //     ��5-1) �U�Ԧ����i������ε{���j--> ����i�l��j
       //     ��5-2) �U�Ԧ����i����˸m�j--> ����iWindows �q���j
       //     ��5-3) �̫���i���͡j�K�X
	     final String myGmail = "nicolexu0115@gmail.com";
	     final String myGmail_password = "tgrtiicoewajnrjv";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		  
		   //�]�w�H�����D��  
		   message.setSubject(subject);
		   //�]�w�H�������e 
		   message.setText(messageText);

		   Transport.send(message);
		   System.out.println("�ǰe���\!");
     }catch (MessagingException e){
	     System.out.println("�ǰe����!");
	     e.printStackTrace();
     }
   }
	
	 public static void main (String args[]){

      String to = "nicolexu0115@gmail.com";
      
      String subject = "�K�X�q��";
      
      String ch_name = "sylvia";
      String passRandom = "password";
      String messageText = "�ٶ�! " + ch_name + " ���԰O���K�X: " + passRandom + "\n" +" (�w�g�ҥ�)"; 
       
      MailService mailService = new MailService();
      mailService.sendMail(to, subject, messageText);

   }


}
