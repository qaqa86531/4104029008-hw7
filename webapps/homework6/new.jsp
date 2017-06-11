<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029008" />
  <jsp:setProperty property="user" name="database" value="4104029008" />
  <jsp:setProperty property="password" name="database" value="Ss4104029008!" />
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 try{
   database.connectDB();
   String sql = "select * from member;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>註冊</title>
    <link rel="stylesheet" href="style2.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  </head>
  <body>
    <div class="Registro">
        <h1>註冊</h1>
        <div id="error_message" style="color:yellow;">
        </div>
        <form action="member.jsp" method="post" >
          <input name="account" type="text" placeholder="帳號" onblur="checkDuplicateAcct()" />
          <br>
          <input name="password" id="password" type="password" placeholder="密碼" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
          <br>
          <input name="name" type="text" placeholder="姓名" autocomplete="off"/>
          <br>
          <input name="birth" type="text" placeholder="生日" autocomplete="off"/>
          <br>
          <input name="email" type="text" placeholder="電子郵件" autocomplete="off"/>
          <br>
          <input name="phone" type="text" placeholder="電話號碼" autocomplete="off"/>
          <br>
          <div style="text-align:center !important">
            <input type="submit" id="regis" value="提交"/>
          </div>

        </form>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        function checkDuplicateAcct() {
            var accountVal = $('input[name=account]').val();
            $.get('check.jsp', {
                    acct: accountVal
                },
                function(data) {
                    if (!data.includes("ok")) {
                        $('#error_message').removeClass('hidden');
                        $('#error_message').html(data);
                        $('#account').addClass('error');
                    } else {
                        $('#account').removeClass('error');
                        $('#error_message').html("");
                        $('#error_message').addClass('hidden');
                    }
                }
            );
            return false;
        }
        </script>

  </body>
</html>
