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
        <title>QUIZ</title>
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
                height: 400px;
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
                height: 50%;
                width: auto;
                border-radius: 10px;
                line-height: 0px;
                text-align: left;
                text-justify: auto;
            }
            .next{
                margin-left:45%;
                margin-top:10px;
                width: 60px;
                height: 30px;
                border-radius: 5px;
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
                        window.location.href = "thankyou.jsp";
                    }
                    document.getElementById('hms').innerHTML = newtime;
                    timeoutHandle = setTimeout(count, 1000);
                }
                count();



                var sub;
                let totel_data = [];
                let totel_data1 = [];
                sub = $("#sub").val();
                alert(sub);

                $.ajax({
                    type: "post",
                    url: "getfirst.jsp",
                    data: {sub: sub},
                    success: function (data) {
                        alert(data);
                        totel_data = data.split("&");
                        for (let i = 0; i <= totel_data.length - 1; i++)
                        {
                            $("#qid").val(totel_data[0]);
                            $("#question").val(totel_data[1]);
                            $("#ans1").val(totel_data[2]);
                            $("#ans2").val(totel_data[3]);
                            $("#ans3").val(totel_data[4]);
                            $("#ans4").val(totel_data[5]);
                            $("#correct_ans").val(totel_data[6]);
                            $("#tid").val(totel_data[7]);


                            document.getElementById("ques_no").innerHTML = totel_data[0];
                            document.getElementById("div_question").innerHTML = totel_data[1];
                            document.getElementById("span_1").innerHTML = totel_data[2];
                            document.getElementById("span_2").innerHTML = totel_data[3];
                            document.getElementById("span_3").innerHTML = totel_data[4];
                            document.getElementById("span_4").innerHTML = totel_data[5];

                        }
                    }


                });

                $("#next").click(function () {
                    var section = $('input:radio[name="ans"]:checked').val();
                    var x1 = document.getElementById("question").value;
                    var y = document.getElementById("std_name").value;
                    var z = document.getElementById("aadhar_no").value;
                    var xx = document.getElementById("tid").value;
                    var yy = document.getElementById("qid").value;
                    var zz = document.getElementById("ans1").value;
                    var zz1 = document.getElementById("ans2").value;
                    var zz2 = document.getElementById("ans3").value;
                    var zz3 = document.getElementById("ans4").value;
                    var zz4 = document.getElementById("correct_ans").value;
                    alert(section);
                    $.ajax({
                        type: "POST",
                        url: "quiz_insert.jsp",
                        data: {
                            your_ans: $('input:radio[name="ans"]:checked').val(),
                            aadhar_no: z,
                            tid: xx,
                            qid: yy,
                        },
                        success: function (data) {
                            alert(data);
                            console.log(data);
                            totel_data1 = data.split("&");
                            alert(totel_data1.length);
                            for (let j = 0; j <= totel_data1.length - 1; j++)
                            {
                                if (totel_data1[0] == "") {
                                    alert("no value");
                                    window.location.href = "thankyou.jsp";
                                    break;
                                } else {
                                    $("#qid").val(totel_data1[0]);
                                    $("#question").val(totel_data1[1]);
                                    $("#ans1").val(totel_data1[2]);
                                    $("#ans2").val(totel_data1[3]);
                                    $("#ans3").val(totel_data1[4]);
                                    $("#ans4").val(totel_data1[5]);
//                              
                                    document.getElementById("ques_no").innerHTML = totel_data1[0];
                                    document.getElementById("div_question").innerHTML = totel_data1[1];
                                    document.getElementById("span_1").innerHTML = totel_data1[2];
                                    document.getElementById("span_2").innerHTML = totel_data1[3];
                                    document.getElementById("span_3").innerHTML = totel_data1[4];
                                    document.getElementById("span_4").innerHTML = totel_data1[5];

                                    $('input:radio[name="ans"]').prop('checked', false);
                                }
                            }

                        }

                    })

                });


            });

        </script> 



    </head>
    <%
        try {
            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();
            //String sub="";

            String std_name = "", aadhar_no = "", dep = "", year_of_pass = "", colg = "", doe = "", mobile_no = "", sub = "";
            String qid = "", question = "", ans1 = "", ans2 = "", ans3 = "", ans4 = "", correct_ans = "", ans = "", tid = "";
            int j = 0, mark = 0;
            std_name = request.getParameter("std_name");
            sub = request.getParameter("sub");
            aadhar_no = request.getParameter("aadhar_no");
    %>
    <body style="margin-top: 0px; ">
        <div class="main" style="margin-top: 0px; ">
            <h4 style="text-align: left;" id="hms">00:00:30</h4>
            <div class="sub" style="margin: 0px;padding: 0px;">
                <h1 style="line-height: 0px;">AVALON TECHNOLOGIES</h1>
                <input type="hidden" name="std_name" id="std_name" value="<%=std_name%>">
                <input type="hidden" name="aadhar_no" id="aadhar_no" value="<%=aadhar_no%>">
                <input type="hidden" name="dep" id="dep" value="">
                <input type="hidden" name="year_of_pass" id="year_of_pass" value="">
                <input type="hidden" name="colg" id="colg" value="">
                <input type="hidden" name="doe" id="doe" value="">
                <input type="hidden" name="mobile_no" id="mobile_no" value="">
                <input type="hidden" name="sub" id="sub" value="<%=sub%>">
                <input type="hidden" name="tid" id="tid" value="">
                <input type="hidden" name="qid" id="qid" value="">
                <input type="hidden" name="question" id="question" value="">
                <input type="hidden" name="ans1" id="ans1" value="">
                <input type="hidden" name="ans2" id="ans2" value="">
                <input type="hidden" name="ans3" id="ans3" value="">
                <input type="hidden" name="ans4" id="ans4" value="">
                <input type="hidden" name="correct_ans" id="correct_ans" value="">

            </div>
            <h2 style="text-align: center;">ONLINE EXAM</h2> 
            <h3 style="text-align: center;">Hi <%=std_name%> your choosing <%=sub%> Subject</h3> 
            <h4>QUESTION NO :<span id="ques_no"></span></h4>
            <div class="sub_1">
                <!--                <h5 style="text-decoration: underline">QUESTION:</h5>-->
                &nbsp;<div class="div_question" id="div_question">

                </div>
                <div class="div_answer">
                    <li>A<input type="radio" name="ans" id="ans" value="1"><span id="span_1"></span></input></li>
                    <li>B<input type="radio" name="ans" id="ans" value="2"><span id="span_2"></span></input></li>
                    <li>C<input type="radio" name="ans" id="ans" value="3"><span id="span_3"></span></input></li>
                    <li>D<input type="radio" name="ans" id="ans" value="4"><span id="span_4"></span></input></li>
                </div>

                <!--<button name="b1" id="ok" class="ok">NEXT</button>-->
                <input type="button" name="b1" id="next" class="next" value="NEXT"></button>
            </div>
            <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
            <!--            </form>-->
            <%
                } catch (Exception ex) {
                    out.print(ex);
                }
            %>
        </div>
    </body>
</html>
