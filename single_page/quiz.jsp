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
                width: 70%;
                height: 400px;
                margin-left: auto;
                margin-right: auto;
                /*margin-top: 300px;*/
                background-color: beige;
            }
            li{
                margin-left: 5%;
                padding-top: 10px;
                /*margin-right:40%;*/
            }

            .submit{
                padding: 10px 10px;
                margin-left: 40%;
                margin-top: 10%;

            }
            .div_answer{
                list-style: none;
                background-color:burlywood;
                border-radius: 10px;

            }
            .div_question{
                background-color:  aliceblue;
                height: 65%;
                border-radius: 20px;
            }
            .ok{
                margin-left:40%;
            }
        </style>
        <!--        <script src="js/jquery_3.4.1.min.js"></script>-->
        <script src="js/jquery-3.4.1.js"></script>
        <script>

            $(document).ready(function () {
                //                var ques;
                //                var ans;
                let totel_data = [], data, total = 0;
                $("#next").click(function () {
                    var section = $('input:radio[name="ans"]:checked').val();
                    var x=$("#qid").val();
                    alert(section);
                    alert(x);
                    $.ajax({
                        type: "POST",
                        url: "quiz_insert.jsp",
                        data: {tid: $("#tid").val(), qid: $("#qid").val(), aadhar_no: $("#aadhar_no").val(),
                            sub: $("#sub").val(), your_ans: $('input:radio[name="ans"]:checked').val(),
                            std_name: $("#std_name").val()},
                        success: function (data) {
                            alert(data);
                            console.log(data);
                            totel_data = data.split("&");
                            for (let i = 0; i < totel_data.length - 1; i++) {
                                console.log(totel_data[i]);
                                console.log(totel_data.length);
                            }
                            //                            alert(totel_data[i]);
                            document.getElementById("ques_no").innerHTML = totel_data[0];
                            $("#qid").val(totel_data[0]);
                            document.getElementById("div_question").innerHTML = totel_data[1];
                            document.getElementById("spam_1").innerHTML = totel_data[3];
                            document.getElementById("spam_2").innerHTML = totel_data[2];
                            document.getElementById("spam_3").innerHTML = totel_data[4];
                            document.getElementById("spam_4").innerHTML = totel_data[5];
                           
                        }
                    })
                });
            });

        </script> 



    </head>
    <%
       
        
        db_connection obj = new db_connection();
        Connection con = obj.getConnection();
        Statement st = con.createStatement();

        String std_name, aadhar_no, dep, year_of_pass, colg, doe, mobile_no, sub;
        String question = "", ans1 = "", ans2 = "", ans3 = "", ans4 = "", correct_ans = "";
        int tid = 0;
        int qid = 0;
        std_name = request.getParameter("std_name");
        aadhar_no = request.getParameter("aadhar_no");
        dep = request.getParameter("dep");
        year_of_pass = request.getParameter("year_of_pass");
        colg = request.getParameter("colg");
        doe = request.getParameter("doe");
        mobile_no = request.getParameter("mobile_no");
        sub = request.getParameter("sub");
//if(qid>0){
        if (sub.equals("ECE")) {
            ResultSet rs = st.executeQuery("SELECT qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE tid='1' and qid = '1'");
            while (rs.next()) {
                qid = rs.getInt(1);
                question = rs.getString(2);
                ans1 = rs.getString(3);
                ans2 = rs.getString(4);
                ans3 = rs.getString(5);
                ans4 = rs.getString(6);
                correct_ans = rs.getString(7);
                tid = 1;
            }

        } else {
            ResultSet rs = st.executeQuery("SELECT qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions WHERE tid='2' and qid = '31'");
            while (rs.next()) {
                qid = rs.getInt(1);
                question = rs.getString(2);
                ans1 = rs.getString(3);
                ans2 = rs.getString(4);
                ans3 = rs.getString(5);
                ans4 = rs.getString(6);
                correct_ans = rs.getString(7);
                tid = 2;
            }

//        }
        }
    %>
    <body>
        <div class="main">
            <!--<form action="quiz_1.jsp" method="post" >-->
            <div class="sub">
                <h1>ONLINE EXAM</h1>
                <input type="hidden" name="std_name" id="std_name" value="<%=std_name%>">
                <input type="hidden" name="aadhar_no" id="aadhar_no" value="<%=aadhar_no%>">
                <input type="hidden" name="dep" id="dep" value="<%=dep%>">
                <input type="hidden" name="year_of_pass" id="year_of_pass" value="<%=year_of_pass%>">
                <input type="hidden" name="colg" id="colg" value="<%=colg%>">
                <input type="hidden" name="doe" id="doe" value="<%=doe%>">
                <input type="hidden" name="mobile_no" id="mobile_no" value="<%=mobile_no%>">
                <input type="hidden" name="sub" id="sub" value="<%=sub%>">
                <input type="hidden" name="tid" id="tid" value="<%=tid%>">
                <input type="hidden" name="correct_ans" id="correct_ans" value="<%=correct_ans%>">
                <input type="hidden" name="qid" id="qid" value="<%out.print(qid);%>"></input>
                <input type="hidden" name="question"  value="<%=question%>">
                <input type="hidden" name="ans1"  value="<%=ans1%>">
                <input type="hidden" name="ans2" value="<%=ans2%>">
                <input type="hidden" name="ans3" value="<%=ans3%>">
                <input type="hidden" name="ans4" value="<%=ans4%>">
                <input type="hidden" name="correct_ans" value="<%=correct_ans%>">
            </div>
            <h2 style="text-align: center;">EXAM</h2> 
            <h3 style="text-align: center;">Hi <%=std_name%> your choosing <%=sub%> Subject</h3> 
            <h4>QUESTION NO :<span id="ques_no"><%=qid%></span></h4>
            <div class="sub_1">
                <div class="div_question" id="div_question">
                    <h4 style="text-decoration: underline">QUESTION:</h4>
                    <%=question%>   
                </div>
                <div class="div_answer">
                    <li>A<input type="radio" name="ans" id="ans" value="1"><span id="spam_1"><%=ans1%></span></input></li>
                    <li>B<input type="radio" name="ans" id="ans" value="2"><span id="spam_2"><%=ans2%></span></input></li>
                    <li>C<input type="radio" name="ans" id="ans" value="3"><span id="spam_3"><%=ans3%></span></input></li>
                    <li>D<input type="radio" name="ans" id="ans" value="4"><span id="spam_4"><%=ans4%></span></input></li>
                </div>

                <!--<button name="b1" id="ok" class="ok">NEXT</button>-->
                <!--<input type="submit" name="b1" id="next" class="next" value="NEXT"></input>-->
                <input type="button" name="b1" id="next" class="next" value="NEXT"></button>
            </div>
            <footer><p align="center">&copy; <%=2019%> Avalon Technologies </p></footer>
            <!--</form>-->
        </div>
    </body>
</html>
