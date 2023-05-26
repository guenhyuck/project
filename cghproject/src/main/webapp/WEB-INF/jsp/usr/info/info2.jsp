<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>문화 관광지</title>
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



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tour Spot List</title>
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
    <h1>Tour Spot List</h1>
    <table>
        <thead>
            <tr>
                <th>관광지명</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>전화번호</th>
                <th>운영시간</th>
                <th>이용요금</th>
                <th>주차시설</th>
                <th>문의전화</th>
                <th>홈페이지</th>
                <th>관광지요약</th>
            </tr>
        </thead>
        <tbody id="tourspotTableBody">
        </tbody>
    </table>

    <script>
        $(document).ready(function() {
            $.ajax({
                url: '/src/main/resources/gettourspot.json', // JSON 파일의 경로
                dataType: 'json',
                type: 'GET',
                success: function(data) {
                    var tourSpotItems = data.response.body.items;
                    var tbody = $("#tourspotTableBody");

                    $.each(tourSpotItems, function(index, item) {
                        var tr = $("<tr></tr>");
                        var nameTd = $("<td></td>").text(item.tourspotNm);
                        var zipTd = $("<td></td>").text(item.tourspotZip);
                        var addrTd = $("<td></td>").text(item.tourspotAddr);
                        var dtlAddrTd = $("<td></td>").text(item.tourspotDtlAddr);
                        var phoneTd = $("<td></td>").text(item.refadNo);
                        var timeTd = $("<td></td>").text(item.mngTime);
                        var amtTd = $("<td></td>").text(item.tourUtlzAmt);
                        var parkingTd = $("<td></td>").text(item.pkgFclt);
                        var contactTd = $("<td></td>").text(item.cnvenFcltGuid);
                        var urlTd = $("<td></td>").text(item.urlAddr);
                        var summTd = $("<td></td>").text(item.tourspotSumm);

                        tr.append(nameTd, zipTd, addrTd, dtlAddrTd, phoneTd, timeTd, amtTd, parkingTd, contactTd, urlTd, summTd);
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

