<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <style>
        /* div {border: 1px solid black;} */
        #ft_footer{
            display: flex;
            flex-direction: row; /* �ΰ�� Ǫ�͸� ���η� ���� */
            align-items: flex-start; /* ���� ������ �� ���� ���� */
            height: 200px;
            box-sizing: border-box; 
            margin: auto;
            margin-top: 50px;
            text-align: left;
            font-family: 'NanumBarunGothic';
        }
        .footer_info {
          margin-top: 10px;
          margin-left: 20px;
        }

        #ft_logo {
            height: 100%;
            width: 20%;
        }

        #ft_logo img{
            display: block;
            margin: auto;
            margin-left: 85px;
            padding-top: 50px;
            width: 50%;
            height: 35%;
        }

        #ft_footer1 {
            height: 50px;
            margin-top: 10px; 
            margin-left: 10px;
            display: flex;
            justify-content: left;
            align-items: center;
        }

        #ft_footer2 {
            margin-top: 5px;
            margin-left: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #ft_footer a {
            height: 30%;
            text-decoration: none; 
            color: black;
            font-weight: 600;
            margin: 15px;
            font-size: 16px;
        }

        #ft_footer p {
            height: 70%;
            margin-top: 20px;
            font-size: 13px;
        }
    </style>
</head>

<body>
    <div id="ft_footer">
        <div id="ft_logo">
            <img src="images/logo.png" alt="">
        </div>
          <div class="footer_info">
            <div id="ft_footer1">
              <a href="#">ȸ�� �Ұ�</a> 
              <a href="#">��������</a> 
              <a href="#">����ó</a> 
              <a href="#">������</a> 
              <a href="#">ä��</a> |
              <a href="#">�������� ó����ħ</a>
              <a href="#">���� �̿���</a>
          </div>
          <div id="ft_footer2">
              <p>
                  ��ȣ�� : (��)�Ϻ����� | ��ǥ�� : ������ <br>
                  ����ڵ�Ϲ�ȣ : 592-68-230926 | ����Ǹž��Ű��ȣ : �� 2023-���ﰭ��-05367ȣ | �������� ������� �Ű��ȣ : K120235648630009 <br>
                  �ּ� : ����Ư���� ������ �������14�� 6 �������� 3�� Hȣ | ������ : final3.kh@gmail.com (�����ð� ���� 9:00 ~ 18:00) �ָ� ������ �޹� <br>
                  @2023 (��)�Ϻ�����, INC All rights reserved.
              </p>
          </div>
        </div>      
    </div>
</body>
</html>
