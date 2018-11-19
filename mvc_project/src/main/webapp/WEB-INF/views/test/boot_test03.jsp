<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        *{
            box-sizing : border-box;;
        }
        body{

            font-family: Arial, Helvetica, sans-serif;

        }

        header{
            background-color : #666;
            padding : 30px;
            text-align : center;
            font-size:35px;
            color:white;
        }

        nav{
            float : left;
            width : 25%;
            height : 300px;
            background: #ccc;
            padding: 20px;
        }

        nav ul{
            list-style-type: none;
            padding: 0;
        }

        article{
            float : left;
            padding : 20px;
            width:70%;
            background-color: #f1f1f1;
            height : 300px;


        }

        section:after{
            content:"";
            display: table;
            clear:both;
        }
        footer{
            background-color: #777;
            padding : 10px;
            text-align: center;
            color : white;
        }

        @media (max-width: 600px){
            nav,article{
                width:100px;
                height:auto;
            }
        }

    </style>


</head>
<body>


<h2>CSS Layout Float</h2>
<p>In this example, we have created a header, two columns / boxes and a footer.
    On smaller screens, the columns will stack on top of eachoter.</p>
<p>Resize the bowser window to see the responsive effect (you will learn more about this in out next chapter
    -HTML Responsive)</p>


<header>

    <h2>Cities</h2>
</header>


<section>
    <nav>
        <ul>

            <li><a href="#">London</a></li>
            <li><a href="#">Seoul</a></li>
            <li><a href="#">Paris</a></li>


        </ul>

    </nav>

    <article>
        <h1>London</h1>
        <p>London is the capital city of England. It is the most pupulous city in the United kKingdom, with a metro politan area of
            13 million inhabitants.</p>
        <p>Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding
            by the Romans</p>


    </article>


</section>
<footer>
    <p>footer</p>

</footer>
<%@include file="../include/footer.jsp"%>