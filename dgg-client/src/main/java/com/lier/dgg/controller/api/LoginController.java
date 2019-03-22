package com.lier.dgg.controller.api;

import com.lier.dgg.util.SMSUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author  MAO
 */
@Controller
@RequestMapping("/login")
public class LoginController {

/*test*/
    public static void main(String[] args){
        System.out.println("001");
    }

    /**
    * 获取验证码
    * */
    @RequestMapping("getVerificationCode")
    @ResponseBody
    public String getVerificationCode(String phoneNum,HttpServletRequest req){


        //調用短信接口發送验证码
        try {
            return SMSUtils.SendSMS(phoneNum,"短信签名", "SMS_******",req);
        } catch (Exception e) {
            return "error";
        }


    }

    /**
     * 验证码匹配登录
     *
     * */
    @RequestMapping("/verificationLogin")
    @ResponseBody
    public String verificationLogin( String code,String phoneNum,HttpServletRequest req){
        //
        String verificationCode=(String)req.getSession().getAttribute(phoneNum);
        //验证码判断
        if(code.equals(verificationCode)){

        }else{

        }
       return "";
    }
}
