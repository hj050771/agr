package com.cesgroup.agr.util;

import com.cesgroup.agr.entity.SecretKey;
import com.cesgroup.agr.service.SecretKeyService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.TreeMap;

@Component
public class SignUtil {

    /**验证过期*/
    public static final int EXPIRED = 2;

    /**验证通过*/
    public static final int PASS = 1;

    /**验证未通过*/
    public static final int FAILURE = 0;


    public static int hashIterations = 1024;

    @Autowired
    private SecretKeyService secretKeyService;

    public static void main(String[] args) {
        SignUtil signUtil = new SignUtil();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        StringBuilder sb = new StringBuilder();
        sb.append("13b229b91c114a729e2c76d7e984a37d");
        //.append(sdf.format(new Date()))
        System.out.println(signUtil.md5(sb.toString()));
        System.out.println(signUtil.sign(sb.toString()));
        //secretKey:21a474348fe064209c35f7ae8bcf9155
        //sign:1e6886039030ee67df6bae4b3526c465
        //epName:潍坊创生生物工程有限公司
        TreeMap<String, String> params = new TreeMap<>();
        params.put("epName", "潍坊创生生物工程有限公司");
        //signUtil.sign("21a474348fe064209c35f7ae8bcf9155",params);
        try {
//            boolean b = signUtil.verifySign("21a474348fe064209c35f7ae8bcf9155","1e6886039030ee67df6bae4b3526c465");
//            System.out.println(b);
        } catch (Exception e) {

        }
    }

    /**
     * @description: MD5加密
     */
    public static String md5(String string) {
        byte[] hash;
        try {
            hash = MessageDigest.getInstance("MD5").digest(string.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 is unsupported", e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MessageDigest不支持MD5Util", e);
        }
        StringBuilder hex = new StringBuilder(hash.length * 2);
        for (byte b : hash) {
            if ((b & 0xFF) < 0x10) hex.append("0");
            hex.append(Integer.toHexString(b & 0xFF));
        }
        return hex.toString();
    }

    /**
     * @description: 生成签名
     * @param: 私钥
     */
    public static String sign(String priKey) {
        SimpleHash hash = new SimpleHash("MD5", priKey, null, hashIterations);
        return hash.toHex();
    }

    /**
     * @description: 验证签名
     * @param: 用户传入的签名字符串
     * @param：公钥
     */
    public int verifySign(String signStr, String pubKey) {
        if(secretKeyService.isExpired(pubKey)){
            return EXPIRED;
        }
        SecretKey secretKey = new SecretKey();
        secretKey.setPubKey(pubKey);
        secretKey = secretKeyService.select(secretKey);
        if (secretKey == null || StringUtils.isEmpty(secretKey.getPriKey()) || !sign(secretKey.getPriKey()).equals(signStr)) {
            return FAILURE;
        }
        return PASS;
    }

    /**
     * @description: 生产公钥
     */
    public static String genPubKey(String string) {
        //byte[] salt = Digests.generateSalt(4);
        //SimpleHash hash = new SimpleHash("SHA-1", string, salt, hashIterations);
        //return hash.toHex();
        return null;
    }

    /**
     * @description: 生成私钥
     */
    public static String genPrikey(String string) {
        return md5(string);
    }
}
