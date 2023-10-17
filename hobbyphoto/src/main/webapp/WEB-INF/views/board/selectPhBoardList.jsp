<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진게시판 리스트</title>
	<style>
	    .outer_th{
	        /* border: 1px solid red; */
	        width: 1200px;
	        margin: auto;
	        margin-top: 50px;
	    }
	
	    .list-area_th{
	        /* border: 1px solid red; */
	        width: 1000px;
	        margin: auto;
	    }
	
	    .thumbnail{
	        /* border: 1px solid red; */
	        width: 300px;
	        display: inline-block;
	        margin: 14px;
	    }
	    
	    .thumbnail:hover{
	    	cursor: pointer;
	    	opacity: 0.7;
	    }
	
	    /* 사진 밑의 작성자, 제목 */
	    .thumbnail>#thumbText{
	        margin: 10px;
	        font-size: small;
	        line-height: 210%;
	    }
	
	    /* 제목 밑줄 */
	    .h_a:after{
	        content: "";
	        display: block;
	        width: 30px;
	        border-bottom: 2px solid gray;
	        border-radius: 20px;
	        margin: 10px 0 0 0;
	    }
	
	    /* 글작성 버튼 */
	    #btn_th{
	        margin: 0 -227px 10px 0;
	    }
	
	    /* 페이징바 */
	    .paging-area>button{
	            border: none;
	            background-color: white;
	            width: 35px;
	            height: 35px;
	            margin-top: 20px;
	        }
	
	    /* 위로가기 버튼 */
	    #top{
	        width: 40px; 
	        height: 40px;
	    }
	</style>
</head>
	<body>
		<div class="outer_th" id="header_th">
            <br>
            <h2 align="center">사진게시판</h2>
            <br>

	        <div style="width: 850px;" align="right">
	            <a href="#" class="btn btn-light" id="btn_th">글작성</a>
	        </div>
	        
	        <div class="list-area_th">
			   	<c:forEach var="b" items="${ list }">
		            <div class="thumbnail" align="center">
		                <img src= "${ b.thumbnail }" width="295" height="220"> 
		                <p id="thumbText">
		                    <img src="https://www.w3schools.com/bootstrap4/img_avatar3.png" style="border-radius: 100%; margin-bottom: 3px;" width="20px" height="20px"> ${ b.boardWriter } <br><h class="h_a">${ b.boardTitle }</h>
		                    <p style="font-size: small;">${ b.boardContent }</p>
		                </p>
		            </div>
			   	</c:forEach>
	        </div>
        
            <div class="paging-area" align="center">
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
                		<button disabled> &lt; </button>
                	</c:when>
                	<c:otherwise>
                		<button style="border: 1px solid lightgray; font-weight: bolder;" onclick="location.href='pBoardList.bo?cpage=${ pi.currentPage - 1 }'">Previous</button>
                	</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <button onclick="location.href='pBoardList.bo?cpage=${ p }'">${ p }</button>
                </c:forEach>
                
                <button onclick="location.href='pBoardList.bo?cpage=${ p }'">${ p }</button>
                
               	<c:choose>
                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<button onclick="location.href=''" disabled>Next</button>
                   	</c:when>
                     <c:otherwise>
                     	<button onclick="location.href='list.bo?cpage=${ pi.currentPage + 1 }'">Next</button>
                   	</c:otherwise>
                </c:choose>
                
                <button> &gt; </button>
            </div>

            <div id="topbtn">
                <a style="display:scroll; position:fixed; bottom:10px; right:20px;" title="top">
                    <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top">
                </a> 
            </div>   
        </div>
    </div>
	</body>
</html>