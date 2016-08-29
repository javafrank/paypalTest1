<%--
  Created by IntelliJ IDEA.
  User: frank
  Date: 8/29/16
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String paymentId = request.getParameter("paymentId");
    String payerID = request.getParameter("PayerID");
    System.out.println(paymentId);
    System.out.println(payerID);
%>
<html>
<head>
    <title>Approval PayPayl Payment</title>
    <script src="jquery-3.1.0.min.js"></script>
    <script src="jquery.cookie.js"></script>
    <script language="javascript">
        var paymentId = '<%= paymentId %>';
        var token = $.cookie("token");
        console.log(token);
        var payerID = '<%= payerID %>';
        $(document).ready(function() {
            $.ajax({
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer "+token
                },
                url: "https://api.sandbox.paypal.com/v1/payments/payment/"+paymentId+"/execute/",
                type: "POST",
                data: '{ "payer_id" : "'+payerID+'" }',
                complete: function (data) {
                    console.log(data.responseJSON);
                    alert("done payment executed");
                }
            });
        });
    </script>
</head>
<body>
    <h1>Approval PayPal Payment</h1>
</body>
</html>
