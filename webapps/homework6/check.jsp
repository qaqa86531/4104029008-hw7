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
 String account = request.getParameter("acct");
 int x = 0;int y = 0;
 String message="";
//Validate duplicate account
 if(account!=null && account!=""){
 try{
     database.connectDB();
     String sql = "select * from member;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="帳號已被註冊";
         out.print(message);
       }else{
         out.print("ok");
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    message="帳號不可空白";
    out.println(message);
   }
%>
