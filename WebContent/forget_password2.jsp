<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="entity.Librarian"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@page import="dao.managerforgetpasswordDao"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Forget-password</title>
<link rel="stylesheet" type="text/css" href="style/register-login.css">
<style type="text/css">
#button1 {
	position: relative;
	left: 300px;
	top: 40px;
	z-index: 0;
	border-style: none;
	background: White;
	width: 100px;
	height: 30px;
}
.register-box {
    height: 300px;
    margin-top: -140px;
}
body {
	background: url('images/bll1.jpg');
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}
.footer {
    position: fixed;
    width: 100%;
    /* height: 60px; */
    bottom: 0;
    left: 0;
    text-align: center;
    color: #0384f2;
    z-index: 2;
    /* padding-bottom: 10px; */
    font-size: 13px;
}
</style>
</head>
<body>


	<div class="cent-box register-box">
		<div>
			<b><h2>Retrieve password</h2></b>
			<p>Please input your email confirm code:</p>
			</br>
		</div>
		<div>

			<div class="login form">
				<form action="sendemail" method="post">
					<div class="group">
						<div class="group-ipt verify">
							<input type="text" name="code" id="code" class="ipt"
								placeholder="Please input your code" required maxlength="6">
						</div>
					</div>
			</div>

			<div class="button">
				<button type="submit" class="login-btn register-btn" id="button">Next</button>
				</a>
			</div>

			</form>
		</div>

		<div class="footer">
			<p>Copyright: Designed By B10 team 2019</p>
		</div>
		<script src='js/particles.js' type="text/javascript"></script>
		<script src='js/background.js' type="text/javascript"></script>
		<script src='js/jquery.min.js' type="text/javascript"></script>
		<script src='js/layer/layer.js' type="text/javascript"></script>
		<script src='js/index.js' type="text/javascript"></script>
		<script type="text/javascript">  

		//60秒倒计时
var countdown=60;  
function settime(val) {  
    if (countdown == 0) {  
        val.removeAttribute("disabled");  
        val.value="get code";  
        countdown = 60;  
        return false;  
    } else {  
        val.setAttribute("disabled", true);  
        val.value="Again(" + countdown + ")";  
        countdown--;  
    }  
    setTimeout(function() {  
        settime(val);  
    },1000);  
    
}  
</script>
		<script>
            function mySubmit()
            </script>
		<script> 
            var errori ='<%=request.getParameter("error")%>';
            if(errori=='yes'){
             alert("Account is not exist!");
            }
          </script>
</body>
</html>