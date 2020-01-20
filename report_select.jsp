<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                height: 600px;
                margin-left: auto;
                margin-right: auto
            }
            .sub{
                width: 100%;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .sub_1{
                width: 40%;
                height: auto;
                margin-left: auto;
                margin-right: auto;
                border-radius: 10px;
                /*margin-top: 300px;*/
                background-color: beige;
            }
            li{
                margin-left: 20%;
                margin-right:auto;
                list-style: none;
                padding: 10px 10px 10px 10px;
            }

            .submit{
                padding: 3px 25px;
                /*                margin-left: 40%;
                                margin-top: 10%;*/

            }
        </style>
        <script>
//            function fn_clear(){
//                document.getElementById("fdate").value="b";
//                document.getElementById("tdate").value="a";
//                console.log("hi");
//            }
        </script>
    <body>
        <div class="main">
            <%
                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();

                String pattern = "yyyy-MM-dd";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date = simpleDateFormat.format(new Date());

                String aadhar_no = "";
                ResultSet rs = st.executeQuery("select DISTINCT aadhar_no FROM quiz_history");

            %>
            <div class="sub">
                <h1>CANDIDATE REPORTS</h1>
            </div>
            <br>
            <div class="sub_1">
                <form action="report.jsp" method="post">
                    <li><label>From Date</label><input type="text" name="fdate" id="fdate" size="10" value="<%=date%>" maxlength="10">yyyy-mm-dd</li>
                    <li><label>To &nbsp; Date</label><input type="text" name="tdate" id="tdate" size="10" value="<%=date%>" maxlength="10">yyyy-mm-dd</li>
                    <li><label>Detailed Wise</label><select name="detailed">
                            <option value=""></option>
                            <%      while (rs.next()) {
                            %>
                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                            <%}%>
                        </select></li>
                    <li><label>Technical </label><input type="text" name="t_starting_no" size="2" maxlength="2"> to <input type="text" name="t_ending_no" size="2" maxlength="2"></li>
                    <li><label>Aptitude &nbsp;&nbsp;</label><input type="text" name="a_starting_no" size="2" maxlength="2"> to <input type="text" name="a_ending_no" size="2" maxlength="2"></li>


                    <li><input type="submit" name="submit" class="submit" value="SUBMIT">&nbsp;<input type="reset" name="RESET" class="submit" value="RESET"></li>

                </form>               
            </div>
        </div>
        <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
    </body>
</html>
