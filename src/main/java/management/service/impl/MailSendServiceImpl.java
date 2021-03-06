package management.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import management.dao.UserDao;
import management.service.MailSendService;
import management.service.UserService;

@Component
public class MailSendServiceImpl implements MailSendService {
  @Autowired
  JavaMailSender mailSender;
  @Autowired
  UserDao userDao;
  @Autowired
  UserService userService;

  public MailSendServiceImpl(UserDao userDao) {
    this.userDao = userDao;
  }

  // 이메일 난수 만드는 메서드
  private String init() {
    Random ran = new Random();
    StringBuffer sb = new StringBuffer();
    int num = 0;

    do {
      num = ran.nextInt(75) + 48;
      if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
        sb.append((char) num);
      } else {
        continue;
      }

    } while (sb.length() < size);
    if (lowerCheck) {
      return sb.toString().toLowerCase();
    }
    return sb.toString();
  }

  // 난수를 이용한 키 생성
  private boolean lowerCheck;
  private int size;


  @Override
  public String getKey(boolean lowerCheck, int size) {
    this.lowerCheck = lowerCheck;
    this.size = size;
    return init();
  }

  // 회원가입 발송 이메일(인증키 발송)
  @Override
  public void mailSendWithKey(String id, String name, String password,
      HttpServletRequest request) {
    String key = getKey(false, 15);

    Map<String, Object> params = new HashMap<>();
    params.put("id", id);
    params.put("key", key);
    if (userDao.alterKey(params) > 0) {
      MimeMessage mail = mailSender.createMimeMessage();
      String htmlStr = "<h2>안녕하세요. 진호사이트에 가입해주셔서 감사합니다!</h2><br><br>" + "<h3>" + name + "님</h3>"
          + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:8080"
          + request.getContextPath() + "/app/auth/keyalter?email=" + id + "&key=" + key
          + "&password=" + password + "'>인증하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
      try {
        mail.setSubject(String.format("[본인인증] 진호사이트: %s님의 인증메일입니다", name), "utf-8");
        mail.setText(htmlStr, "utf-8", "html");
        mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(id));
        mailSender.send(mail);
      } catch (MessagingException e) {
        e.printStackTrace();
      }
    }

  }

  @Override
  public int alterUserKey(String id, String key) {

    int resultCnt = 0;
    Map<String, Object> params = new HashMap<>();
    params.put("email", id);
    params.put("key", key);
    resultCnt = userDao.alterUserKey(params);

    return resultCnt;

  }

  @Override
  public void findPassword(String id) throws Exception {

    String password = getKey(true, 8);
    HashMap<String, Object> params = new HashMap<>();
    params.put("newPassword", password);
    params.put("id", id);
    userDao.updatePassword(params);
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = "<h2>BTS 계정의 임시 비밀번호가 발급되었습니다.</h2><br><br>" + "<h3>" + password
        + "</h3><br><p><a href='http://localhost:8080/management/app/auth/form'>BTS 바로가기</a><br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
    try {
      mail.setSubject("[본인인증] 지노사이트: 임시 비밀번호를 보내드립니다.", "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(id));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }

  }
}
