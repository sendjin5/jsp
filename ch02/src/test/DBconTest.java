package test;

import java.sql.*;

public class DBconTest {
    public static void main(String[] args) {
        final String DRIVER = "org.mariadb.jdbc.Driver";    //클래스 이름
        final String DNS = "localhost";
        final String PORT = "3306";
        final String NAME = "edu";
        final String USER = "root";
        final String PASS = "1234";

        //final String URL = "프로토콜:디비종류://호스트주소:포트번호/DB이름";
        //final String URL = "jdbc:mariadb://localhost:3306/edu"; 수정될 것은 염두해 따로따로
        final String URL = "jdbc:mariadb://" + DNS + ":" + PORT + "/" + NAME;
        /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
        Connection conn = null;     //전원 케이블 : 연결자
        PreparedStatement pstmt = null;   //점등이 들어왔는지
        ResultSet rs = null;       //컵 그릇

        try {
            Class.forName(DRIVER);          //드라이버 로딩
            conn = DriverManager.getConnection(URL, USER, PASS);  //DB 연결
            if (conn != null) {
                System.out.println("DB연결 성공");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버가 로딩되지 않습니다.");
        } catch (SQLException e) {
            System.out.println("DB 접속실패");
            throw new RuntimeException(e);
        }

        try {
            String sql = "select * from member where id=?";
            String id = "admin1";

            pstmt = conn.prepareStatement(sql);     //sql 구문 대입
            pstmt.setString(1, id);     //sql 구문 조건 대입
            rs = pstmt.executeQuery();  //sql 실행하여 결과셋 저장
            while (rs.next()) {
                System.out.println("아이디: " + rs.getString("id"));
                System.out.println("비밀번호: " + rs.getString("pw"));
                System.out.println("이름: " + rs.getString("name"));
                System.out.println("가입일 " + rs.getString("regdate"));
                System.out.println("포인트: " + rs.getInt("point"));

            }
        } catch (Exception e) {
            System.out.println("sql 구문에 오류가 있어 실행불가");
            e.printStackTrace();

        } finally {
            if(rs!=null){
                try{
                    rs.close();
                    pstmt.close();
                    conn.close();
                    if(pstmt.isClosed()) System.out.println("pstmt closed");
                } catch (SQLException e) {
                    System.out.println("DB 작업을 종료하지 못했다.");
                    throw new RuntimeException(e);
                }
            }
            }
        }
    }
