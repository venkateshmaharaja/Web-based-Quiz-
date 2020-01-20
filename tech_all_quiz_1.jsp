<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ</title>
        <style>
            body{
                background-color: antiquewhite;
            }
            .main{
                background-color: antiquewhite;
                width:auto;
                height: auto;
                margin-left: auto;
                margin-right: auto;
            }
            .sub{

                width: auto;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                height: auto;

            }
            .sub_1{
                width: auto;
                height: auto;
                margin-left: auto;
                margin-right: auto;
                /*margin-top: 300px;*/
                border-radius: 20px;
                background-color: beige;
            }
            li{
                margin-left: 5%;
                padding-top: 10px;
                /*margin-right:40%;*/
            }

            /*            .submit{
                            padding: 10px 10px;
                            margin-left: 40%;
                            margin-top: 10%;
            
                        }*/
            .div_answer{
                list-style: none;
                background-color:burlywood;
                border-radius: 10px;

            }
            .div_question{
                background-color:  aliceblue;
                height: auto;
                width: auto;
                border-radius: 10px;
                line-height: 0px;
                text-align: left;
                text-justify: auto;
            }
            .next{
                /*                margin-left:47%;*/
                margin-top:10px;
                display: block;
                margin: auto;
                width: 60px;
                height: 30px;
                border-radius: 5px;
            }

            table,th,tr,td{
                border: 1px burlywood solid;
                border-collapse: collapse;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                width: auto;
            } 
            table{
                margin-left: 2px;
                width: 100%;
            }


            .questions{
                width: 80%;
                height: auto;
                background-color:#efb96a;
                margin-left: auto;
                margin-right: auto;
                /*text-align: center;*/
                border-radius: 10px;
                color: #fbfbf8;
                list-style: none;
                padding-bottom: 10px;
                padding-left: 10px;
                padding-top: 10px;

            }
            .ans{
                width: 80%;
                height: auto;
                background-color:#f1eeb7;
                color: #a52a2a;
                margin-left: auto;
                margin-right: auto;
                /*text-align: center;*/
                border-radius: 10px;
                list-style: none;
                margin-bottom: 5px;
                padding-bottom: 10px;
                padding-left: 10px;
                padding-top: 10px;

            }

            .timer{
                position: -webkit-sticky;
                position: -moz-sticky;
                position: -o-sticky;
                position: -ms-sticky;
                position: sticky;
                top: 0;
            }
            span{
                color: black;
            }

        </style>

        <script src="js/jquery_3.4.1.min.js"></script>
        <!--<script src="js/jquery-3.4.1.js"></script>-->

        <script>
            $(document).ready(function () {
                var timeoutHandle;
                function count() {
                    var startTime = document.getElementById('hms').innerHTML;
                    var pieces = startTime.split(":");
                    var time = new Date();
                    time.setHours(pieces[0]);
                    time.setMinutes(pieces[1]);
                    time.setSeconds(pieces[2]);
                    var timedif = new Date(time.valueOf() - 1000);
                    var newtime = timedif.toTimeString().split(" ")[0];
                    if (newtime == "00:00:00") {
                    window.location.href = "apt_begining.jsp";
//                    window.location.href = "";
                        alert("TIME OUT");
                        document.getElementById("tech_form").submit();
                    }
                    document.getElementById('hms').innerHTML = newtime;
                    timeoutHandle = setTimeout(count, 1000);
                }
                count();


            });


        </script> 
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
                }s
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

            String std_name = "";
            String aadhar_no = "";
            String sub = "";
            int tid;
            int j = 0, mark = 0;
//            std_name = request.getParameter("std_name");
//            std_name = request.getParameter("std_name");
            sub = request.getParameter("sub");
            aadhar_no = request.getParameter("aadhar_no");
            ResultSet questions_rs = null;

            //  *****          student name fetch  *START*   *********            
            ResultSet std_details_rs = st.executeQuery("SELECT std_name,aadhar_no from users where aadhar_no='" + aadhar_no + "'");
            while (std_details_rs.next()) {
                std_name = std_details_rs.getString(1);
            }
            //  *****          student name fetch  *END*   *********   

            if (sub.equals("ECE")) {
                questions_rs = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions_1 WHERE tid='1' order by RAND()");
                tid = 1;
            } else {
                questions_rs = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions_1 WHERE tid='2' order by RAND()");
                tid = 2;
            }

            ArrayList alist_tid = new ArrayList();
            ArrayList alist_qid = new ArrayList();
            ArrayList alist_ques = new ArrayList();
            ArrayList alist_ans1 = new ArrayList();
            ArrayList alist_ans2 = new ArrayList();
            ArrayList alist_ans3 = new ArrayList();
            ArrayList alist_ans4 = new ArrayList();
            ArrayList alist_correctans = new ArrayList();

            while (questions_rs.next()) {
                alist_tid.add(questions_rs.getInt(1));
                alist_qid.add(questions_rs.getInt(2));
                alist_ques.add(questions_rs.getString(3));
                alist_ans1.add(questions_rs.getString(4));
                alist_ans2.add(questions_rs.getString(5));
                alist_ans3.add(questions_rs.getString(6));
                alist_ans4.add(questions_rs.getString(7));
                alist_correctans.add(questions_rs.getString(7));
            }

    %>

    <body style="margin-top: 0px; ">
        <div class="main" style="margin-top: 0px; ">
            <h4 class="timer" style="text-align: right;font-size: 25PX;" id="hms">00:20:00</h4>
            <div class="sub" style="margin: 0px;padding: 0px;">
                <!--<h1 style="line-height: 0px;">AVALON TECHNOLOGIES</h1>-->
                <form action="tech_all_quiz_insert.jsp" method="post" id="tech_form">

                    <input type="hidden" name="std_name" id="std_name" value="<%=std_name%>">
                    <input type="hidden" name="aadhar_no" id="aadhar_no" value="<%=aadhar_no%>">
                    <input type="hidden" name="sub" id="sub" value="<%=sub%>">
                    <input type="hidden" name="tid" id="tid" value="<%=tid%>">


                    </div>
                    <h2 style="text-align: center;">TECHNICAL QUESTIONS</h2> 
                    <!--<h3 style="text-align: center;">Welcome <%=std_name%></h3>--> 
                    <!--<h4 align="center" style="color:brown;">Instruction : 20 Minitus only no negative marks    </h4>-->
                    <div class="sub_1">
                        <br>
                        <!--######## 1  #######-->
                        <div class="questions" id="q_div1">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 1</span>
                            <li id="q1"> <%=alist_ques.get(0)%> </li>
                        </div>
                        <div class="ans">
                            <!--<span style="margin-right: 95%; color: black; text-decoration: underline;font-weight: bold;">ANSWER:</span>-->
                            <li>A<input type="radio" name="ans1" required="" id="ans" value="1"><span id="span_1_1"><%=alist_ans1.get(0)%></span></input></li>
                            <li>B<input type="radio" name="ans1" id="ans" value="2"><span id="span_1_2"><%=alist_ans2.get(0)%></span></input></li>
                            <li>C<input type="radio" name="ans1" id="ans" value="3"><span id="span_1_3"><%=alist_ans3.get(0)%></span></input></li>
                            <li>D<input type="radio" name="ans1" id="ans" value="4"><span id="span_1_4"><%=alist_ans4.get(0)%></span></input></li>
                            <input type="hidden" name="ans1" id="ans" checked="checked" value="A"></input>
                        </div>
                        <!--########  2  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 2</span>
                            <li id="q2"> <%=alist_ques.get(1)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans2" required="" id="ans" value="1"><span id="span_2_1"><%=alist_ans1.get(1)%></span></input></li>
                            <li>B<input type="radio" name="ans2" id="ans" value="2"><span id="span_2_2"><%=alist_ans2.get(1)%></span></input></li>
                            <li>C<input type="radio" name="ans2" id="ans" value="3"><span id="span_2_3"><%=alist_ans3.get(1)%></span></input></li>
                            <li>D<input type="radio" name="ans2" id="ans" value="4"><span id="span_2_4"><%=alist_ans4.get(1)%></span></input></li>
                            <input type="hidden" name="ans2" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 3  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 3</span>
                            <li id="q3"><%=alist_ques.get(2)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans3" required="" id="ans" value="1"><span id="span_3_1"><%=alist_ans1.get(2)%></span></input></li>
                            <li>B<input type="radio" name="ans3" id="ans" value="2"><span id="span_3_2"><%=alist_ans2.get(2)%></span></input></li>
                            <li>C<input type="radio" name="ans3" id="ans" value="3"><span id="span_3_3"><%=alist_ans3.get(2)%></span></input></li>
                            <li>D<input type="radio" name="ans3" id="ans" value="4"><span id="span_3_4"><%=alist_ans4.get(2)%></span></input></li>
                            <input type="hidden" name="ans3" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 4  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 4</span>
                            <li id="q4"><%=alist_ques.get(3)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans4" required="" id="ans" value="1"><span id="span_4_1"><%=alist_ans1.get(3)%></span></input></li>
                            <li>B<input type="radio" name="ans4" id="ans" value="2"><span id="span_4_2"><%=alist_ans2.get(3)%></span></input></li>
                            <li>C<input type="radio" name="ans4" id="ans" value="3"><span id="span_4_3"><%=alist_ans3.get(3)%></span></input></li>
                            <li>D<input type="radio" name="ans4" id="ans" value="4"><span id="span_4_4"><%=alist_ans4.get(3)%></span></input></li>
                            <input type="hidden" name="ans4" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 5  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 5</span>
                            <li id="q5"><%=alist_ques.get(4)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans5" required="" id="ans" value="1"><span id="span_5_1"><%=alist_ans1.get(4)%></span></input></li>
                            <li>B<input type="radio" name="ans5" id="ans" value="2"><span id="span_5_2"><%=alist_ans2.get(4)%></span></input></li>
                            <li>C<input type="radio" name="ans5" id="ans" value="3"><span id="span_5_3"><%=alist_ans3.get(4)%></span></input></li>
                            <li>D<input type="radio" name="ans5" id="ans" value="4"><span id="span_5_4"><%=alist_ans4.get(4)%></span></input></li>
                            <input type="hidden" name="ans5" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 6  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 6</span>
                            <li id="q6"><%=alist_ques.get(5)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans6" required="" id="ans" value="1"><span id="span_6_1"><%=alist_ans1.get(5)%></span></input></li>
                            <li>B<input type="radio" name="ans6" id="ans" value="2"><span id="span_6_2"><%=alist_ans2.get(5)%></span></input></li>
                            <li>C<input type="radio" name="ans6" id="ans" value="3"><span id="span_6_3"><%=alist_ans3.get(5)%></span></input></li>
                            <li>D<input type="radio" name="ans6" id="ans" value="4"><span id="span_6_4"><%=alist_ans4.get(5)%></span></input></li>
                            <input type="hidden" name="ans6" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 7  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 7</span>
                            <li id="q7"><%=alist_ques.get(6)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans7" required="" id="ans" value="1"><span id="span_7_1"><%=alist_ans1.get(6)%></span></input></li>
                            <li>B<input type="radio" name="ans7" id="ans" value="2"><span id="span_7_2"><%=alist_ans2.get(6)%></span></input></li>
                            <li>C<input type="radio" name="ans7" id="ans" value="3"><span id="span_7_3"><%=alist_ans3.get(6)%></span></input></li>
                            <li>D<input type="radio" name="ans7" id="ans" value="4"><span id="span_7_4"><%=alist_ans4.get(6)%></span></input></li>
                            <input type="hidden" name="ans7" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 8  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 8</span>
                            <li id="q7"> <%=alist_ques.get(7)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans8" required="" id="ans" value="1"><span id="span_8_1"><%=alist_ans1.get(7)%></span></input></li>
                            <li>B<input type="radio" name="ans8" id="ans" value="2"><span id="span_8_2"><%=alist_ans2.get(7)%></span></input></li>
                            <li>C<input type="radio" name="ans8" id="ans" value="3"><span id="span_8_3"><%=alist_ans3.get(7)%></span></input></li>
                            <li>D<input type="radio" name="ans8" id="ans" value="4"><span id="span_8_4"><%=alist_ans4.get(7)%></span></input></li>
                            <input type="hidden" name="ans8" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 9  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 9</span>
                            <li id="q3"><%=alist_ques.get(8)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans9" required="" id="ans" value="1"><span id="span_9_1"><%=alist_ans1.get(8)%></span></input></li>
                            <li>B<input type="radio" name="ans9" id="ans" value="2"><span id="span_9_2"><%=alist_ans2.get(8)%></span></input></li>
                            <li>C<input type="radio" name="ans9" id="ans" value="3"><span id="span_9_3"><%=alist_ans3.get(8)%></span></input></li>
                            <li>D<input type="radio" name="ans9" id="ans" value="4"><span id="span_9_4"><%=alist_ans4.get(8)%></span></input></li>
                            <input type="hidden" name="ans9" id="ans" checked="checked" value="A"></input>

                        </div>

                        <!--######## 10  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 10</span>
                            <li id="q10"><%=alist_ques.get(9)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans10" required="" id="ans" value="1"><span id="span_10_1"><%=alist_ans1.get(9)%></span></input></li>
                            <li>B<input type="radio" name="ans10" id="ans" value="2"><span id="span_10_2"><%=alist_ans2.get(9)%></span></input></li>
                            <li>C<input type="radio" name="ans10" id="ans" value="3"><span id="span_10_3"><%=alist_ans3.get(9)%></span></input></li>
                            <li>D<input type="radio" name="ans10" id="ans" value="4"><span id="span_10_4"><%=alist_ans4.get(9)%></span></input></li>
                            <input type="hidden" name="ans10" id="ans" checked="checked" value="A"></input>

                        </div> <!--######## 11  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 11</span>
                            <li id="q11"> <%=alist_ques.get(10)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans11" required="" id="ans" value="1"><span id="span_11_1"><%=alist_ans1.get(10)%></span></input></li>
                            <li>B<input type="radio" name="ans11" id="ans" value="2"><span id="span_11_2"><%=alist_ans2.get(10)%></span></input></li>
                            <li>C<input type="radio" name="ans11" id="ans" value="3"><span id="span_11_3"><%=alist_ans3.get(10)%></span></input></li>
                            <li>D<input type="radio" name="ans11" id="ans" value="4"><span id="span_11_4"><%=alist_ans4.get(10)%></span></input></li>
                            <input type="hidden" name="ans11" id="ans" checked="checked" value="A"></input>

                        </div> <!--######## 12  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 12</span>
                            <li id="q12"> <%=alist_ques.get(11)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans12" required="" id="ans" value="1"><span id="span_12_1"><%=alist_ans1.get(11)%></span></input></li>
                            <li>B<input type="radio" name="ans12" id="ans" value="2"><span id="span_12_2"><%=alist_ans2.get(11)%></span></input></li>
                            <li>C<input type="radio" name="ans12" id="ans" value="3"><span id="span_12_3"><%=alist_ans3.get(11)%></span></input></li>
                            <li>D<input type="radio" name="ans12" id="ans" value="4"><span id="span_12_4"><%=alist_ans4.get(11)%></span></input></li>
                            <input type="hidden" name="ans12" id="ans" checked="checked" value="A"></input>

                        </div> <!--######## 13  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 13</span>
                            <li id="q13"><%=alist_ques.get(12)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans13" required="" id="ans" value="1"><span id="span_13_1"><%=alist_ans1.get(12)%></span></input></li>
                            <li>B<input type="radio" name="ans13" id="ans" value="2"><span id="span_13_2"><%=alist_ans2.get(12)%></span></input></li>
                            <li>C<input type="radio" name="ans13" id="ans" value="3"><span id="span_13_3"><%=alist_ans3.get(12)%></span></input></li>
                            <li>D<input type="radio" name="ans13" id="ans" value="4"><span id="span_13_4"><%=alist_ans4.get(12)%></span></input></li>
                            <input type="hidden" name="ans13" id="ans" checked="checked" value="A"></input>

                        </div> <!--########  14  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 14</span>
                            <li id="q14"> <%=alist_ques.get(13)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans14" required="" id="ans" value="1"><span id="span_14_1"><%=alist_ans1.get(13)%></span></input></li>
                            <li>B<input type="radio" name="ans14" id="ans" value="2"><span id="span_14_2"><%=alist_ans2.get(13)%></span></input></li>
                            <li>C<input type="radio" name="ans14" id="ans" value="3"><span id="span_14_3"><%=alist_ans3.get(13)%></span></input></li>
                            <li>D<input type="radio" name="ans14" id="ans" value="4"><span id="span_14_4"><%=alist_ans4.get(13)%></span></input></li>
                            <input type="hidden" name="ans14" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--########  15  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 15</span>
                            <li id="q15"><%=alist_ques.get(14)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans15" required="" id="ans" value="1"><span id="span_15_1"><%=alist_ans1.get(14)%></span></input></li>
                            <li>B<input type="radio" name="ans15" id="ans" value="2"><span id="span_15_2"><%=alist_ans2.get(14)%></span></input></li>
                            <li>C<input type="radio" name="ans15" id="ans" value="3"><span id="span_15_3"><%=alist_ans3.get(14)%></span></input></li>
                            <li>D<input type="radio" name="ans15" id="ans" value="4"><span id="span_15_4"><%=alist_ans4.get(14)%></span></input></li>
                            <input type="hidden" name="ans15" id="ans" checked="checked" value="A"></input>

                        </div> <!--######## 16  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 16</span>
                            <li id="q16"> <%=alist_ques.get(15)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans16" required="" id="ans" value="1"><span id="span_16_1"><%=alist_ans1.get(15)%></span></input></li>
                            <li>B<input type="radio" name="ans16" id="ans" value="2"><span id="span_16_2"><%=alist_ans2.get(15)%></span></input></li>
                            <li>C<input type="radio" name="ans16" id="ans" value="3"><span id="span_16_3"><%=alist_ans3.get(15)%></span></input></li>
                            <li>D<input type="radio" name="ans16" id="ans" value="4"><span id="span_16_4"><%=alist_ans4.get(15)%></span></input></li>
                            <input type="hidden" name="ans16" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 17  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 17</span>
                            <li id="q17"><%=alist_ques.get(16)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans17" required="" id="ans" value="1"><span id="span_17_1"><%=alist_ans1.get(16)%></span></input></li>
                            <li>B<input type="radio" name="ans17" id="ans" value="2"><span id="span_17_2"><%=alist_ans2.get(16)%></span></input></li>
                            <li>C<input type="radio" name="ans17" id="ans" value="3"><span id="span_17_3"><%=alist_ans3.get(16)%></span></input></li>
                            <li>D<input type="radio" name="ans17" id="ans" value="4"><span id="span_17_4"><%=alist_ans4.get(16)%></span></input></li>
                            <input type="hidden" name="ans17" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 18  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 18</span>
                            <li id="q18"><%=alist_ques.get(17)%> </li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans18" required="" id="ans" value="1"><span id="span_18_1"><%=alist_ans1.get(17)%></span></input></li>
                            <li>B<input type="radio" name="ans18" id="ans" value="2"><span id="span_18_2"><%=alist_ans2.get(17)%></span></input></li>
                            <li>C<input type="radio" name="ans18" id="ans" value="3"><span id="span_18_3"><%=alist_ans3.get(17)%></span></input></li>
                            <li>D<input type="radio" name="ans18" id="ans" value="4"><span id="span_18_4"><%=alist_ans4.get(17)%></span></input></li>
                            <input type="hidden" name="ans18" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 19  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q :19</span>
                            <li id="q19"><%=alist_ques.get(18)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans19" required="" id="ans" value="1"><span id="span_19_1"><%=alist_ans1.get(18)%></span></input></li>
                            <li>B<input type="radio" name="ans19" id="ans" value="2"><span id="span_19_2"><%=alist_ans2.get(18)%></span></input></li>
                            <li>C<input type="radio" name="ans19" id="ans" value="3"><span id="span_19_3"><%=alist_ans3.get(18)%></span></input></li>
                            <li>D<input type="radio" name="ans19" id="ans" value="4"><span id="span_19_4"><%=alist_ans4.get(18)%></span></input></li>
                            <input type="hidden" name="ans19" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 20  #######-->
                        <div class="questions">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 20</span>
                            <li id="q20"><%=alist_ques.get(19)%></li>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans20" required="" id="ans" value="1"><span id="span_20_1"><%=alist_ans1.get(19)%></span></input></li>
                            <li>B<input type="radio" name="ans20" id="ans" value="2"><span id="span_20_2"><%=alist_ans2.get(19)%></span></input></li>
                            <li>C<input type="radio" name="ans20" id="ans" value="3"><span id="span_20_3"><%=alist_ans3.get(19)%></span></input></li>
                            <li>D<input type="radio" name="ans20" id="ans" value="4"><span id="span_20_4"><%=alist_ans4.get(19)%></span></input></li>
                            <input type="hidden" name="ans20" id="ans" checked="checked" value="A"></input>

                        </div>

                        <input type="hidden" name="al_q1" value="<%=alist_qid.get(0)%>"></input>
                        <input type="hidden" name="al_q2" value="<%=alist_qid.get(1)%>"></input>
                        <input type="hidden" name="al_q3" value="<%=alist_qid.get(2)%>"></input>
                        <input type="hidden" name="al_q4" value="<%=alist_qid.get(3)%>"></input>
                        <input type="hidden" name="al_q5" value="<%=alist_qid.get(4)%>"></input>
                        <input type="hidden" name="al_q6" value="<%=alist_qid.get(5)%>"></input>
                        <input type="hidden" name="al_q7" value="<%=alist_qid.get(6)%>"></input>
                        <input type="hidden" name="al_q8" value="<%=alist_qid.get(7)%>"></input>
                        <input type="hidden" name="al_q9" value="<%=alist_qid.get(8)%>"></input>
                        <input type="hidden" name="al_q10" value="<%=alist_qid.get(9)%>"></input>
                        <input type="hidden" name="al_q11" value="<%=alist_qid.get(10)%>"></input>
                        <input type="hidden" name="al_q12" value="<%=alist_qid.get(11)%>"></input>
                        <input type="hidden" name="al_q13" value="<%=alist_qid.get(12)%>"></input>
                        <input type="hidden" name="al_q14" value="<%=alist_qid.get(13)%>"></input>
                        <input type="hidden" name="al_q15" value="<%=alist_qid.get(14)%>"></input>
                        <input type="hidden" name="al_q16" value="<%=alist_qid.get(15)%>"></input>
                        <input type="hidden" name="al_q17" value="<%=alist_qid.get(16)%>"></input>
                        <input type="hidden" name="al_q18" value="<%=alist_qid.get(17)%>"></input>
                        <input type="hidden" name="al_q19" value="<%=alist_qid.get(18)%>"></input>
                        <input type="hidden" name="al_q20" value="<%=alist_qid.get(19)%>"></input>


                        <input type="submit" name="b1" id="next" class="next" value="Submit"></input>
                </form>
            </div>
        </div>
        <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
            <%
                } catch (Exception ex) {
                    out.print(ex);
                }
            %>
    </div>
</body>
</html>
