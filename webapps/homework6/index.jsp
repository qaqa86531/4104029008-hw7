<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<%
   session.invalidate();
   %>

<html>
    <head>
        <meta charset="utf-8">
            <title>登入</title>
            <link rel="stylesheet" href="style1.css">
    </head>

            <body>
                <marquee behavior="alternate" class="texto" onMouseOver="this.stop()" onMouseOut="this.start()">
                    <font>登入</font>
                </marquee>

                <div class="Registro">

                    <form method="post" action="session.jsp">

                        <span class="fontawesome-user"></span>
                        <input type="text" name="account" required placeholder="帳號" autocomplete="off"/>
                        <br>
                        <span class="fontawesome-lock"></span>
                        <input type="password" name="password" id="password" required placeholder="密碼" autocomplete="off"/>
                        <br>
                        <input type="submit" value="登入" title="Registra tu cuenta"/>
                        <input type="button" onclick="window.open('new.jsp','_self')" value="註冊"/>
                    </form>
                </div>
            </body>
        </html>
