<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <!--제이쿼리-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.notosanskr * { 
	font-family: 'Noto Sans KR', sans-serif;
	}
    div{ font-family: 'Noto Sans KR';}
        .mb_outer{
            height: 120px;
            margin-top: 10px;
            margin: auto;
            margin-left: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center; 
        }

        .mb_outer>div{height: 100%; float: left;}
        .mb_menu-area{
            width: 770px; 
            height: auto;
           /*  border: 1px solid blue; */
        }
        .mb_login-area{
            width: 20%;
            margin-left: 20px; 
            /* border: 1px solid red; */
        }

        .mb_menu-area>div{height: 100%; float: left;}
        #mb_logo{width: 25%; height: 100%;}
        #mb_nav {
    		width: 565px;
		}
        #mb_logo>img{
            display: block; 
            width: 100%; 
            height: 40%; 
            margin: auto;
            margin-top: 35px;
        } 
        #mb_logo>img:hover{
            cursor: pointer;
        }

        #mb_navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
            display: flex
        }

        #mb_navi a:hover {
           font-weight: 1000;
        }

        .mb_search-area, .mb_login-area {
            display: flex;
            align-items: center;
        }

        .mb_login-area>div{
            height: 70%;
            float: right;
            margin-top: 20px;
            /* border: 1px solid black; */
        }
        #mb_user_1{
            margin-top: 5px;
        }

        #mb_search {
            margin-right: 10px;
        }

        #mb_navi li {
            float: left;
            text-align: center;
            width: 27%; 
            /* border: 1px solid red; */
            height: 100%;
        }

        #mb_navi a {
            text-decoration: none;
            color: rgb(50, 50, 50);
            font-size: 18px;
            font-weight: 500;
            display: block;
            height: 100%;
            width: 100%;
            line-height: 120px;
            cursor: pointer;
        }

        #mb_navi li:nth-child(7) {
            margin-left: auto;
        }
    
        .mb_search-area {
            width: 200px;
        }
        
        #sh_text {
            margin-left: 10px;
            margin-top: 5px;
            width: 300px;
            border: none; 
            border-bottom: 1px solid #aeaeae; 
        }
        #search_text {
        display: flex;
        }

        #search {
            width: 25px;
            height: 25px;
            float: left;
            margin-top: 5px;
        }
        
        .login-area {
            margin-left: 90px; /* 테이블 간격 늘리기 */
        }
        
        hr{
          /*width: 1200px;*/
        }

		.false{
        	display: none;
        }

        .member--visible{
            display: "";
        }

        .header .member--visible:before {
            content: "";
            position: absolute;
            left: 50%;
            top: 0;
            border: 8px solid transparent;
            border-bottom-color: #fff;
            transform: translate(-50%,calc(-100% + 1px))
        }
        
    
        .member_inner{
        	width: 130px;
        	height: 170px;
            background-color: white;
        	position: absolute;
        	top: 100px;
            right: 117px;
        	border: 1px solid black;
        	z-index: 120;
            text-align: center;
            padding: 10px 15px;
        }
        

        .btn_login{
            color: #5865f5;
            font-weight: bolder;
            box-sizing: border-box;
        }

        .btn_login:hover{
            color: #5865f5;
        }
        
        .btn:active, .btn:focus { 
        	border: 1px solid white; box-shadow: none; 
        }
        
		        
        .member_menu_mypage{
        	list-style-type: none;
            padding-top: 14px;
        }
        
        .first_menu{
        	border-top: 1px solid #f1f1f1;
        }
        
        .member_menu_mypage a{
			color: black;
            font-weight: bolder;
        }
  </style>

</head>
<body>

	

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="mb_outer">
        <div class="mb_menu-area">
            <div id="mb_logo">
                <img src="resources/images/logo.png" alt="로고" onclick="shopHome()">
            </div> 
            <div id="mb_nav">
                <ul id="mb_navi">
                    <li><a href="pro.list">카메라</a></li>
                    <li><a href="shop.photo">포토북</a></li>
                    <!-- <li><a href="shList.no">공지사항</a></li> -->
                    <li><a href="echo">채팅</a></li>
                </ul>
            </div>
        </div>
        <div class="mb_search-area">
            <div id="mb_search">
                <form action="shop.search" id="search_form">
                    <div id="search_text">
                        <input type="text" name="keyword" id="sh_text" placeholder="         찾으시는 상품을 입력해주세요">
                        <input type="image" id="search" src="https://cdn-icons-png.flaticon.com/128/2801/2801881.png">
                    </div>
                    
                </form>
            </div>
        </div>
        <div class="mb_login-area">
                <div id="mb_user_1">
                    <table class="login-area" align="center">
                        <tr height="75">
                            <td width="70"><a href="/hobbyphoto"><img width="45" src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt=""></a></td>
                            <td width="70" id="member_menu"><img width="60" height="60" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt=""></td>
                        </tr>
                    </table>
                </div>
                <div class="heder_inner">
                	<c:choose>
                		<c:when test="${ empty loginMember }">
		                	<div class="member false">
		                		<div class="member_inner">
		                			<button type="button" class="btn btn_login" onclick="login()">로그인</button>
		                			<div class="member_menu">
		                				<ul style="padding: 0px;">
		                					<li class="member_menu_mypage" align="center">
		                						<a href="memberEnrollForm.me">회원가입</a>
		                					</li>
		                				</ul>
		                			</div>
		                		</div>
		                	</div>
                		</c:when>
                		<c:otherwise>
                			<div class="member false">
		                		<div class="member_inner">
		                			<button type="button" class="btn btn_login" onclick="logout()">로그아웃</button>
		                			<div class="member_menu">
		              
		                				<ul style="padding: 0px;">
		                					<li class="member_menu_mypage first_menu" align="center">
		                						<a href="shop.gomy?userNo=${loginMember.userNo }">마이페이지</a>
		                					</li>
		                					<li class="member_menu_mypage" align="center">
			                					<c:choose>
				                					<c:when test="${ loginMember.userNo == 1 }">
					                					<a href="alist.da">관리자페이지</a>
					                					<div><p></p></div>
					                					<a href="shop.mp?userNo=${ loginMember.userNo }" id="cartbtn">장바구니</a>
				                					</c:when>
				                					<c:otherwise>
				                						<a href="shop.mp?userNo=${ loginMember.userNo }" id="cartbtn">장바구니</a>
				                					</c:otherwise>
			                					</c:choose>
		                					</li>
		                				</ul>
		                		
		                			</div>
		                		</div>
		                	</div>
                		</c:otherwise>
                	</c:choose>
                </div>
        </div>
    </div>


</body>
	<script>
	        $(()=>{
	        	$("#member_menu").click(()=>{
	                $(".member").before();
	        		if($(".member").hasClass("false")){
		        		$(".member").removeClass("false")
		        		$(".member").addClass("member--visible")
	        		}else{
	        			$(".member").removeClass("member--visible")
		        		$(".member").addClass("false")
	        		}
	        	})
	        })
	        
	        function login() {
				location.href="loginForm.me"
			}
	        
	        function logout() {
				location.href="logout.me"
			}
	        
	        function shopHome(){
	        	location.href="pro.list"
	        }
	        
    </script>

</html>