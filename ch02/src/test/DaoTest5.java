package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class DaoTest5 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

//delete member

    public static void main(String[] args) {
        DBC con = new MariaDBCon();
        conn = con.connect();
        if(conn !=null){
            System.out.println("DB 연결성공");
        }

        Scanner sc = new Scanner(System.in);
        System.out.println("삭제할 회원 아이디");
        String id = sc.nextLine();
        int cnt = 0;
        try {
            String sql = "delete from member where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            cnt = pstmt.executeUpdate();
            if(cnt>0){
                System.out.println("삭제 성공");

            }else {
                System.out.println("삭제 실패");
               }
                con.close(pstmt, conn);

            } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했다.");

        }

        }
    }


