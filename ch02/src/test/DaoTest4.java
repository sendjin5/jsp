package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.*;
import java.util.Scanner;

public class DaoTest4 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

//update member

    public static void main(String[] args) {
        DBC con = new MariaDBCon();
        conn = con.connect();
        if(conn !=null){
            System.out.println("DB 연결성공");
        }

        Scanner sc = new Scanner(System.in);
        System.out.println("변경할 회원 아이디");
        String id = sc.nextLine();
        System.out.println("변경(가점/점수)할 포인트 : ");
        int point = sc.nextInt();
        int cnt = 0;
        try {
            String sql = "update from member set point+? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, point);
            pstmt.setString(2, id);
            cnt = pstmt.executeUpdate();
            if(cnt>0){
                System.out.println("해당 회원의 포인트가 변경되었습니다.");

            }else {
                System.out.println("변경실패");
               }
                con.close(pstmt, conn);


            } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했다.");

        }

        }
    }


