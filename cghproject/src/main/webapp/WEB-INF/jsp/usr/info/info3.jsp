<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  <table id="data-table">
    <thead>
      <tr>
        <th>구분</th>
        <th>날짜</th>
        <th>역명</th>
        <th>역번호</th>
        <th>00~01시</th>
        <!-- 나머지 시간대 열도 추가 -->
      </tr>
    </thead>
    <tbody></tbody>
  </table>

  <script>
    $(document).ready(function() {
      $.ajax({
        url: 'https://infuser.odcloud.kr/oas/docs?namespace=15060591/v1', // 서버의 데이터 제공 엔드포인트로 수정 필요
        dataType: 'json',
        type: 'GET',
        success: function(data) {
          // JSON 데이터를 사용하는 로직 작성
          var tableBody = $('#data-table tbody');
          for (var i = 0; i < data.length; i++) {
            var row = data[i];
            var tableRow = $('<tr></tr>');
            tableRow.append('<td>' + row['구분'] + '</td>');
            tableRow.append('<td>' + row['날짜'] + '</td>');
            tableRow.append('<td>' + row['역명'] + '</td>');
            tableRow.append('<td>' + row['역번호'] + '</td>');
            // 나머지 시간대 열도 추가
            tableRow.append('<td>' + row['00~01시'] + '</td>');
            // 나머지 시간대 열도 추가
            tableBody.append(tableRow);
          }
        },
        error: function() {
          console.log('Error occurred while fetching JSON data');
        }
      });
    });
  </script>
</body>
</html>


