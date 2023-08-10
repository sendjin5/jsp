package com.chunjae.test;
import com.chunjae.util.AES256;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

public class AES256test {
    public static void main(String[] args) throws NoSuchAlgorithmException, NoSuchPaddingException, UnsupportedEncodingException, IllegalBlockSizeException, InvalidKeySpecException, InvalidParameterSpecException, BadPaddingException, InvalidKeyException, InvalidAlgorithmParameterException {
        String oritext = "1234";
        String key = "%02x";

        System.out.println("원래 데이터 : " +oritext);
        System.out.println("MD5 : " + AES256.md5(oritext));
        System.out.println("SHA256 : " + AES256.sha256(oritext));
        String aes = AES256.encryptAES256(oritext, key);
        System.out.println("AES256 암호: " + AES256.encryptAES256(oritext, key));
        System.out.println("AES256 복호: " + AES256.decryptAES256(aes, key));
    }
}
