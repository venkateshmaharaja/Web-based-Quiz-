<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

<%@page import="com.sun.xml.internal.ws.streaming.TidyXMLStreamReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery_3.4.1.min.js"></script>
    </head>
    <body>
        <%
            response.setContentType("text/html;charset=UTF-8");
            try {
                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();
                String subject = "";
                String question = "";
                String ans1 = "";
                String ans2 = "";
                String ans3 = "";
                String ans4 = "";
                String qid="";
                String tid="";
                String correct_ans = "";

                subject = request.getParameter("sub");
                out.print(subject);



                if (subject.equals("EEE")) {
                    ResultSet rs = st.executeQuery("SELECT qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE tid='1' and qid = '1'");
                    while (rs.next()) {
                        qid = rs.getString(1);
                        question = rs.getString(2);
                        ans1 = rs.getString(3);
                        ans2 = rs.getString(4);
                        ans3 = rs.getString(5);
                        ans4 = rs.getString(6);
                        correct_ans = rs.getString(7);
                        tid = "1";
                    }
                } else {
                    ResultSet rs = st.executeQuery("SELECT qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE tid='2' and qid = '31'");
                    while (rs.next()) {
                        qid = rs.getString(1);
                        question = rs.getString(2);
                        ans1 = rs.getString(3);
                        ans2 = rs.getString(4);
                        ans3 = rs.getString(5);
                        ans4 = rs.getString(6);
                        correct_ans = rs.getString(7);
                        tid = "2";
                    }
                }
                response.setContentType("text/plain");
                response.getWriter().write(qid+"&");
                response.getWriter().write(question+"&");
                response.getWriter().write(ans1+"&");
                response.getWriter().write(ans2+"&");
                response.getWriter().write(ans3+"&");
                response.getWriter().write(ans4+"&");
                response.getWriter().write(correct_ans+"&");
                response.getWriter().write(tid);


            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
