<%-- 
    Document   : about_us
    Created on : 10-Apr-2024, 6:03:24?pm
    Author     : Dipak Paliya
--%>

<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .heading{

                text-align: center;
                margin:35px 0px;
            }

            .body{
                text-align: center;
                margin: 2px 20%;
                font-size: 1.2rem;
                font-weight: 500;
                word-spacing: 4px;
                line-height: 2;

            }
            .body p{
                margin: 10px;

                letter-spacing: 3px;
            }
            .body .teamDetailContainers1{
                display:inline-flex;
            }
            .body .teamDetailContainers2{
                display:inline-flex;
            }
            .body .teamDetail .container{

                margin-left: 20px;
                margin-right: 20px;
            }

            .body .teamDetail img{
                width: 100px;
                height: 100px;
                border-radius: 50px;
                border: 2px solid #00000059;
                padding: 1px;

            }

            
           


        </style>
    </head>
    <body>

        <div class="heading">

            <h1>About us</h1>
        </div>
        <div class="body">
            <p>
             We're here to bring buyers and sellers together in a streamlined, fuss-free environment. With just a few essential categories, we aim to make your shopping experience straightforward and enjoyable.
            </p>
            <div class="teamDetail">
                <h2>Team Detail</h2>
                <div class="teamDetailContainers1">
                    <div class="container">
                        <img src="web_images/rushik.jpg" alt="">
                        <p>Rushik</p>
                    </div>
                    <div class="container">
                        <img src="web_images/dipak.jpeg" alt="">
                        <p>Dipak</p>
                    </div>
                </div>
                <div class="teamDetailContainers2">
                    <div class="container">
                        <img src="web_images/vraj.jpg" alt="">
                        <p>Vraj</p>
                    </div>
                    <div class="container">
                        <img src="web_images/dharmik.jpg" alt="">
                        <p>Dharmik</p>
                    </div>
                </div>
            </div>

        </div>

<%@include file="footer.jsp" %>
    </body>
</html>
