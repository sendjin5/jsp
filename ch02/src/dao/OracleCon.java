package dao;

import java.sql.*;

public class OracleCon implements DBC {
    final String DRIVER = "org.Oracle.jdbc.Driver"; //클래스이름
    final String DNS = "localhost";
    final String PORT = "1521";
    final String NAME = "shop";
    final String USER = "root";
    final String PASS = "1234";
    final String URL = "jdbc:oracle://"+DNS+":"+PORT+"/"+NAME;

    Connection conn = null;

    @Override
    public Connection connect() {
        try {
            Class.forName(DRIVER);
            try {
                conn = DriverManager.getConnection(URL, USER, PASS);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    @Override
    public void close(PreparedStatement pstmt, Connection conn) {
        if(pstmt!=null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(pstmt!=null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
