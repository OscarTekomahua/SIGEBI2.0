package mx.edu.utez.sigebi.utils;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EnviarCorreo {

    final private String de = "20223tn042@utez.edu.mx";
    final private String pass = "2022_2024TeK013";

    public EnviarCorreo(){
    }

    public void enviarCorreo (String correoDestino, String asunto, String mensaje) {

        Properties props =  new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(de, pass);
            }
        };

        Session session = Session.getInstance(props,auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(de));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correoDestino));
            message.setSubject(asunto);
            message.setText(mensaje);

            // Enviar el correo
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException("Error al enviar el correo electrónico: " + e.getMessage());
        }

    }
}
