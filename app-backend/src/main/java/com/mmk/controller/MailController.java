package com.mmk.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mmk.dto.MailDTO;
import com.mmk.service.MailService;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/email")
public class MailController {
    
    private final MailService mailService;

    // 아이디 인증코드 발송
    @ResponseBody
    @PostMapping("/sendCode")
    public String emailCheck(@RequestBody MailDTO mailDTO) throws MessagingException, UnsupportedEncodingException {
        String email = mailDTO.getEmail();
        String authCode = mailService.sendCodeMessage(email);
        return authCode;
    }

    // 임시 비밀번호 발송
    @ResponseBody
    @PostMapping("/sendTempPwd")
    public void sendTempPwd(@RequestBody MailDTO mailDTO) throws MessagingException, UnsupportedEncodingException {
        String email = mailDTO.getEmail();
        String tempPwd = mailDTO.getTempPwd();
        System.out.println(email + " " + tempPwd);
        mailService.sendTempPwd(email, tempPwd);
    }
    
}
