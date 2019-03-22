package com.lier.dgg.util;


import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import javax.servlet.http.HttpServletRequest;

//参数名称必须为String PhoneNumbers , String SignName(短信签名),String TemplateCode (短信模板码)
    public class SMSUtils {
    /**

     * signNam:短信签名名称
     * * AccessKeyId:主账号AccessKey的ID
     * accessKeySecret:主账号accessKeySecret
     * templateCode:短信模板ID
     * */
    static  String signNam= "";
    static  String accessKeyId="";
    static  String accessSecret="";
    static  String templateCode="";


    public static String SendSMS(String PhoneNumbers, String SignName, String TemplateCode, HttpServletRequest req) throws Exception {
        // 设置超时时间-可自行调整
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        // 初始化ascClient需要的几个参数
        final String product = "Dysmsapi";// 短信API产品名称（短信产品名固定，无需修改）
        final String domain = "dysmsapi.aliyuncs.com";// 短信API产品域名（接口地址固定，无需修改）
        // 替换成你的AK
        final String accessKeyId = "";// 你的accessKeyId,参考本文档步骤2
        final String accessKeySecret = "";// 你的accessKeySecret，参考本文档步骤2
        // 初始化ascClient,暂时不支持多region
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product,
                domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        // 组装请求对象
        SendSmsRequest request = new SendSmsRequest();
        // 使用post提交
        request.setMethod(MethodType.POST);
        // 必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
        request.setPhoneNumbers(PhoneNumbers);
        // 必填:短信签名-可在短信控制台中找到
        request.setSignName(SignName);
        // 必填:短信模板-可在短信控制台中找到
        request.setTemplateCode(TemplateCode);
        //request.setTemplateCode("SMS_116580423");
        // 可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        // 友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        //随机生成一个六位的数字验证码
        int random = (int) ((Math.random() * 9 + 1) * 100000);
        request.setTemplateParam("{\"code\":\"" + random + "\"}");
        //将手机号和验证码放在session域中
        req.getSession().setAttribute(PhoneNumbers, random);
        req.getSession().setMaxInactiveInterval(900);
        // 可选-上行短信扩展码(无特殊需求用户请忽略此字段)
        // request.setSmsUpExtendCode("90997");
        // 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");
        //请求失败这里会抛ClientException异常
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
            //请求成功
            return "success";
        } else {
            //请求失败
            return "error";
        }
    }

    public static void SendSMSnew(String phoneNum,HttpServletRequest req) {
            /**
             *
             *
             * AccessKeyId:主账号AccessKey的ID
             * Action:SendSms
             * accessKeySecret
             * TemplateParam:短信模板变量对应的实际值
             * */
            DefaultProfile profile = DefaultProfile.getProfile("default", accessKeyId, accessSecret);
            IAcsClient client = new DefaultAcsClient(profile);

            CommonRequest request = new CommonRequest();
            //request.setProtocol(ProtocolType.HTTPS);
            request.setMethod(MethodType.POST);
            request.setDomain("dysmsapi.aliyuncs.com");
            request.setVersion("2017-05-25");
            request.setAction("SendSms");
            //接收短信的手机号码
            request.putQueryParameter("PhoneNumbers", phoneNum);
            //短信签名名称
            request.putQueryParameter("SignName", signNam);
            //短信模板ID
            request.putQueryParameter("TemplateCode", templateCode);
            //随机生成一个四位的数字验证码
            int random = (int) ((Math.random() * 9 + 1) * 1000);
            request.putQueryParameter("TemplateParam", ""+random);
            try {
                CommonResponse response = client.getCommonResponse(request);
                System.out.println(response.getData());
            } catch (ServerException e) {
                e.printStackTrace();
            } catch (ClientException e) {
                e.printStackTrace();
            }
        }


}

