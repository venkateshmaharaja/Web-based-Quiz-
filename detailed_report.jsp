<%-- 
    Document   : detailed_report
    Created on : 24 Dec, 2019, 4:31:10 PM
    Author     : AV-IT-PC345
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="exam.db_connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DETAILED REPORT</title>
    </head>
    <body>
        <%
            try {
                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();
                String aadhar_no = request.getParameter("aadhar_no");
//                out.print(aadhar_no);
        %>
    <html>
        <head>
            <style>
                body {

                }
                page {
                    background: white;
                    display: block;
                    margin: 0 auto;
                    margin-bottom: 0.5cm;

                }
                page[size="A4"] {  
                    width: 21cm;
                    height: 29.7cm; 
                }

                @media print {
                    body, page {
                        margin: 0;
                        box-shadow: 0;
                    }
                }

                th{
                    border: 3px solid black ;
                    width:80px;
                    height: 20px;
                }
                h3{
                    border:1px solid black;
                }
                td{
                    padding-left: 45px;
                    padding-right: 30px;

                }
                table{
                    border-spacing: 0 8px;
                }

            </style>
        <body>
            <%        
                ResultSet user_rs = st.executeQuery("SELECT `id`, `std_name`, `aadhar_no`, `dep`, `year_of_pass`, `colg`, `doe`, `mobile_no`,`colg_place`, `cgpa` FROM `users` WHERE aadhar_no='" + aadhar_no + "'");
            %>
        <page size="A4">
            <center>
                <h2>BE - ECE / EEE / MECH</h2>
                <h3>DURATION - 20 MINUTES<h3></center>
                        <% while (user_rs.next()) {%>
                        <table style="font-size: 10; border-spacing: 0px;">
                            <tr>
                                <td>CANDIDATE NAME </td>
                                <td style="font-weight: 600;">:&nbsp;<%=user_rs.getString(2)%></td>
                                <td>DATE</td>
                                <td style="font-weight: 600;width: 100px;">:&nbsp;<%=user_rs.getString(7)%></td>
                            </tr>

                            <tr>
                                <td>MOBILE NO </td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(8)%></td>
                                <td>YEAR OF PASSING</td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(5)%></td>
                            </tr>

                            <tr>
                                <td>AADHAR  NO </td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(3)%></td>
                                <td>CGPA</td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(10)%></td>
                            </tr>

                            <tr>
                                <td >NAME OF THE COLLEGE </td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(6)%></td>
                            </tr>

                            <tr>
                                <td >COLLEGE PLACE</td>
                                <td  style="font-weight: 600;">:&nbsp;<%=user_rs.getString(9)%></td>
                            </tr>

                            <tr>
                                <td>SAMPLE ANSWER BOX</td>
                                <td style="font-weight: 600;">:&nbsp;<img src="pic/box.png" height="23px" width="83px"></td>
                            </tr>
                            </tr>
                            <%}%>
                            <table>
                                ___________________________________________________________________________________________________
                                <%
                                    ArrayList al_detailreport_1 = new ArrayList();
                                    ArrayList al_detailreport_2 = new ArrayList();
                                    
                                    ResultSet rs_quizhistory = st.executeQuery("SELECT `your_ans`  FROM `quiz_history` WHERE aadhar_no='" + aadhar_no + "' AND tid='1' OR tid='2'  ORDER BY qid ASC");
                                    while (rs_quizhistory.next()) {
                                        al_detailreport_1.add(rs_quizhistory.getString(1));
                                    }
//                                    out.print(al_detailreport_1);
                                %>
                                <center>
                                    <table>
                                        <tr>
                                            <td>1</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(0).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(0).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(0).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(0).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(1).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(1).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(1).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(1).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(2).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(2).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(2).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(2).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(3).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(3).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(3).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(3).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(4).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(4).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(4).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(4).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(5).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(5).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(5).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(5).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(6).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(6).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(6).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(6).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(7).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(7).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(7).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(7).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(8).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(8).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(8).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(8).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(9).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(9).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(9).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(9).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(10).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(10).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(10).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(10).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(11).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(11).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(11).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(11).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(12).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(12).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(12).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(12).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(13).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(13).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(13).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(13).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(14).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(14).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(14).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(14).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(15).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(15).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(15).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(15).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>17</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(16).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(16).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(16).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(16).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>18</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(17).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(17).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(17).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(17).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>19</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(18).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(18).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(18).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(18).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                        <tr>
                                            <td>20</td>
                                            <td>A</td>
                                            <%if (al_detailreport_1.get(19).toString().equals("1")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>B</td>
                                            <%if (al_detailreport_1.get(19).toString().equals("2")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>C</td>
                                            <%if (al_detailreport_1.get(19).toString().equals("3")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                            <td>D</td>
                                            <%if (al_detailreport_1.get(19).toString().equals("4")) {%>
                                            <th style="background-color: #0d0d0d;"></th>
                                                <%
                                                } else {
                                                %>
                                            <th></th>
                                                <%}%>
                                        </tr>
                                    </table>
                                    <center>
                                        <%ResultSet total_mark_rs = st.executeQuery("SELECT SUM(mark) from quiz_history WHERE aadhar_no='" + aadhar_no + "' and tid <>'3'");
                                            while (total_mark_rs.next()) {
                                        %>                                                
                                        <p align="right">TOTAL MARKS : <a style="text-decoration: underline;font-weight: 600;"><%=total_mark_rs.getString(1)%></a></p></center>
                                            <%                                 }
                                            %>
                                    <!--Technical details report *** END ***-->
                                    <br>
                                    <table>
                                        <!--Aptitude details report *** START ***-->

                                        <%
                                            ResultSet rs_quizhistory_1 = st.executeQuery("SELECT `your_ans`  FROM `quiz_history` WHERE tid='3' AND aadhar_no='" + aadhar_no + "' ORDER BY qid ASC");
                                            while (rs_quizhistory_1.next()) {
                                                al_detailreport_2.add(rs_quizhistory_1.getString(1));
                                            }
                                            
                                        %>
                                        <h2 align="center">BE - APTITUDE</h2>
                                        <h3 align="center">DURATION - 10 MINUTES<h3></center>
                                                <tr>
                                                    <td>1</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(0).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(0).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(0).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(0).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(1).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(1).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(1).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(1).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>

                                                <tr>
                                                    <td>3</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(2).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(2).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(2).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(2).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(3).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(3).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(3).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(3).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(4).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(4).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(4).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(4).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(5).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(5).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(5).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(5).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(6).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(6).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(6).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(6).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(7).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(7).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(7).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(7).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(8).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(8).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(8).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(8).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td>A</td>
                                                    <%if (al_detailreport_2.get(9).toString().equals("1")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>B</td>
                                                    <%if (al_detailreport_2.get(9).toString().equals("2")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>C</td>
                                                    <%if (al_detailreport_2.get(9).toString().equals("3")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                    <td>D</td>
                                                    <%if (al_detailreport_2.get(9).toString().equals("4")) {%>
                                                    <th style="background-color: #0d0d0d;"></th>
                                                        <%
                                                        } else {
                                                        %>
                                                    <th></th>
                                                        <%}%>
                                                </tr>
                                                </table>
                                                </center>

                                                <center>
                                                    <%ResultSet total_mark_rs_1 = st.executeQuery("SELECT SUM(mark) from quiz_history WHERE aadhar_no='" + aadhar_no + "' and tid ='3'");
                                                        while (total_mark_rs_1.next()) {
                                                    %>                                                
                                                    <p align="right">TOTAL MARKS : <a style="text-decoration: underline;font-weight: 600;"><%=total_mark_rs_1.getString(1)%></a></p></center>
                                                        <%                                 }
                                                        %>
                                                <br>
                                                </center>
                                                <%} catch (Exception ex) {
                                                        out.print(ex);
                                                    }%>
                                                </page>
                                                </html>
