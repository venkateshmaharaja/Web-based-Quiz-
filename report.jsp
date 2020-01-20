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
        <script src="js/jquery_3.4.1.min.js"></script>

        <style>
            .main{
                background-color: antiquewhite;
                width:100%;
                height: 100%;
                margin-left: auto;
                margin-right: auto
            }
            .sub{
                width: 100%;
                height: auto;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .sub_1{
                width: 70%;
                height: auto;
                margin-left: auto;
                margin-right: auto;
                border-radius: 20px;
                /*margin-top: 300px;*/
                background-color: beige;
            }
            li{
                margin-left: 40%;
                margin-right:40%;
            }

            .submit{
                padding: 10px 10px;
                margin-left: 40%;
                margin-top: 10%;
            }
            table,td,th{
                border: 2px solid #a52a2a;
                border-collapse: collapse;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            table{
                width: 69.5%;
            }
        </style>
        <script>

        </script>
    <body>
        <%

            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();

            String aadhar_no = "";
            String tq_start_no = "";
            String tq_end_no = "";
            String ap_start_no = "";
            String ap_end_no = "";
            String from_dt = "";
            String to_dt = "";
            int i = 1;
            aadhar_no = request.getParameter("detailed");
            tq_start_no = request.getParameter("t_starting_no");
            tq_end_no = request.getParameter("t_ending_no");
            ap_start_no = request.getParameter("a_starting_no");
            ap_end_no = request.getParameter("a_ending_no");
            from_dt = request.getParameter("fdate");
            to_dt = request.getParameter("tdate");
//            out.print(aadhar_no);
//            out.print(tq_start_no);
//            out.print(tq_end_no);
//            out.print(ap_start_no);
//            out.print(ap_end_no);
//            out.print(from_dt);
//            out.print(to_dt);
        %>
        <div class="main">

            <div class="sub">
                <h1>CANDIDATE REPORTS</h1>
            </div>
            <br>
            <div class="sub_1">
                <br>
                <table>
                    <th>S.NO</th>
                    <th>NAME</th>
                    <th>AADHAR NO</th>
                    <th>DEPARTMENT</th>
                    <th>YEAR OF PASSING</th>
                    <th> COLLEGE</th>
                    <th> DOE</th>
                    <th> MOBILE NO</th>
                    <th> MARK</th>
                        <%
                            ResultSet rs = null;
                            if (!from_dt.equals("") || (!to_dt.equals(""))) {
                                rs = st.executeQuery("select a.std_name,a.aadhar_no,a.dep,a.year_of_pass,a.colg,a.doe,a.mobile_no,sum(b.mark)as mark from users as a JOIN quiz_history as b on a.aadhar_no=b.aadhar_no where a.doe between'" + from_dt + "' and '" + to_dt + "' GROUP by aadhar_no");
                            } else if (!aadhar_no.equals("")) {
                                rs = st.executeQuery("select a.std_name,a.aadhar_no,a.dep,a.year_of_pass,a.colg,a.doe,a.mobile_no,sum(b.mark)as mark from users as a JOIN quiz_history as b on a.aadhar_no=b.aadhar_no where a.aadhar_no = '" + aadhar_no + "' GROUP by aadhar_no");
                            } else if (!tq_start_no.equals("") && !tq_end_no.equals("")) {
                                rs = st.executeQuery("select a.std_name,a.aadhar_no,a.dep,a.year_of_pass,a.colg,a.doe,a.mobile_no,sum(b.mark)as mark from users as a JOIN quiz_history as b on a.aadhar_no=b.aadhar_no where b.tid<> '3' GROUP by aadhar_no HAVING  mark BETWEEN 3 AND 6");
                            } else if (!ap_start_no.equals("") && !ap_end_no.equals("")) {
                                rs = st.executeQuery("select a.std_name,a.aadhar_no,a.dep,a.year_of_pass,a.colg,a.doe,a.mobile_no,sum(b.mark)as mark from users as a JOIN quiz_history as b on a.aadhar_no=b.aadhar_no where b.tid='3' GROUP by aadhar_no having  mark between '" + ap_start_no + "' and '" + ap_end_no + "'");
                            } else {
                                rs = st.executeQuery("select a.std_name,a.aadhar_no,a.dep,a.year_of_pass,a.colg,a.doe,a.mobile_no,sum(b.mark)as mark from users as a JOIN quiz_history as b on a.aadhar_no=b.aadhar_no GROUP by aadhar_no");
                            }
                            while (rs.next()) {
                        %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><a href="detailed_report.jsp?aadhar_no=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                    </tr>

                    <%
                            i++;
                        }
                    %>
                </table>
            </div>
            <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
        </div>
    </body>
</html>
