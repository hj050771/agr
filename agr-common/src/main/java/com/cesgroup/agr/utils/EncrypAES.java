package com.cesgroup.agr.utils;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class EncrypAES {

    public static final String UTF_8 = "UTF-8";
    private static final String KEY_ALGORITHM = "AES";
    private static final String DEFAULT_CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";//默认的加密算法
    private final static Logger LOGGER = LoggerFactory.getLogger(EncrypAES.class);

    /**
     * AES 加密操作
     *
     * @param content 待加密内容
     * @param encodeRules 加密密码
     * @return 返回Base64转码后的加密数据
     */
    public static String encrypt(String content, String encodeRules) {
        try {
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);// 创建密码器

            byte[] byteContent = content.getBytes(UTF_8);

            cipher.init(Cipher.ENCRYPT_MODE, getSecretKey(encodeRules));// 初始化为加密模式的密码器

            byte[] result = cipher.doFinal(byteContent);// 加密

            return Base64.encodeBase64String(result);//通过Base64转码返回
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    /**
     * AES 解密操作
     *
     * @param content
     * @param encodeRules
     * @return
     */
    public static String decrypt(String content, String encodeRules) throws Exception {
            //实例化
            Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);

            //使用密钥初始化，设置为解密模式
            cipher.init(Cipher.DECRYPT_MODE, getSecretKey(encodeRules));

            //LOGGER.info("执行解码1："+ new String(base64Decoder.decodeBuffer(content), UTF_8));

            //执行操作
            byte[] result = cipher.doFinal(Base64.decodeBase64(content));

            LOGGER.info("执行解码："+ new String(result, UTF_8));

            return new String(result, "utf-8");

    }

    /**
     * 生成加密秘钥
     *
     * @return
     */
    private static SecretKeySpec getSecretKey(final String encodeRules) {
        //返回生成指定算法密钥生成器的 KeyGenerator 对象
        KeyGenerator kg = null;

        try {
            kg = KeyGenerator.getInstance(KEY_ALGORITHM);
            //不加这个linux环境下会随机生成算法
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            random.setSeed(encodeRules.getBytes());
            //AES 要求密钥长度为 128
            kg.init(128, random);

            //生成一个密钥
            SecretKey secretKey = kg.generateKey();

            return new SecretKeySpec(secretKey.getEncoded(), KEY_ALGORITHM);// 转换为AES专用密钥
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        try{
            String s = "hello,您好";
            System.out.println("s:" + s);

            String s1 = EncrypAES.encrypt(s, "1234");
            System.out.println("s1:" + s1);

            System.out.println("s2:"+EncrypAES.decrypt(s1, "1234"));
        }catch (Exception ex){
            ex.printStackTrace();
        }

        /*Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        System.out.println(cal.getTimeInMillis());
        cal.add(Calendar.HOUR_OF_DAY,1);
        System.out.println(cal.getTimeInMillis());
        System.out.println(Calendar.getInstance().getTimeInMillis());*/
    }
}
