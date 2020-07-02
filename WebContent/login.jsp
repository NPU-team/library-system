<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style/register-login.css">
<script src="js/bootstrap.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function() {
		$("a").addClass("btn btn-default btn-xs");

	});
</script>
<head>
<meta charset="utf-8">
<title>Manager Login</title>
<link rel="shortcut icon" href="assets/ico/logo.png">
<style>
.bg {
	width: 46px;
	height: 100%;
	position: absolute;
	background-color: #75CDF9;
}

.text {
	position: absolute;
	width: 100%;
	height: 100%;
	text-align: center;
	user-select: none;
}

.btn {
	width: 46px;
	height: 46px;
	position: absolute;
	border: 1px solid #ccc;
	cursor: move;
	font-family: "Authentication is success！";
	text-align: center;
	background-color: #fff;
	user-select: none;
	color: #666;
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


	<div class="cent-box">
		<div class="cent-box-header">
			<em><h1 style="color: deepskyblue">Mandarin-Library
					Automation 2019</h1></em> <br>
			<h3>Manager Login</h3>
		</div>

		<%
			Cookie[] cookies = request.getCookies();
			String account = "";
			String password = "";
			
			if (cookies != null)
				for (Cookie cookie : cookies) {

					if (cookie.getName().equals("account")) {
						account = cookie.getValue();

					} else if (cookie.getName().equals("password")) {
						password = cookie.getValue();

					}
				}
		%>

		<div class="login form">
			<form action="managerlogin" method="post">
				<div class="group">

					<div class="group-ipt email">
						<input type="text" name="account" id="account" class="ipt"
							value="<%=account%>"
							placeholder="please input your account number" required>
					</div>
					<div class="group-ipt password">
						<input type="password" name="password" id="password" class="ipt"
							value="<%=password%>" placeholder="please input your password"
							required>
					</div>
				</div>
				<div class="button">
					<button type="submit" class="login-btn register-btn" id="button">Login</button>
				</div>


				<div class="remember clearfix">
					<label class="remember-me"> <input type="checkbox"
						name="remenber" id="remember" class="remember-mecheck">
						remember me

					</label> <label class="forgot-password"> <a
						href="forget_password.jsp">forget password</a>
					</label>
				</div>
			</form>
		</div>
	</div>


	<div class="footer">
		<p>Copyright: Designed By B10 team 2019</p>
	</div>

	<script src='js/particles.js' type="text/javascript"></script>
	<script src='js/background.js' type="text/javascript"></script>
	<script src='js/jquery.min.js' type="text/javascript"></script>
	<script src='js/layer/layer.js' type="text/javascript"></script>
	<script src='js/index.js' type="text/javascript"></script>
	<script>
        var $ = function(selector){
                return  document.querySelector(selector);
            },
            box = $(".drag"),
            bg = $(".bg"),
            text = $(".text"),
            btn = $(".btn"),
            success = false,
            distance = box.offsetWidth - btn.offsetWidth;
        btn.onmousedown = function(e){

            btn.style.transition = "";
            bg.style.transition ="";
            var e = e || window.event;
            var downX = e.clientX;

            document.onmousemove = function(e){

                var e = e || window.event;
                var moveX = e.clientX;
                var offsetX = moveX - downX;

                if( offsetX > distance){
                    offsetX = distance;
                }else if( offsetX < 0){
                    offsetX = 0;
                }

                
                btn.style.left = offsetX + "px";
                bg.style.width = offsetX + "px";

                
                if( offsetX == distance){

                    text.innerHTML = "Authentication is success";
                    text.style.color = "#fff";
                    btn.innerHTML = "&radic;";
                    btn.style.color = "green";
                    bg.style.backgroundColor = "lightgreen";
                    success = true;
                    btn.onmousedown = null;
                    document.onmousemove = null;
                    setTimeout(function(){
                        alert('Authentication success!');
                    },100);
                }
            }

            document.onmouseup = function(e){

                if(success){
                    return;
                }else{
                   
                    btn.style.left = 0;
                    bg.style.width = 0;
                    btn.style.transition = "left 1s ease";
                    bg.style.transition = "width 1s ease";
                }
                document.onmousemove = null;
                document.onmouseup = null;
            }


        }
    </script>
	<script>
            function mySubmit()
            </script>
	<script> 
            var errori ='<%=request.getParameter("error")%>';
            if(errori=='yes'){
             alert("Account or password wrong!");
            }
          </script>

</body>
</html>