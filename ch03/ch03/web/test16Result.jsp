<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Param & EL</title>
</head>
<body>
<div class="container">
    <h2>memberObj</h2>
    <p>${memberObj.no }</p>
    <p>${memberObj.name }</p>
    <hr>
    <h2>Wrapper Obj</h2>
    <p>${strObj }</p>
    <p>${intObj }</p>
    <hr>
    <h2>Parameter</h2>
    <p>${param.num1 }</p>
    <p>${param.num2 }</p>
    <hr>
    <h2>Parameter2</h2>
    <p>${param['num1'] }</p>
    <p>${param['num2'] }</p>
</div>
</body>
</html>
