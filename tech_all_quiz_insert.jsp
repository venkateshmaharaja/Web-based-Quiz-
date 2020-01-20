<%-- 
    Document   : tech_all_quiz_insert
    Created on : 21 Dec, 2019, 1:27:32 PM
    Author     : AV-IT-PC345
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Insert</title>

        <style>
            .container {
                position: absolute;
                width: 200px;
                height: 200px;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
            }

            .item {
                width: 100px;
                height: 100px;
                position: absolute;
            }

            .item-1 {
                background-color: #FA5667;
                top: 0;
                left: 0;
                z-index: 1;
                animation: item-1_move 1.8s cubic-bezier(.6,.01,.4,1) infinite;
            }

            .item-2 {
                background-color: #7A45E5;
                top: 0;
                right: 0;
                animation: item-2_move 1.8s cubic-bezier(.6,.01,.4,1) infinite;
            }

            .item-3 {
                background-color: #1B91F7;
                bottom: 0;
                right: 0;
                z-index: 1;
                animation: item-3_move 1.8s cubic-bezier(.6,.01,.4,1) infinite;
            }

            .item-4 {
                background-color: #FAC24C;
                bottom: 0;
                left: 0;
                animation: item-4_move 1.8s cubic-bezier(.6,.01,.4,1) infinite;
            }

            @keyframes item-1_move {
                0%, 100% {transform: translate(0, 0)} 
                25% {transform: translate(0, 100px)} 
                50% {transform: translate(100px, 100px)} 
                75% {transform: translate(100px, 0)} 
            }

            @keyframes item-2_move {
                0%, 100% {transform: translate(0, 0)} 
                25% {transform: translate(-100px, 0)} 
                50% {transform: translate(-100px, 100px)} 
                75% {transform: translate(0, 100px)} 
            }

            @keyframes item-3_move {
                0%, 100% {transform: translate(0, 0)} 
                25% {transform: translate(0, -100px)} 
                50% {transform: translate(-100px, -100px)} 
                75% {transform: translate(-100px, 0)} 
            }

            @keyframes item-4_move {
                0%, 100% {transform: translate(0, 0)} 
                25% {transform: translate(100px, 0)} 
                50% {transform: translate(100px, -100px)} 
                75% {transform: translate(0, -100px)} 
            }
        </style>

        <script src="js/jquery_3.4.1.min.js"></script>
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
        <!--      <div class="container">
          <div class="item item-1"></div>
          <div class="item item-2"></div>
          <div class="item item-3"></div>
          <div class="item item-4"></div>
        </div>-->

        <%
            try {
                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();

                String std_name = "";
//                int aadhar_no ;
                String aadhar_no = "";
                String tid = "";
                String qid = "";
                String question = "";
                String ans1 = "";
                String ans2 = "";
                String ans3 = "";
                String ans4 = "";
                int mark = 0;
                int j = 0;
                String your_ans = "A";
                String correct_ans = "";
//***** question id get START *****
                String q1 = "";
                String q2 = "";
                String q3 = "";
                String q4 = "";
                String q5 = "";
                String q6 = "";
                String q7 = "";
                String q8 = "";
                String q9 = "";
                String q10 = "";
                String q11 = "";
                String q12 = "";
                String q13 = "";
                String q14 = "";
                String q15 = "";
                String q16 = "";
                String q17 = "";
                String q18 = "";
                String q19 = "";
                String q20 = "";

                tid = request.getParameter("tid");
//                aadhar_no = Integer.parseInt(request.getParameter("aadhar_no"));
                aadhar_no = request.getParameter("aadhar_no");

                q1 = request.getParameter("al_q1");
                q2 = request.getParameter("al_q2");
                q3 = request.getParameter("al_q3");
                q4 = request.getParameter("al_q4");
                q5 = request.getParameter("al_q5");
                q6 = request.getParameter("al_q6");
                q7 = request.getParameter("al_q7");
                q8 = request.getParameter("al_q8");
                q9 = request.getParameter("al_q9");
                q10 = request.getParameter("al_q10");
                q11 = request.getParameter("al_q11");
                q12 = request.getParameter("al_q12");
                q13 = request.getParameter("al_q13");
                q14 = request.getParameter("al_q14");
                q15 = request.getParameter("al_q15");
                q16 = request.getParameter("al_q16");
                q17 = request.getParameter("al_q17");
                q18 = request.getParameter("al_q18");
                q19 = request.getParameter("al_q19");
                q20 = request.getParameter("al_q20");

                ArrayList al_qno = new ArrayList();
                al_qno.add(0, q1);
                al_qno.add(1, q2);
                al_qno.add(2, q3);
                al_qno.add(3, q4);
                al_qno.add(4, q5);
                al_qno.add(5, q6);
                al_qno.add(6, q7);
                al_qno.add(7, q8);
                al_qno.add(8, q9);
                al_qno.add(9, q10);
                al_qno.add(10, q11);
                al_qno.add(11, q12);
                al_qno.add(12, q13);
                al_qno.add(13, q14);
                al_qno.add(14, q15);
                al_qno.add(15, q16);
                al_qno.add(16, q17);
                al_qno.add(17, q18);
                al_qno.add(18, q19);
                al_qno.add(19, q20);
//                out.print("<br>" + al_qno);

//***** question id get END *****
                String answer1 = "";
                String answer2 = "";
                String answer3 = "";
                String answer4 = "";
                String answer5 = "";
                String answer6 = "";
                String answer7 = "";
                String answer8 = "";
                String answer9 = "";
                String answer10 = "";
                String answer11 = "";
                String answer12 = "";
                String answer13 = "";
                String answer14 = "";
                String answer15 = "";
                String answer16 = "";
                String answer17 = "";
                String answer18 = "";
                String answer19 = "";
                String answer20 = "";

                ArrayList al_answer = new ArrayList();
                al_answer.add(0, answer1 = request.getParameter("ans1"));
                al_answer.add(1, answer2 = request.getParameter("ans2"));
                al_answer.add(2, answer3 = request.getParameter("ans3"));
                al_answer.add(3, answer4 = request.getParameter("ans4"));
                al_answer.add(4, answer5 = request.getParameter("ans5"));
                al_answer.add(5, answer6 = request.getParameter("ans6"));
                al_answer.add(6, answer7 = request.getParameter("ans7"));
                al_answer.add(7, answer8 = request.getParameter("ans8"));
                al_answer.add(8, answer9 = request.getParameter("ans9"));
                al_answer.add(9, answer10 = request.getParameter("ans10"));
                al_answer.add(10, answer11 = request.getParameter("ans11"));
                al_answer.add(11, answer12 = request.getParameter("ans12"));
                al_answer.add(12, answer13 = request.getParameter("ans13"));
                al_answer.add(13, answer14 = request.getParameter("ans14"));
                al_answer.add(14, answer15 = request.getParameter("ans15"));
                al_answer.add(15, answer16 = request.getParameter("ans16"));
                al_answer.add(16, answer17 = request.getParameter("ans17"));
                al_answer.add(17, answer18 = request.getParameter("ans18"));
                al_answer.add(18, answer19 = request.getParameter("ans19"));
                al_answer.add(19, answer20 = request.getParameter("ans20"));
//                out.print("<br>" + al_answer);

                //  *****          student name fetch  *START*   *********            
                ResultSet std_details_rs = st.executeQuery("SELECT std_name,aadhar_no from users where aadhar_no='" + aadhar_no + "'");
                while (std_details_rs.next()) {
                    std_name = std_details_rs.getString(1);
                    aadhar_no = std_details_rs.getString(2);
                }
//                out.print("<br>" + std_name);
//                out.print("<br>" + aadhar_no);
                //  *****          student name fetch  *END*   *********   
                for (int i = 0; i <= 19; i++) {
                    ResultSet rs = st.executeQuery("SELECT tid,qid,question,ans1,ans2,ans3,ans4,correct_ans FROM questions_1 WHERE qid='" + al_qno.get(i) + "' and tid='" + tid + "'");

                    while (rs.next()) {

                        tid = rs.getString(1);
                        qid = rs.getString(2);
                        question = rs.getString(3);
                        ans1 = rs.getString(4);
                        ans2 = rs.getString(5);
                        ans3 = rs.getString(6);
                        ans4 = rs.getString(7);
                        correct_ans = rs.getString(8);

                        PreparedStatement ps = con.prepareStatement("INSERT INTO quiz_history(std_name,aadhar_no,tid,qid,question,ans1,"
                                + "ans2,ans3,ans4,correct_ans,your_ans,mark) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");

                        ps.setString(1, std_name);
                        ps.setString(2, aadhar_no);
                        ps.setString(3, tid);
                        ps.setString(4, qid);
                        ps.setString(5, question);
                        ps.setString(6, ans1);
                        ps.setString(7, ans2);
                        ps.setString(8, ans3);
                        ps.setString(9, ans4);
                        ps.setString(10, correct_ans);
                        ps.setString(11, al_answer.get(i).toString());
                        if (correct_ans.equals(al_answer.get(i).toString())) {
                            mark = 1;
                        } else {
                            mark = 0;
                        }
                        ps.setInt(12, mark);
                        j = ps.executeUpdate();

                    }

                }
                if (j > 0) {
                    out.println("<div class='container'>");
                    out.println("<div class='item item-1'>");
                    out.println("<div class='item item-2'>");
                    out.println("<div class='item item-3'>");
                    out.println("<div class='item item-4'>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<script type=\"text/javascript\">");
                    out.write("setTimeout(function(){window.location.href='apt_begining.jsp?aadhar=" + aadhar_no + "'},2000);");
                    out.println("</script>");
                }
            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
