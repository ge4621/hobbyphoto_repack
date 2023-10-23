<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .content{
        width: 1300px;
        margin: auto;
    }
    .recommend{
        border-bottom: 1px solid lightgray;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }

    #contentArea th,td{
        padding-left: 20px;
    }

    .text{font-size: 14px; color: gray; margin-right: 70px;}

    #etc{padding-left: 20px;}

    .replyArea{border: 1px solid lightgray; padding: 0px; border-top: none;}
    .reply{padding: 0px;}
    .reply-info{float: left; padding-top: 4px; width: 1180px; font-size: 18px;}
    .reply-title{height: 55px; padding: 10px 30px; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;}
    .reply-content{padding: 30px;}

    .insertReply{border: 1px solid lightgray; padding: 0px;}
    .ir-title{height: 55px; padding: 10px 30px; font-weight: bolder;}
    .ir-content{padding: 10px 30px;}
    .ir-btn{margin-left: 10px; width: 100px; height: 75px; position: relative; bottom: 33px;}
</style>
</head>
	<body>
	    <div class="content">
	        <br><br>
	        <div align="center">
	            <h2>장비 추천</h2>
	            <h6 style="color: gray;">사용자가 전해주는 다양한 카메라 이야기!</h6>
	        </div>
	        <br>
	        <div class="recommend">
	            <table id="contentArea" align="center" class="table">
	                <tr>
	                    <th width="100">제목</th>
	                    <td>${ boardTitle }</td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>${ boardWriter }</td>
	                </tr>
	                <tr>
	                    <td colspan="2" id="etc"><span>작성일</span> <span class="text">${ createDate }</span> <span>조회수</span> <span class="text">${ b.count }</span></td>
	                </tr>
	                <tr>
	                    <td colspan="2"><p style="height:150px">${ boardContent }</p></td>
	                </tr>
	            </table>
	        </div>
	        <br>
	        <div>
	            <button class="btn btn-dark btn-sm">목록으로</button>
	            <!--
	            <button class="btn btn-dark btn-sm">수정하기</button>
	            <button class="btn btn-dark btn-sm">삭제하기</button>
	            -->
	        </div>
	        <br><br>
	            <ul class="replyArea">
	                <ul class="reply">
	                    <div class="reply-title">
	                        <div class="reply-info"><span style="margin-right: 10px;">user01</span> <span class="text">2023-10-10</span></div>
	                        <div class="reply-btn">
	                            <button class="btn btn-dark btn-sm">삭제</button>
	                        </div>
	                    </div>
	                    <div class="reply-content">댓글입니다.</div>
	                </ul>
	                <ul class="reply">
	                    <div class="reply-title">
	                        <div class="reply-info"><span style="margin-right: 10px;">user01</span> <span class="text">2023-10-10</span></div>
	                        <div class="reply-btn">
	                            <button class="btn btn-dark btn-sm">삭제</button>
	                        </div>
	                    </div>
	                    <div class="reply-content">댓글입니다.</div>
	                </ul>
	                <ul class="reply">
	                    <div class="reply-title">
	                        <div class="reply-info"><span style="margin-right: 10px;">user01</span> <span class="text">2023-10-10</span></div>
	                        <div class="reply-btn">
	                            <button class="btn btn-dark btn-sm">삭제</button>
	                        </div>
	                    </div>
	                    <div class="reply-content">댓글입니다.</div>
	                </ul>
	            </ul>
	            <br>
	            <div class="insertReply">
	                    <div class="ir-title">댓글달기</div>
	                    <div class="ir-content">
	                            <textarea name="" id="" cols="130" rows="3"></textarea>
	                            <button class="ir-btn btn-dark">작성</button>
	                    </div>
	            </div>
	        <br><br>
	    </div>
	</body>
</html>