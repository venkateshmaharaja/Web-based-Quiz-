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

                String aadhar_no;
                aadhar_no = request.getParameter("aadhar");
//                out.print(aadhar_no);


        %>
        <div class="main">
            <div class="sub">
                <br>
                <h1 align="center"  style="font-size: 35px;">APTITUDE SECTION</h1>
            </div>
            <div class="sub1">
                <table>
                    <tr><td style="text-align: center; font-weight: bold;font-size: 25px; color: #677075;text-decoration: underline;">INSTRUCTIONS</td></tr>
                    <tr><td><li>This section only show a Technical question</li></td></tr>
                    <tr><td><li>Total 10 questions in this section</li></td></tr>
                    <tr><td><li>Each question have 1 mark</li></td></tr>
                    <tr><td><li>Test Duration 10 Minutes , no negative marks</li></td></tr>
                    <tr><td ><li style="color: #22636b;">Note : Don't Close or Minimize the window otherwise test will be closed.. </li></td></tr>
                    <tr><td><br></td></tr>
                </table>
                <form action="apt_all_quiz_1.jsp" method="post"  id="my_form" >
                    <input type="hidden" name="aadhar_no" value="<%=aadhar_no%>">
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
