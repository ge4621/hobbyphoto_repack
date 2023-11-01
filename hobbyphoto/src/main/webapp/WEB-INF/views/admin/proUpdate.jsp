<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>상품 수정 페이지</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            margin-top: 30px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            /* height: 1000px; */
        }

        .container {
            width: 50%;
            height: 80%;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            color: #555;
        }

        input,
        textarea {
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            height: 200px; 
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .select-area{
            height: 40px;
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
	
	<div class="container">
        <h2>상품 수정</h2>
        <form action="adminPro.update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pno" value="${ p.PNo }">
            <label for="productName">상품명:</label>
            <input type="text" id="productName" name="pName" value="${ p.PName }" required>

             <label for="productName">브랜드 명:</label>
			<select class="select-area" name="brandNo" required>
			    <option value="1" ${p.brandNo == 1 ? 'selected' : ''}>CANON</option>
			    <option value="2" ${p.brandNo == 2 ? 'selected' : ''}>NIKON</option>
			    <option value="3" ${p.brandNo == 3 ? 'selected' : ''}>OLYMPUS</option>
			    <option value="4" ${p.brandNo == 4 ? 'selected' : ''}>SONY</option>
			    <option value="5" ${p.brandNo == 5 ? 'selected' : ''}>FUJIFILM</option>
			</select>

            </select>
            
            <br>


            <label for="category">종류:</label>
            <select class="select-area" name="categoryNo" required>
                <option value="1" ${p.categoryNo == 1 ? 'selected' : ''}>DSLR</option>
                <option value="2" ${p.categoryNo == 2 ? 'selected' : ''}>SLR</option>
                <option value="3" ${p.categoryNo == 3 ? 'selected' : ''}>미러리스트</option>
                <option value="4" ${p.categoryNo == 4 ? 'selected' : ''}>임펙트</option>
            </select>

            <br>

            <label for="productPrice">가격:</label>
            <input type="number" id="productPrice" name="price" value="${ p.price }" required> <br>

            <label for="productamount">수량:</label>
            <input type="number" id="productamount" name="amount" value="${ p.amount }" required> <br>

            <label for="productImage">상품 이미지:</label> <br>
            <img src="${ p.thumbnail }" id="thumbnailPreview" width="80px" height="80px" onclick="triggerFileInput('thumbnail')">
            <input type="file" id="thumbnail" name="upfile" onchange="updateImagePreview(this, 'thumbnailPreview')"> <br> 

            <label for="productDescription">상품 개요 :</label> <br>
            <img src="${ p.PDimg }" id="pdimgPreview" width="80px" height="80px" onclick="triggerFileInput('pdimg')">
            <input type="file" name="upfile" id="pdimg" onchange="updateImagePreview(this, 'pdimgPreview')"> <br>
            
            <label for="productDescription">제품 상세 :</label> <br>
            <img src="${ p.PSimg }" id="psimgPreview" width="80px" height="80px" onclick="triggerFileInput('psimg')">
            <input type="file" name="upfile" id="psimg" onchange="updateImagePreview(this, 'psimgPreview')"> <br>
            
            <button type="submit">상품 수정</button>
        </form>
    </div>


	<script>
	function triggerFileInput(id) {
		    // 해당 id를 가진 파일 입력 필드를 트리거합니다.
		    document.getElementById(id).click();
		}
		
	function updateImagePreview(input, previewId) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            document.getElementById(previewId).src = e.target.result;
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	</script>


</body>
</html>
