<%-- 
    Document   : index
    Created on : 14 Dec, 2019, 4:35:06 PM
    Author     : AV-IT-PC345
--%>

<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery_3.4.1.min.js"></script>
        <!--<script src="js/jquery_3.4.1.min.js"></script>-->

        <title>Online Exam</title>
        <style>
            body{
                font-family:Times;
                font-weight: bold;
                /*color: #00264D;*/
                /*background-image:'pic/hands.jpg';*/
                background-image: url('pic/hands.jpg');
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
            .main{
                /*background-color: blue;*/
                /*background-image: linear-gradient(to left bottom, #320db7, #6d51ce, #9d8ae1, #cdc4f2, #ffffff);*/

                width:80%;
                height: 80%;
                margin-left: auto;
                margin-right: auto
            }
            .sub{
                width: 80%;
                height: 650px;
                margin-left: auto;
                margin-right: auto;
                /*text-align: center;*/
            }
            .sub_1{
                width: 400px;
                height: 400px;
                margin-left: auto;
                margin-right: auto;

                /*margin-top: 300px;*/
                /*background-color: #dce8f1;*/
                /*background-image: linear-gradient(to bottom, #f5f3fd, #d0daf0, #9fc5e0, #64b1c8, #1b9da3);*/
                /*background-image: linear-gradient(to bottom, #f5f3fd, #f1cce2, #f1a5a6, #d18d59, #858514);*/
                border-radius: 70px;
                box-shadow: 2px 3px 5px 5px #fff;
                /*position: relative;*/
            }
            li{
                list-style: none;
                padding: 9px 2px ;
            }
            .ip{
                width: 250px;
                height: 20px;
                border-radius: 6px;
                color: #0d0d0d;
                font-weight: bold;
            }
            .sel_sub,.sel_dpt,.sel_year{
                height: 25px;
            }

            .lab{
                /*padding-right:10px;*/
            }
            table{
                margin-left: auto;
                margin-right: auto;
                /*                background-image: url('pic/avalon logo_1.jpg');
                                background-repeat: no-repeat;
                                z-index: -1;
                                background-size: 200px 100px;
                                background-position: 110px 130px;*/
            }

            .ip:hover{
                background-color: honeydew;
            }
            .b1{
                width: 100px;
                height: 30px;
                font-weight: bold;
                border-radius: 5px;
                background-color: #677075;
                color: #fff;
            }
            .b1:hover{
                background-color:#fff;
                color: #677075;
            }



        </style>
        <script type = "text/javascript" >
            $(document).ready(function () {
//                $('#my_form').submit(function () {
//                    window.open('', 'formpopup', 'width=16000,height=1000,resizeable,scrollbars,menubar=no,toolbar=no,status=no,location=no');
//                    this.target = 'formpopup';
////                    document.getElementById("my_form").disabled;
//                });

//                document.onkeydown = function (e)
//                {
//                    return false;
//                }
//          




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
  });

        </script>
    </head>
    <body>
        <%
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.now();
            String today = dtf.format(localDate);
        %>
        <div class="main">


            <div class="sub">

                <br>
                <br>
                <div class="sub_1">
                    <h2 style="text-align: center;">PERSONAL DETAILS</h2> 
                    <form action="tech_begining.jsp" method="post" id="my_form">
                        <table>
                            <tr><td><li><label class="lab">STUDENT NAME</label></td><td><input type="text" name="student_name" required="" id="std_name" class="ip std_name"> </li></td></tr>
                            <tr> <td><li><label class="lab">AADHAR NO</label></td><td><input type="text" size="12" minlength="12" maxlength="12" required="" name="aadhar_no" id="aadhar_no" class="ip aadhar_no"> </li></td></tr>
                            <tr><td> <li><label class="lab">QUALIFICATION</label></td><td>
                                <!--<input type="text" name="dpt" id="dpt" class="dpt">-->
                                <select name="dpt" id="dpt" required="" class="ip sel_dpt">
                                    <option></option>
                                    <option value="B.E/B.TECH - ECE">B.E/B.TECH - ECE</option>
                                    <option value="B.E/B.TECH - EEE">B.E/B.TECH - EEE</option>
                                </select> 
                                </li></td></tr>
                            <tr><td><li><label class="lab">YEAR OF PASSING</label></td><td><select  required=""  name="year" id="ip sel_year" class="ip sel_year">
                                    <option></option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>

                                </li></td></tr>
                            <tr><td><li><label class="lab">COLLEGE NAME</label></td><td><input type="text" required="" name="colg" id="colg" class="ip colg"> </li></td></tr>
                            <tr><td><li><label class="lab">COLLEGE PLACE</label></td><td><input type="text" required="" name="colg_place" id="colg" class="ip colg"> </li></td></tr>
                            <tr><td><li><label class="lab">DATE OF EXAM</label></td><td><input type="text" value="<%=today%>" maxlength="10" readonly="" name="doe" id="doe" class="ip doe"> </li></td></tr>
                            <tr><td><li><label class="lab">MOBILE NO</label></td><td><input type="text" required="" minlength="10" maxlength="10" size="10"name="mobile" id="mobile" class="ip mobile"> </li></td></tr>
                            <tr><td><li><label class="lab">CGPA</label></td><td><input type="text" min="1" required="" max="9" maxlength="3" size="3"name="cgpa" id="cgpa" class="ip cgpa"></li></td></tr>
                            <tr><td> <li><label class="lab">SUBJECT</label></td><td><select name="sub" id="sub" required="" class="ip sel_sub">
                                    <option></option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                </select> </td></tr>
                            <tr> <td colspan="2" align="center"> <br><input type="submit" class="b1" name="submit" value="GO&Gt;"></td></tr>
                        </table>
                    </form>
                </div>
            </div>
            <footer></footer>
        </div>
    </body>
</html>
