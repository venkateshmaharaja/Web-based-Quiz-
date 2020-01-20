<%-- 
    Document   : select_test
    Created on : 14 Dec, 2019, 4:35:58 PM
    Author     : AV-IT-PC345
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank You</title>
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
        <style>

            body {
                background-color: #f8f0d5;
                text-align: center;
            }

            #thankyou {
                background-color: white;
                border-radius: 20px;
                height: 190px;
                width: 300px;
                border: 6px solid #e2552d;
                box-shadow: 7px 7px 4px #4999b6;
                margin: 200px auto 50px;
                text-align: center;
                -webkit-animation: flash 1.2s ease 0s infinite;
                animation: flash 1.2s ease 0s infinite;
            }

            #h2thankyou {
                color: #4999b6;
                padding: 0px;
                font-size: 40px;
                font-family: 'Open Sans', 'sans-serif';
                -webkit-animation: flashtwo 1.2s linear 0s infinite;
                animation: flashtwo 1.2s linear 0s infinite;
            }

            @keyframes flash {
                0% {
                    background-color: white;
                }
                49% {
                    background-color: white;
                }
                50% {
                    background-color: #e2552d;
                }
                100% {
                    background-color: #e2552d;
                }
            }

            @keyframes flashtwo {
                0% {
                    color: #e2552d;
                }
                49% {
                    color: #e2552d;
                }
                50% {
                    color: white;
                }
                100% {
                    color: white;
                }
            }

        </style>
    </head>
    <body>
        <div id="thankyou">
            <h2 id="h2thankyou">Thank you ! !
                <br>&#8902;<br>
            Participants
            </h2>
        </div>
        <footer></footer>
    </body>
</html>
