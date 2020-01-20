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
                height: 600px;
                margin-left: auto;
                margin-right: auto;
            }
            .sub{
                width: 100%;

                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .sub_1{
                width: 70%;
                height: 300px;
                margin-left: auto;
                margin-right: auto;
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
        </style>
       <script type = "text/javascript" >
            $(document).ready(function () {
//                $('#my_form').submit(function () {
//                    window.open('', 'formpopup', 'width=16000,height=1000,resizeable,scrollbars,menubar=no,toolbar=no,status=no,location=no');
//                    this.target = 'formpopup';
////                    document.getElementById("my_form").disabled;
//                });

                document.onkeydown = function (e)
                {
                    return false;
                }
            });





            //Disable right click script
            var message = "";
///////////////////////////////////
            function clickIE() {
                if (document.all) {
                    (message);
                    return false;
                }
            }

            function clickNS(e) {
                if (document.layers || (document.getElementById && !document.all)) {
                    if (e.which == 2 || e.which == 3) {
                        (message);
                        return false;
                    }
                }
            }
            if (document.layers) {
                document.captureEvents(Event.MOUSEDOWN);
                document.onmousedown = clickNS;
            } else {
                document.onmouseup = clickNS;
                document.oncontextmenu = clickIE;
            }

            document.oncontextmenu = new Function("return false")

        </script>
    </head>
    <%
        try {
            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();

            String std_name, aadhar_no, dep, year_of_pass, colg, doe, mobile_no, sub, colg_place, cgpa;
            int i = 0;
            int aadhr_valdation = 0;
            std_name = request.getParameter("student_name");
            aadhar_no = request.getParameter("aadhar_no");
            dep = request.getParameter("dpt");
            year_of_pass = request.getParameter("year");
            colg = request.getParameter("colg");
            colg_place = request.getParameter("colg_place");
            cgpa = request.getParameter("cgpa");
            doe = request.getParameter("doe");
            mobile_no = request.getParameter("mobile");
            sub = request.getParameter("sub");

            //*****   aadhar validation **START** *****
            ResultSet rs_aadhr_check = st.executeQuery("select aadhar_no from users where aadhar_no='" + aadhar_no + "'");
            while (rs_aadhr_check.next()) {
                aadhr_valdation++;
            }
            if (aadhr_valdation > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sorry!! Aadhar Number is allready exist....');");
                out.write("setTimeout(function(){window.location.href='index.jsp'},1);");
                out.println("</script>");
            }
            //*****   aadhar validation **END** *****

            
            
            if ("".equals(std_name) || "".equals(aadhar_no) || "".equals(dep) || "".equals(doe) || "".equals(sub) || "".equals(year_of_pass)) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please enter the details');");
                out.write("setTimeout(function(){window.location.href='index.jsp'},1);");
//            'mywindow,'width=500,height=500,toolbar=no,resizable=yes,menubar=yes'
                out.println("</script>");
            } else {
                // i=st.executeUpdate("insert into emp1 values('"+empn+"''"+emp_dpt+"''"+emp_sal+"''"+emp_dob+"''"+emp_doj+"')");

                PreparedStatement ps = con.prepareStatement("insert into users(std_name,aadhar_no,dep,year_of_pass,colg,doe,mobile_no,colg_place,cgpa)values(?,?,?,?,?,?,?,?,?)");

                ps.setString(1, std_name.toUpperCase());
                ps.setString(2, aadhar_no);
                ps.setString(3, dep.toUpperCase());
                ps.setString(4, year_of_pass);
                ps.setString(5, colg.toUpperCase());
                ps.setString(6, doe);
                ps.setString(7, mobile_no);
                ps.setString(8, colg_place.toUpperCase());
                ps.setString(9, cgpa);
                i = ps.executeUpdate();
                if (i > 0) {
                    out.println("<script type=\"text/javascript\">");
//                out.println("alert('Sucessfully Updated');");
//                out.write("setTimeout(function(){window.location.href='quiz.jsp?/std_name="+/std_name+"&aadhar="+aadhar_no+"'},1);");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
//                out.println("alert('Not Updsated');");
//                out.write("setTimeout(function(){window.location.href='employee.jsp'},1);");
                    out.println("</script>");
                }
            }
    %>
    <body>
        <div class="main">

            <div class="sub">
                <!--<h1>ONLINE EXAM</h1>-->
            </div>
            <br>
            <h2 style="text-align: center;">EXAM</h2> 
            <h3 style="text-align: center;">WELCOME <%=std_name%></h3> 
            <div class="sub_1">
                <!--<form action="quiz_1.jsp" method="post">-->
                <form action="tech_all_quiz_1.jsp" method="post"  id="my_form" >
                    <input type="hidden" name="std_name" value="<%=std_name%>">
                    <input type="hidden" name="aadhar_no" value="<%=aadhar_no%>">
                    <input type="hidden" name="dep" value="<%=dep%>">
                    <input type="hidden" name="year_of_pass" value="<%=year_of_pass%>">
                    <input type="hidden" name="colg" value="<%=colg%>">
                    <input type="hidden" name="doe" value="<%=doe%>">
                    <input type="hidden" name="mobile_no" value="<%=mobile_no%>">
                    <input type="hidden" name="sub" value="<%=sub%>">
                    <input type="Submit" value="START EXAM" class="submit" name="submit">
                </form>               

            </div>
            <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
        </div>
        <%} catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
