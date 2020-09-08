<%@ page import="com.kh.model.vo.Person" %><%--
  Created by IntelliJ IDEA.
  User: moduhan
  Date: 2020-09-08
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> EL 연산</h2>
<h3> 산술 연산</h3>
10 더하기 5 = ${10 + 5} <br>
10 빼기 5 = ${10 - 5} <br>
10 곱하기 5 = ${10 * 5} <br>
10 나누기 5 = ${10 / 5} 또는 ${10 div 5} <br>
10 나누기 7의 나머지 = ${10%7} 또는 ${10 mod 7}<br>
<hr>
<h3> 객체 비교 연산</h3>
<%--
    String sOne = "안녕";
    String sTwo = new String("안녕");

    Person pOne = new Person("홍길동", 20, '남');
    Person pTwo = new Person("홍길동", 20, '남');

    // pageScope
    pageContext.setAttribute("sOne", sOne);
    pageContext.setAttribute("sTwo", sTwo);
    pageContext.setAttribute("pOne", pOne);
    pageContext.setAttribute("pTwo", pTwo);
--%>
<div style="border: solid 1px black;">
    * sOne == sTwo <br>
    ${ sOne == sTwo } 또는 ${sOne eq sTwo} <br>
    El 에서의 == 은 equals() 와 같은 역할을 한다.
    <br><br>
    * sOne != sTwo <br>
    ${ sOne != sTwo} 또는 ${ sOne ne sTwo} <br>


    <br><br><br>
    * pOne == pTwo <br>
    ${ pOne == pTwo } 또는 ${pOne eq pTwo} <br>

    $ pOne !- pTwo<br>
    ${ pOne != pTwo} 또는 ${pOne ne pTwo} <br>

</div>
<hr>
<h4>숫자형 자동 형변환</h4>
표현식 : <%= (int) request.getAttribute("big") + (int) request.getAttribute("small")%><br>
EL : ${big + small}
<!-- EL 은 scope에 속성을 자동으로 인식해서 형변환 후 연산을 처리한다.-->
<h4> 대소비교 </h4>
big &gt; small : ${ big > small} 또는 ${big gt small } <br> <!-- greater than -->
big &lt; small : ${ big < small} 또는 ${big lt small } <br> <!-- greater than -->
big &gt;= small : ${ big >= small} 또는 ${big ge small } <br> <!-- greater equal -->
big &lt;= small : ${ big <= small} 또는 ${big le small } <br> <!-- less equal -->

<hr>
<h4>논리연산자/부정연산자</h4>
\${true && false} 또는 \${true and false} <br>
${true && false} 또는 ${true and false} <br><br>
\${true || false} 또는 \${true or false} <br>
${true || false} 또는 ${true or false} <br><br>
\${!(big < small)} <br>
${!(big<small)}<br><br>

<hr>
<h4>객체 null인지 또는 비어있는지 체크</h4>
${empty p}<br>
${!empty p}<br>

${empty list} <br>
${!empty list} <br>
</body>
</html>
