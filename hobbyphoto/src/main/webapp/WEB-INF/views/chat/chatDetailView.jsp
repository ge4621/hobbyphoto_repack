<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 웹 소켓 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
    .start{
        border: 1px solid rgb(167, 237, 56);
        height: 600px;
        width: 600px;
        margin: auto;
        margin-top: 50px;
    }

    .msg{
        border: 1px solid black;
        width: 300px;
        height: 25px;
    }

    .sendbtn{
        border: 1px solid orange;
        width: 50px;
        height: 20px;
    }

    .warp{
        border: 1px solid black;
        margin-bottom: 0px;
    }

    .messageArea{
        width: 500px;
        height: 560px;
        overflow-y: auto;
        margin: auto;
        margin-top: 10px;
    }
</style>

</head>

<body>

<div class="start" data-userid="${userid.userId}">

    <div id="messageArea" class="messageArea"></div>

    <div class="warp">
        <input type="text" id="msg" class="msg">
        <input type="button" id="sendbtn" value="submit" class="sendbtn">
    </div>

</div>

<script type="text/javascript">
	//전송 버튼 누르는 이벤트
	$("#sendbtn").on("click", function(e) {
		sendMessage();
		$('#msg').val('')
	});
	
	var sock = new SockJS('http://localhost:8006/hobbyphoto/chat');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	// 세션 ID 가져오기
    var cur_session = $('.start').data('userid');
	
	//메시지전송
	function sendMessage() {
		var message = $("#msg").val();
        var data = cur_session + ":" + message; // 세션 ID와 메시지를 함께 전송
        sock.send(data);
	}
	// 서버에서 메시지를 받았을 때
    function onMessage(msg) {
        var data = msg.data;
        var arr = data.split(":");

        if (arr.length >= 2) {
            var sessionId = arr[0];
            var message = arr[1];

            // 로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
            var str = "<div class='col-6'>";
            if (sessionId === cur_session) {
                str += "<div class='alert alert-secondary'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
            } else {
                str += "<div class='alert alert-warning'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
            }
            str += "</div></div>";
            $("#messageArea").append(str);
        } else {
            console.log("Invalid message format");
        }
    }
	//채팅창에서 나갔을 때
	function onClose(evt) {
		
		var user = cur_session;
		var str = user + " 님이 퇴장하셨습니다.";
		
		$("#msgArea").append(str);
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		
		var user = cur_session;
		var str = user + "님이 입장하셨습니다.";
		
		$("#messageArea").append(str);
	}

</script>
</body>
</html>