<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>공지사항</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<style>
.outer {
	width: 1200px;
	margin: auto;
	margin-top: 50px;
	box-sizing: border-box;
	/* border: 1px solid black; */
	text-align: center;
}

.wrap {
	width: 1000px;
	/* border: 1px solid red; */
	margin: auto;
	font-family: 'NanumBarunGothic';
}

/* 헤더부분 */
#filter {
	height: 40px;
	width: 500px;
}

#searchNotice {
	height: 40px;
	/* border: 1px solid red; */
}

#searchNotice>form {
	height: 100%;
}

#header {
	display: inline-block;
}

#header>div {
	float: left;
}

select {
	border: 1px solid gray;
	border-radius: 3px;
	width: 130px;
	height: 100%;
	font-size: 14px;
	margin-right: 5px;
	cursor: pointer;
	padding-left: 5px;
}

#box-search {
	border: 1px solid gray;
	border-radius: 3px;
	height: 100%;
	width: 250px;
}

form>* {
	float: left;
}

input[type=text] {
	margin-left: 10px;
	width: 190px;
	margin-top: 10px;
	border: none;
	font-size: 13px;
}

.btn-secondary {
	width: 75px;
	height: 100%;
}

button>img {
	width: 25px;
	height: 25px;
}

.img-button {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

.list {
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.list>table {
	margin-top: 20px;
	margin-bottom: 30px;
	width: 100%;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.list tr {
	height: 50px;
	border-bottom: 1px solid lightgray;
}

.list-area>tbody>tr:hover {
	background-color: rgb(242, 242, 242);
	font-weight: bolder;
}

.paging-area>button {
	border: none;
	background-color: white;
	width: 35px;
	height: 35px;
}

h1 {
	font-weight: bolder;
	margin: 100px;
	letter-spacing: 5px;
}

#searchimg {
	width: 20px;
	height: 20px;
}
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<div class="outer">
		<div class="wrap">
			<h1 align="center">공지사항</h1>
			<br>
			<br>
			<div id="header">
				<div id="filter"></div>
				<div id="searchNotice">
					<form action="search.no" id="search-form" method="get">
						<select name="searchCondition" id="search-select">
							<option value="notice_title">글제목</option>
							<option value="notice_writer">글쓴이</option>
						</select>

						<div id="box-search">
							<input type="text" id="insearch" name="searchKeyword"
								placeholder="검색어를 입력하세요">
							<button type="submit" class="img-button">
								<img
									src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/board_top_search_btn.png"
									alt="" id="searchimg">
							</button>
						</div>
					</form>
				</div>

				<div align="right" style="width: 85px;">
					<a href="enrollForm.no" class="btn btn-m btn-secondary">글작성</a> <br>
					<br>
				</div>
			</div>
			<div class="list">
				<table align="center" class="list-area">
					<thead>
						<tr align="center">
							<th width="200">번호</th>
							<th colspan="2" width="200">제목</th>
							<th width="140">작성자</th>
							<th width="110">작성일</th>
							<th width="70">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- case1. 공지글이 없을 경우-->
						<c:if test="${ not empty list }">
							<c:forEach var="n" items="${ list }">
								<tr>
									<td width="80">${n.noticeNo}</td>
									<td width="95">[ 공지 ]</td>
									<td align="left" style="padding-left: 10px;">${n.noticeTitle}</td>
									<td>${n.noticeContent}</td>
									<td>${n.createDate}</td>
									<td>${n.count}</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>

			<div class="paging-area" align="center">
				<c:choose>
                    <c:when test="${ pi.currentPage ne 1 }">
                        <button onclick="location.href='list.no?cpage=${ pi.currentPage - 1 }';"> &lt; </button>
                    </c:when>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <button onclick="location.href='list.no?cpage=${p}';">${p}</button>
                </c:forEach>
                
                <c:choose>
                    <c:when test="${ pi.currentPage ne pi.maxPage }">
                        <button onclick="location.href='list.no?cpage=${ pi.currentPage + 1 }';"> &gt; </button>
                    </c:when>
                </c:choose>
			</div>
		</div>
	</div>
	<script>
        $(function(){
        		$(".list-area>tbody>tr").click(function(){
            		location.href = 'detail.no?noticeNo='+ $(this).children().eq(0).text();
        		})
        		
        			$(".btn-area").click(function(){
            		location.href = 'enrollForm.pl';
        		})
        	})
    </script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>