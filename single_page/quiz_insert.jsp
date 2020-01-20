<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

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
        <!--<script src="js/jquery_3.4.1.min.js"></script>-->
    </head>
    <body>
        <%
            response.setContentType("text/html;charset=UTF-8");
            try {
                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();

                if (!request.getParameter("your_ans").equals("")) {

                    int mark = 0;
                    int j = 0;
                    int qid_1 = 0;

                    String tid = "";
                    String qid = "";
                    String aadhar_no = "";
                    String sub = "";
                    String yourans = "";
                    String std_name = "";
                    String dpt = "";
                    String question = "";
                    String ans1 = "";
                    String ans2 = "";
                    String ans3 = "";
                    String ans4 = "";
                    String correct_ans = "";

                    std_name = request.getParameter("std_name");
                    aadhar_no = request.getParameter("aadhar_no");
                    tid = request.getParameter("tid");
                    qid = request.getParameter("qid");
                    question = request.getParameter("question");
                    ans1 = request.getParameter("ans1");
                    ans2 = request.getParameter("ans2");
                    ans3 = request.getParameter("ans3");
                    ans4 = request.getParameter("ans4");
                    correct_ans = request.getParameter("correct_ans");
//                sub = request.getParameter("sub");
                    yourans = request.getParameter("your_ans");

//                out.print("<br> std_name" + std_name);
                    out.print("<br> aadhar_no" + aadhar_no);
                    out.print("<br> tid" + tid);
                    out.print("<br> qid" + qid);
//                out.print("<br> question" + question);
//                out.print("<br> ans1" + ans1);
//                out.print("<br> ans2" + ans2);
//                out.print("<br> ans3" + ans3);
//                out.print("<br> ans4" + ans4);
//                out.print("<br> correct_ans" + correct_ans);
//                out.print("<br> sub" + sub);
                    out.print("<br> yourans" + yourans);

                    ResultSet rs1 = st.executeQuery("SELECT std_name,aadhar_no from users where aadhar_no='" + aadhar_no + "'");
                    String student_name = "";
                    String student_aadher_no = "";
                    while (rs1.next()) {
                        student_name = rs1.getString(1);
                        student_aadher_no = rs1.getString(2);
                    }
                    ResultSet rs2 = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE qid='" + qid + "' and tid='" + tid + "'");
                    String str_tid = "";
                    String str_qid = "";
                    String str_question = "";
                    String str_ans1 = "";
                    String str_ans2 = "";
                    String str_ans3 = "";
                    String str_ans4 = "";
                    String str_correct_ans = "";
                    while (rs2.next()) {
                        str_tid = rs2.getString(1);
                        str_qid = rs2.getString(2);
                        str_question = rs2.getString(3);
                        str_ans1 = rs2.getString(4);
                        str_ans2 = rs2.getString(5);
                        str_ans3 = rs2.getString(6);
                        str_ans4 = rs2.getString(7);
                        str_correct_ans = rs2.getString(8);
                    }

                    PreparedStatement ps = con.prepareStatement("INSERT INTO quiz_history(std_name,aadhar_no,tid,qid,question,ans1,"
                            + "ans2,ans3,ans4,correct_ans,your_ans,mark) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");

                    ps.setString(1, student_name);
                    ps.setString(2, student_aadher_no);
                    ps.setString(3, str_tid);
                    ps.setString(4, str_qid);
                    ps.setString(5, str_question);
                    ps.setString(6, str_ans1);
                    ps.setString(7, str_ans2);
                    ps.setString(8, str_ans3);
                    ps.setString(9, str_ans4);
                    ps.setString(10, str_correct_ans);
                    ps.setString(11, yourans);
                    if (str_correct_ans.equals(yourans)) {
                        mark = 1;
                    }
                    ps.setInt(12, mark);
                    j = ps.executeUpdate();
//                }
                    if (j == 1) {
                        String qid_2 = "";
                        String result = "";
                        String result1 = "";
                        String result2 = "";
                        String result3 = "";
                        String result4 = "";
                        String result5 = "";
                        qid_1 = Integer.parseInt(str_qid);
                        qid_1 = qid_1 + 1;
                        ResultSet rs3 = st1.executeQuery("select distinct qid,question,ans1,ans2,ans3,ans4,correct_ans from questions where tid='" + str_tid + "' and qid='" + qid_1 + "'");
                        while (rs3.next()) {
                            qid_2 = rs3.getString(1);
                            result = rs3.getString(2);
                            result1 = rs3.getString(3);
                            result2 = rs3.getString(4);
                            result3 = rs3.getString(5);
                            result4 = rs3.getString(6);
                            result5 = rs3.getString(7);
                        }
                        response.setContentType("text/plain");
                        response.getWriter().write(qid_2 + "&");
                        response.getWriter().write(result + "&");
                        response.getWriter().write(result1 + "&");
                        response.getWriter().write(result2 + "&");
                        response.getWriter().write(result3 + "&");
                        response.getWriter().write(result4 + "&");
                    }
                }
                else{
                response.setContentType("text/plain");
                response.getWriter().write("please select the answer");
                }

            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
