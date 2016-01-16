package com.mapevent.web.service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

public class Utils {
    public static boolean SendMessage(String to, String theme, String textMsg){
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

        Properties props = System.getProperties();
        props.setProperty("mail.smtps.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtps.auth", "true");

        props.put("mail.smtps.quitwait", "false");

        Session session = Session.getInstance(props, null);

        final MimeMessage msg = new MimeMessage(session);

        try {
            msg.setFrom(new InternetAddress(""));

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

//            if (map.get("reg_email")[0].length() > 0) {
//                msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(map.get("reg_email")[0], false));
//            }

            msg.setSubject("reg confirm");
            msg.setText(textMsg, "utf-8");
            msg.setSentDate(new Date());

            Transport t = (Transport) session.getTransport("smtps");

            t.connect("smtp.gmail.com", "moscalevd@gmail.com", "");
            t.sendMessage(msg, msg.getAllRecipients());
            t.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
