<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("gomain").onclick = function() {
		console.log('aaa');
		location.href="../index.jsp";
	};
	
};
</script>
</head>
<body>
<h1>O cliente não autorizou o acesso dos usuários</h1>
<br><br>
Clique para ir para a página principal do botão Serviços abaixo.<br><br>
<button id="gomain">Ir para página principal</button> 
</body>
</html>