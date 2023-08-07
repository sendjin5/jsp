package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoTest1 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        DBC con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("DB 연결성공");
        }

        try {
            String sql = "select * from member";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            List<Member> memlist = new ArrayList<>();
            while(rs.next()){
                Member mem = new Member();
                mem.setId(rs.getString("id"));
                mem.setPw(rs.getString("pw"));
                mem.setName(rs.getString("name"));
                mem.setEmail(rs.getString("email"));
                mem.setTel(rs.getString("tel"));
                mem.setPoint(rs.getInt("point"));
                memlist.add(mem);
            }
            for(Member m:memlist){
                System.out.println(m.toString());
            }

        } catch (SQLException e) {
            System.out.println("SQP이 구동이 안됩니다.");
            
        }finally{
            con.close(rs, pstmt, conn);
        }
    }
}


