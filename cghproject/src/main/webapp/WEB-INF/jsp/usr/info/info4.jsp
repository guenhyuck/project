<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>숙박시설 나올거</title>
<head data-theme="light">
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 노드SCSS 불러오기 -->
<link rel="stylesheet" href="output.css">



<!-- 테일윈드 불러오기 -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" /> -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<link rel="stylesheet" href="/resource/common.css" />
<link rel="shortcut icon" href="/resource/favicon.ico" />
<script src="/resource/common.js" defer="defer"></script>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1>Hotel List</h1>
    <table>
        <thead>
            <tr>
                <th>업체 이름</th>
                <th>주소</th>
                <th></th>
                <th>영업 시간</th>
            </tr>
        </thead>
        <tbody id="restaurantTableBody">
        </tbody>
    </table>

    <script>
        $(document).ready(function() {
            $.ajax({
                url: '/src/main/resources/trafic.json', // JSON 파일의 경로
                dataType: 'json',
                type: 'GET',
                success: function(data) {
                    var restaurantItems = data.response.body.items;
                    var tbody = $("#restaurantTableBody");

                    $.each(restaurantItems, function(index, item) {
                        var tr = $("<tr></tr>");
                        var nameTd = $("<td></td>").text(item.restrntNm);
                        var addressTd = $("<td></td>").text(item.restrntAddr);
                        var foodTd = $("<td></td>").text(item.rprsFod);
                        var timeTd = $("<td></td>").text(item.salsTime);

                        tr.append(nameTd, addressTd, foodTd, timeTd);
                        tbody.append(tr);
                    });
                },
                error: function() {
                    console.log('Error occurred while fetching JSON data');
                }
            });
        });
    </script>
</body>
</html>
