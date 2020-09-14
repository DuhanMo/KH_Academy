package com.kh.common;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class Template {

    public static SqlSession getSqlSession() {
        // SqlSession 객체를 반환하기 위한 변수 선언
        SqlSession session = null;

        // JDBCTemplate에서 public static Connection getConnection()과 같은 개념의 메소드
        // driver,sql 접속시에 필요한 정보를 properties파일을 불러와서 이 메소드 안에서 DBMS와 연결을 했었다.

        // mybatis-config.xml파일을 통해서 driver, sql 접속 관련한 정보들을 가져와서 SqlSession객체 생성할것.

        // 현재 클래스 패스와 다른 위치에 있는 자원을 로드하는 것을 좀 더 쉽게 해주는
        // 마이바티스 라이브러리에서 제공하는 util성 클래스인
        // Resources라는 클래스를 가지고 파일을 불러올 것이다.
        InputStream stream;
        try{
            stream = Resources.getResourceAsStream("/mybatis-config.xml");
            // SqlSession을 만들기 위해서 SqlSessionFactory에서 openSession이라는 것을 해줘야 하는데
            // SqlSessionFactory는 SqlSessionFactoryBuilder라는 클래스의 build()를 통해서 생성해준다.
            // openSession(false)의 의미는 자동 커밋을 하지 않게 설정하는 것
            session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
        }catch (IOException e){
            e.printStackTrace();


        }
        return session;
    }
}
