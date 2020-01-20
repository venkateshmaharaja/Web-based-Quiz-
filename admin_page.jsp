<%-- 
    Document   : report
    Created on : 24 Dec, 2019, 10:50:07 AM
    Author     : AV-IT-PC345
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession session1 = request.getSession(true);
            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String username = "";
            String password = "";
            String usertype = "";
            int i = 0;
            ResultSet rs = st.executeQuery("select username,password,usertype from login where username='" + user + "' and password='" + pass + "'");
//            ResultSet rs = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE qid='" + qid + "' and tid='" + tid + "'");
            while (rs.next()) {
                username = rs.getString(1);
                password = rs.getString(2);
                usertype = rs.getString(3);
                i++;
            }
            if (i > 0) {
                session1.setAttribute(user, username);
                session1.setAttribute(pass, password);
                session1.setAttribute(usertype, usertype);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sucessfully Login');");
                out.write("setTimeout(function(){window.location.href='report_select.jsp'},1);");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('incorrect username or password');");
                out.write("setTimeout(function(){window.location.href='login.jsp'},1);");
                out.println("</script>");
            }
        %>
    </body>
</html>
