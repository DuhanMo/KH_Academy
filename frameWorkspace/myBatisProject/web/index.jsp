<%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-10
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<%--
    * 프레임 워크
    - 개발자가 보다 편리한 환경에서 개발할 수 있도록 제공하는 툴, 뼈대라고 생각하자
    - 사전적 정의로는 '복잡한 문제를 해결하거나 서술하는 데 사용하는 기본 개념 구조'
    - 소프트웨어 개발의 입장으로 보면 공통으로 사용하는 라이브러리/개발도구/인터페이스 등등을 의미

    * 왜 프레임워크를 쓰는가
    - 웹 프로그래밍의 추세는 엄청난 규모의 프로젝트 들이 많다.
      거대하고 복잡도가 높은 프로젝트를 하기 위해서 많은 사람들이 필요하게 되고, 그 개발자들이 '통일성' 있게 '빠르고','안정적'으로
      개발하기 위해 프레임워크를 사용한다. --> 생산성 향상

      * 발생되는 프레임워크의 특징
      - 자유롭게 설계하고 코딩하는 것이 아니라 프레임워크가 제공하는 가이드 대로 설계하고 코딩을 하게된다.

      -> 개발자를 위한 다양한 도구들이 지원
      -> 개발할 수 있는 범위가 정해져있다.
      -> 개발자들이 따라야하는 가이드라인을 제공 --> 우리는 가이드라인대로 작업해야하고, 세팅해야한다.

      * 프레임워크의 장점
      - 개발시간을 줄일 수 잇다.
      - 오류로부터 자유로울 수 있음

      * 프레임워크의 단점
      - 프레임워크에 너무 의존하면 개발자들의 능력이 떨어져서 프레임워크 없이 개발이 힘듦

      * 프레임워크 종류
      - 영속성    : 데이터 관련한(CRUD) 기능들을 보다 편리하게 작업할 수 있도록 제공해주는 프레임워크 ex) myBatis
      - 자바     : 웹 애플리케이션에 초점을 마춰 필요한 요소들을 모듈화해서 제공해주는 프레임워크 ex) spring
      - 화면구현  : Front-End 를 보다 쉽게 구현할 수 있게 틀을 제공하는 프레임워크 ex)bootstrap
      - 기능및지원 : 특정 기능이나 업무 수행에 도움을 줄 수 있는 기능을 제공하는 프레임워크 ex) log4j , junit

      * 마이바티스 개요
       마이바티스는 개발자가 지정한 sql, 저장프로시저 그리고 몇가지 고급 매핑을 지원하는 영속성 프레임워크
       JDBC로 처리하는 부분의 코드와 파라미터 설정 및 결과 매핑을 대신해준다.
       DB 원시 타입과 Map인터페이스 그리고 자바의 POJO (순수 자바코드)를 설정해서 매핑하기 위해 XML과 어노테이션을 사용할 수 있다.

       기존에 Apache Project에서 ibatis를 운영하던 팀이
       2010년 5월9일 Google팀으로 이동하면서 mybatis로 이름을 바꿈
       기존의 ibatis의 한계점이었던 동적쿼리 및 어노테이션처리를 보강하여 더 나은 기능을 제공
       ibatis는 현재 비활성화 상태, 기존에 ibatis로 만들어진 애플리케이션의 지원을 위해 라이브러리만 제공되는 상태

      * ibatis vs mybatis
       1. ibatis는 jdk 1.4이상, mybatis는 jdk 1.5 이상 사용이 가능하다.
       2. 패키지 구조 변경
        - ibatis    : com.ibatis.*
        - mybatis   : org.apache.ibatis.*
       3. 사용 용어 변경
        - SqlMapConfig  -> Configuration
        - sqlMap        -> Mapper
        - resultClass   -> resultType
       4. 동적쿼리 지원
        - 쿼리문 작성 시 if, choose ,trim, foreach문을 지원한다.
       5. 자바 어노테이션 지원.
  --%>
  </body>
</html>
