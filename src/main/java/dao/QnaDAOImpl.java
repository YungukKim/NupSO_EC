package dao;

import util.DbUtil;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class QnaDAOImpl implements QnaDAO {
    private Properties proFiles = new Properties();

    public QnaDAOImpl() {
        InputStream in = QnaDAOImpl.class.getClassLoader().getResourceAsStream("dbQuery.properties");
        try {
            proFiles.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertQues(int furnitureSeq, String question,int state,String name, String password) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = proFiles.getProperty("query.insertQna");
        int result;

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, furnitureSeq);
            ps.setString(2, question);
            ps.setInt(3, state);
            ps.setString(4, name);
            ps.setString(5, password);
            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public int deleteQues(int qnaSeq) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = proFiles.getProperty("query.deleteQna");
        int result;

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, qnaSeq);
            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }
}