<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div>
    <label>har1<input type="checkbox" name="ids" value="har1" /></label>
    <label>har2<input type="checkbox" name="ids" value="har2" /></label>
    <label>har3<input type="checkbox" name="ids" value="har3" /></label>
    <label>har4<input type="checkbox" name="ids" value="har4" /></label>
    <button type="button" onclick="uu()">보내기</button>
</div>
<script>
    function uu() {
    ​
        // name이 "ids"인 것들 가져오기 -> 배열형태
        var arr = document.getElementsByName("ids");
​
        // 체크된 값을 넣을 배열
        var dd = [];
​
            for(var i = 0; i < arr.length; i++) {   // arr 갯수만큼 돌리기
                if(arr[i].checked) {    // arr 중에서 체크된 값이 있는지
                    dd.push(arr[i].value);  // arr 중 체크된 값 dd 에 넣기
                }
            }
        console.log(dd);
​
    }
</script>
</body>
</html>