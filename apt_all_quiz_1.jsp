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
        <script src="js/jquery-3.4.1.js"></script>

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
                                            window.location.href = "thankyou.jsp";
                        //                    window.location.href = "";
                        alert("TIME OUT");
                        document.getElementById("apt_form").submit();
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

            String std_name = "";
            String aadhar_no = "";
//            String sub = "";
            int tid;
            int j = 0, mark = 0;
//            std_name = request.getParameter("std_name");
//            std_name = request.getParameter("std_name");
//            sub = request.getParameter("sub");
            aadhar_no = request.getParameter("aadhar_no");
//            out.print(aadhar_no);
            ResultSet questions_rs = null;

            //  *****          student name fetch  *START*   *********            
            ResultSet std_details_rs = st.executeQuery("SELECT std_name,aadhar_no from users where aadhar_no='" + aadhar_no + "'");
            while (std_details_rs.next()) {
                std_name = std_details_rs.getString(1);
            }
            //  *****          student name fetch  *END*   *********   

            questions_rs = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions_1 WHERE tid='3' order by RAND()");
            tid = 3;


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
            <h4 class="timer" style="text-align: right;font-size: 25PX;" id="hms">00:10:00</h4>
            <div class="sub" style="margin: 0px;padding: 0px;">
                <!--<h1 style="line-height: 0px;">AVALON TECHNOLOGIES</h1>-->
                <form action="apt_all_quiz_insert.jsp" method="post" id="apt_form">

                    <input type="hidden" name="std_name" id="std_name" value="<%=std_name%>">
                    <input type="hidden" name="aadhar_no" id="aadhar_no" value="<%=aadhar_no%>">

                    </div>
                    <h2 style="text-align: center;">APTITUDE QUESTIONS</h2> 
                    <!--<h4 align="center" style="color:brown;">Instruction : 10 Minitus only no negative marks    </h4>-->
                    <div class="sub_1">
                        <br>
                        <!--######## 1  #######-->
                        <div class="questions" id="q_div1">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 1</span>
                            <% if (alist_qid.get(0).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q1">  <%out.print(alist_ques.get(0));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <!--<span style="margin-right: 95%; color: black; text-decoration: underline;font-weight: bold;">ANSWER:</span>-->
                            <li>A<input type="radio" name="ans1" required="" id="ans" value="1"><span id="span_1_1"><%=alist_ans1.get(0)%></span></input></li>
                            <li>B<input type="radio" name="ans1" id="ans" value="2"><span id="span_1_2"><%=alist_ans2.get(0)%></span></input></li>
                            <li>C<input type="radio" name="ans1" id="ans" value="3"><span id="span_1_3"><%=alist_ans3.get(0)%></span></input></li>
                            <li>D<input type="radio" name="ans1" id="ans" value="4"><span id="span_1_4"><%=alist_ans4.get(0)%></span></input></li>
                            <input type="hidden" name="ans1" id="ans" checked="checked" value="A"></input>
                        </div>
                        <!--######## 2  #######-->
                        <div class="questions" id="q_div2">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 2</span>
                            <% if (alist_qid.get(1).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q1">  <%out.print(alist_ques.get(1));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans2" required="" id="ans" value="1"><span id="span_2_1"><%=alist_ans1.get(1)%></span></input></li>
                            <li>B<input type="radio" name="ans2" id="ans" value="2"><span id="span_2_2"><%=alist_ans2.get(1)%></span></input></li>
                            <li>C<input type="radio" name="ans2" id="ans" value="3"><span id="span_2_3"><%=alist_ans3.get(1)%></span></input></li>
                            <li>D<input type="radio" name="ans2" id="ans" value="4"><span id="span_2_4"><%=alist_ans4.get(1)%></span></input></li>
                            <input type="hidden" name="ans2" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 3  #######-->
                        <div class="questions" id="q_div3">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 3</span>
                            <% if (alist_qid.get(2).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q3">  <%out.print(alist_ques.get(2));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans3" required="" id="ans" value="1"><span id="span_3_1"><%=alist_ans1.get(2)%></span></input></li>
                            <li>B<input type="radio" name="ans3" id="ans" value="2"><span id="span_3_2"><%=alist_ans2.get(2)%></span></input></li>
                            <li>C<input type="radio" name="ans3" id="ans" value="3"><span id="span_3_3"><%=alist_ans3.get(2)%></span></input></li>
                            <li>D<input type="radio" name="ans3" id="ans" value="4"><span id="span_3_4"><%=alist_ans4.get(2)%></span></input></li>
                            <input type="hidden" name="ans3" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 4  #######-->
                        <div class="questions" id="q_div4">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 4</span>
                            <% if (alist_qid.get(3).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q4">  <%out.print(alist_ques.get(3));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans4" required="" id="ans" value="1"><span id="span_4_1"><%=alist_ans1.get(3)%></span></input></li>
                            <li>B<input type="radio" name="ans4" id="ans" value="2"><span id="span_4_2"><%=alist_ans2.get(3)%></span></input></li>
                            <li>C<input type="radio" name="ans4" id="ans" value="3"><span id="span_4_3"><%=alist_ans3.get(3)%></span></input></li>
                            <li>D<input type="radio" name="ans4" id="ans" value="4"><span id="span_4_4"><%=alist_ans4.get(3)%></span></input></li>
                            <input type="hidden" name="ans4" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 5  #######-->
                        <div class="questions" id="q_div5">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 5</span>
                            <% if (alist_qid.get(4).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q5">  <%out.print(alist_ques.get(4));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans5" required="" id="ans" value="1"><span id="span_5_1"><%=alist_ans1.get(4)%></span></input></li>
                            <li>B<input type="radio" name="ans5" id="ans" value="2"><span id="span_5_2"><%=alist_ans2.get(4)%></span></input></li>
                            <li>C<input type="radio" name="ans5" id="ans" value="3"><span id="span_5_3"><%=alist_ans3.get(4)%></span></input></li>
                            <li>D<input type="radio" name="ans5" id="ans" value="4"><span id="span_5_4"><%=alist_ans4.get(4)%></span></input></li>
                            <input type="hidden" name="ans5" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 6  #######-->
                        <div class="questions" id="q_div6">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 6</span>
                            <% if (alist_qid.get(5).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q6">  <%out.print(alist_ques.get(4));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans6" required="" id="ans" value="1"><span id="span_6_1"><%=alist_ans1.get(5)%></span></input></li>
                            <li>B<input type="radio" name="ans6" id="ans" value="2"><span id="span_6_2"><%=alist_ans2.get(5)%></span></input></li>
                            <li>C<input type="radio" name="ans6" id="ans" value="3"><span id="span_6_3"><%=alist_ans3.get(5)%></span></input></li>
                            <li>D<input type="radio" name="ans6" id="ans" value="4"><span id="span_6_4"><%=alist_ans4.get(5)%></span></input></li>
                            <input type="hidden" name="ans6" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 7  #######-->
                        <div class="questions" id="q_div7">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 7</span>
                            <% if (alist_qid.get(6).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q7">  <%out.print(alist_ques.get(6));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans7" required="" id="ans" value="1"><span id="span_7_1"><%=alist_ans1.get(6)%></span></input></li>
                            <li>B<input type="radio" name="ans7" id="ans" value="2"><span id="span_7_2"><%=alist_ans2.get(6)%></span></input></li>
                            <li>C<input type="radio" name="ans7" id="ans" value="3"><span id="span_7_3"><%=alist_ans3.get(6)%></span></input></li>
                            <li>D<input type="radio" name="ans7" id="ans" value="4"><span id="span_7_4"><%=alist_ans4.get(6)%></span></input></li>
                            <input type="hidden" name="ans7" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 8  #######-->
                        <div class="questions" id="q_div8">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 8</span>
                            <% if (alist_qid.get(7).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q8">  <%out.print(alist_ques.get(7));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans8" required="" id="ans" value="1"><span id="span_8_1"><%=alist_ans1.get(7)%></span></input></li>
                            <li>B<input type="radio" name="ans8" id="ans" value="2"><span id="span_8_2"><%=alist_ans2.get(7)%></span></input></li>
                            <li>C<input type="radio" name="ans8" id="ans" value="3"><span id="span_8_3"><%=alist_ans3.get(7)%></span></input></li>
                            <li>D<input type="radio" name="ans8" id="ans" value="4"><span id="span_8_4"><%=alist_ans4.get(7)%></span></input></li>
                            <input type="hidden" name="ans8" id="ans" checked="checked" value="A"></input>

                        </div>
                        <!--######## 9  #######-->
                        <div class="questions" id="q_div9">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 9</span>
                            <% if (alist_qid.get(8).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q9">  <%out.print(alist_ques.get(8));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans9" required="" id="ans" value="1"><span id="span_9_1"><%=alist_ans1.get(8)%></span></input></li>
                            <li>B<input type="radio" name="ans9" id="ans" value="2"><span id="span_9_2"><%=alist_ans2.get(8)%></span></input></li>
                            <li>C<input type="radio" name="ans9" id="ans" value="3"><span id="span_9_3"><%=alist_ans3.get(8)%></span></input></li>
                            <li>D<input type="radio" name="ans9" id="ans" value="4"><span id="span_9_4"><%=alist_ans4.get(8)%></span></input></li>
                            <input type="hidden" name="ans9" id="ans" checked="checked" value="A"></input>

                        </div>

                        <!--######## 10  #######-->
                        <div class="questions" id="q_div10">
                            <span style="margin-right: 95%;color: black;text-decoration: underline;font-weight:bold;">Q : 10</span>
                            <% if (alist_qid.get(9).equals(46)) {
                            %>
                            <img src="pic/q46.png"style="margin-left: 20%;">         
                            <%} else {%>
                            <li id="q10">  <%out.print(alist_ques.get(9));%> </li>
                                <%}%>
                        </div>
                        <div class="ans">
                            <li>A<input type="radio" name="ans10" required="" id="ans" value="1"><span id="span_10_1"><%=alist_ans1.get(9)%></span></input></li>
                            <li>B<input type="radio" name="ans10" id="ans" value="2"><span id="span_10_2"><%=alist_ans2.get(9)%></span></input></li>
                            <li>C<input type="radio" name="ans10" id="ans" value="3"><span id="span_10_3"><%=alist_ans3.get(9)%></span></input></li>
                            <li>D<input type="radio" name="ans10" id="ans" value="4"><span id="span_10_4"><%=alist_ans4.get(9)%></span></input></li>
                            <input type="hidden" name="ans10" id="ans" checked="checked" value="A"></input>
                        </div> <!--######## 11  #######-->

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

                        <input type="submit" name="b1" id="next" class="next" value="Submit"></input>
                </form>
            </div>
        </div>
        <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
            <%        } catch (Exception ex) {
                    out.print(ex);
                }
            %>
    </div>
</body>
</html>
