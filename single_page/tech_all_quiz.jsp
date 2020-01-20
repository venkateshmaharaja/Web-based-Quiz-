<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

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
                margin-left:45%;
                margin-top:10px;
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

        </style>
        <script src="js/jquery_3.4.1.min.js"></script>
        <!--<script src="js/jquery-3.4.1.js"></script>-->

        <script>
            $(document.ready(function (){
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
                <!--<h1 style="line-height: 0px;">AVALON TECHNOLOGIES</h1>-->
                <input type="hidden" name="std_name" id="std_name" value="<%=std_name%>">
                <input type="hidden" name="aadhar_no" id="aadhar_no" value="<%=aadhar_no%>">
                <input type="hidden" name="sub" id="sub" value="<%=sub%>">
            </div>
            <h2 style="text-align: center;">ONLINE EXAM</h2> 
            <h3 style="text-align: center;">Hi <%=std_name%> your choosing <%=sub%> Subject</h3> 
            <h4 align="center" style="color:brown;">Instruction : 20 Minitus only no negative marks    </h4>
            <div class="sub_1">
                <br>
                <table class="table">
                    <tr>
                        <th colspan="8">TECHNICAL QUESTIONS</th>
                    </tr>

                    <tr>
                        <th style="width: 4%">Q-NO</th>
                        <th style="width: 20%"> QUESTION </th>
                        <th style="width: 10%">ANS - A</th>
                        <th style="width: 10%">ANS - B</th>
                        <th style="width: 10%">ANS - C</th>
                        <th style="width: 10%">ANS - D</th>
                        <th style="width: 4%">CHOOSE</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>YOUR NAME nkdfkfk fnknrkf nknfjnffwfwferfgerg4rgergrtg4rtgdfgetg4rg4ev4tg4tgrgt3g4grrtght6yhrghybkbkbfmejhijekj
                            erg4rgergrtg4rtgdfgetg4rg4ev4tg4tgrgt3g4grrtght6yhrghybkbkbfmejhijekj
                            jkn lknerlfenjfn jnjnfjke jklnjfnerjf lnjnfkjn sbcuv hdvbehvb hgdfhh </td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans1" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans1" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans1" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans1" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>YOUR NAME</td>
                        <td>Adv,nskkjgkgbtgbtbjkfgbdfkbgkbgdfkgrkjtgfhkhk</td>
                        <td>kbgdfkgrkjtgfhkhkB</td>
                        <td>CAdv,nskkjgkgbtgbtb</td>
                        <td>DAdkbgdfkgrkjtgfhkhk</td>
                        <td>A<input type="radio" name="ans2" id="ans" value="1"> 
                            <br>
                            B<input type="radio" name="ans2" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans2" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans2" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans3" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans3" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans3" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans3" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans4" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans4" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans4" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans4" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans5" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans5" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans5" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans5" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans6" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans6" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans6" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans6" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans7" id="ans" value="1"> 
                            <br>
                            B<input type="radio" name="ans7" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans7" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans7" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans8" id="ans" value="1"> 
                            <br>
                            B<input type="radio" name="ans8" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans8" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans8" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans9" id="ans" value="1"> 
                            <br>
                            B<input type="radio" name="ans9" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans9" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans9" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans10" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans10" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans10" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans10" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans11" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans11" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans11" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans11" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans12" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans12" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans12" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans12" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans13" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans13" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans13" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans13" id="ans" value="4">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td>14</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans14" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans14" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans14" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans14" id="ans" value="4">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td>15</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans15" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans15" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans15" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans15" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>16</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans16" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans16" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans16" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans16" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>17</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans17" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans17" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans17" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans17" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>18</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans18" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans18" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans18" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans18" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>19</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans19" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans19" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans19" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans19" id="ans" value="4">
                        </td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>YOUR NAME</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>A<input type="radio" name="ans20" id="ans" value="1">
                            <br>
                            B<input type="radio" name="ans20" id="ans" value="2">
                            <br>
                            C<input type="radio" name="ans20" id="ans" value="3">
                            <br>
                            D<input type="radio" name="ans20" id="ans" value="4">
                        </td>
                    </tr>

                    <!--                    <li>A<input type="radio" name="ans" id="ans" value="1"><span id="span_1"></span></input></li>
                                        <li>B<input type="radio" name="ans" id="ans" value="2"><span id="span_2"></span></input></li>
                                        <li>C<input type="radio" name="ans" id="ans" value="3"><span id="span_3"></span></input></li>
                                        <li>D<input     type="radio" name="ans" id="ans" value="4"><span id="span_4"></span></input></li>-->
                </table>
                <br>
            </div>
            <input type="button" name="b1" id="next" class="next" value="NEXT"></button>
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
