package com.chunjae.test;

import com.chunjae.util.SHA256;

import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class SHA256test {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        String pwd = "1234";
        String crypwd = SHA256.encrypt(pwd);
        System.out.println("입력된 비밀번호 : "+pwd);
        System.out.println("암호화 된 비밀번호 : "+crypwd);
        System.out.println("암호화 된 비밀번호 글자수 : "+crypwd.length());

        Scanner sc = new Scanner(System.in);
        System.out.println("입력할 번호 : ");
        String inpwd = sc.nextLine();
        String incrypwd = SHA256.encrypt(inpwd);
        if(incrypwd.equals(crypwd)){
            System.out.println("일치합니다.");
        } else {
            System.out.println("불일치 합니다.");
        }
    }
}
