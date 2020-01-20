<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Avalon Assessment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery_3.4.1.min.js"></script>

        <style>
            body{
                background-image: url(pic/exam1.jpg);
                background-repeat: no-repeat;
                background-size: 100%, 100%;
                overflow: hidden;
            }
            .main{
                width: 100%;
                top: 0;
                left: 0;
                hight: 100%;
            }
            .sub{

            }
            .sub1{
                position: relative;
                -webkit-animation-name: example; /* Safari 4.0 - 8.0 */
                -webkit-animation-duration: 5s; /* Safari 4.0 - 8.0 */
                -webkit-animation-delay: 3s; /* Safari 4.0 - 8.0 */
                animation-name: example;
                animation-duration: 6s;
                animation-delay: -2s;
                animation-fill-mode: forwards;

                width: 50%;
                height: 50%;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
                box-shadow: 5px 5px 5px 5px #dce8f1;
            }

            table{
                margin-left: auto;
                margin-right: auto;
                font-size: 20px;
            }
            footer{
                text-align: center;
                margin-top: 12%;
            }
            h1{
                text-shadow: 3px 2px f3f0f0;
                color: #677075;

            }
            li{
                padding: 9px;
                color: #677075;
                font-weight: bold;
            }
            button{
                width: 150px;
                height: 30px;
                color: #677075;
                border-radius: 5px;
            }

            /* Safari 4.0 - 8.0 */
            @-webkit-keyframes example {
                0%   {top:2000px;}
                /*                25%  {left:200px; top:0px;}
                                50%  {left:200px; top:200px;}
                                75%  {left:0px; top:200px;}*/
                100% {top:0px;}
            }

            /* Standard syntax */
            @keyframes example {
                0%   {top:2000px;}
                /*                25%  {left:200px; top:0px;}
                                50%  {left:200px; top:200px;}
                                75%  {left:0px; top:200px;}*/
                100% {top:0px;}
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
    <body>
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
        <div class="main">
            <div class="sub">
                <br>
                <h1 align="center"  style="font-size: 35px;">TECHNICAL SECTION</h1>
            </div>
            <div class="sub1">
                <table>
                    <tr><td style="text-align: center; font-weight: bold;font-size: 25px; color: #677075;text-decoration: underline;">INSTRUCTIONS</td></tr>
                    <tr><td><li>This section only show a Technical question</li></td></tr>
                    <tr><td><li>Total 20 questions in this section</li></td></tr>
                    <tr><td><li>Each question have 1 mark</li></td></tr>
                    <tr><td><li>Totaly 20 marks in this section , no negative marks</li></td></tr>
                    <tr><td ><li style="color: #22636b;">Note : Don't Close or Minimize the window otherwise test will be closed.. </li></td></tr>
                    <tr><td><br></td></tr>
                </table>
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
            <footer>&COPY;Avalon Technologies</footer>
        </div>
        <%} catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
