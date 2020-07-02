<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="css/lightbox.css" type="text/css"
	media="all" />
<!--gallery-popup-css-->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Pop-up -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<!--fonts-->
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Sans:100,300,400,600,700"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,900"
	rel="stylesheet">
<!--//fonts-->
<style>
.button {
	width: 180px;
	line-height: 38px;
	text-align: center;
	font-weight: bold;
	color: #fff;
	text-shadow: 1px 1px 1px #333;
	border-radius: 4px;
	margin: 0 15px 15px 0;
	position: relative;
	overflow: hidden;
}

.button.blue {
	border: 1px solid #1583c4;
	box-shadow: 0 3px 1px #80c8f2 inset, 0 -1px 0 #106598 inset, 0 -2px 2px
		#80c8f2 inset;
	background: -webkit-linear-gradient(top, #1797e3, #1275af);
	background: -moz-linear-gradient(top, #1797e3, #1275af);
	background: linear-gradient(top, #1797e3, #1275af);
}
</style>
</head>
<body background="images/disy1.jpg">
	<%
		String name = request.getParameter("name");
		List<User> a = (List<User>) request.getAttribute("students");
	%>

	<%
		for (User b : a) {
			if (b.getReader_phone().equals(name)) {
	%>
	<div class="about" id="about">
		<div class="col-md-6 "></div>
		<div class=" person-info-agileits-w3layouts" style="margin: 0 auto;">
			<h3 class="w3_head w3_head1">
				About Me <span>I am <%
				out.println(b.getReader_name());
			%></span>
			</h3>
			<p class="w3_head w3_head1">
				<span>Welcome to mandarin! This is your Personal Information</span>
			</p>
			<div class="col-md-6 "></div>
			<ul class="col-md-6 ">

				<li><span>Name</span>:<%
					out.println(b.getReader_name());
				%></li>
				<li><span>Phone</span>:<%
					out.println(b.getReader_phone());
				%></li>

				<li><span>Email</span>:<%
					out.println(b.getReader_email());
				%></li>

				<li><span>Deposit</span>: <%
					out.println(b.getDeposit());
				%></li>
				<li><span>BorrowedBooks</span>:<%
					out.println(b.getBorrow_num());
				%></li>
				<li><span>DateDocuments</span>: <%
					out.println(b.getRegistration_date());
				%></li>
				<br><br>
				<li>
		<a href='PE?phone=<%=b.getReader_phone()%>'><button type="button"
				class="button blue" style="margin-left: 32px; margin-top: -34px">Modify
				information</button></a></li>
			</ul>
			<!-- mid -->
			</br>
		</div>
	</div>


	



	<!-- //about-bottom -->
	<div id="small-dialog" class="mfp-hide w3ls_small_dialog wthree_pop">
		<div class="agileits_modal_body">
			<iframe src=""></iframe>
		</div>
	</div>

	<!-- //mid -->
	<!--skills -->



	<!-- Navigation-JavaScript -->
	<!-- menu -->
	<script>
		$(document)
				.ready(
						function() {
							$('.mobile-nav-button')
									.on(
											'click',
											function() {
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(1)")
														.toggleClass(
																"mobile-nav-button__line--1");
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(2)")
														.toggleClass(
																"mobile-nav-button__line--2");
												$(
														".mobile-nav-button .mobile-nav-button__line:nth-of-type(3)")
														.toggleClass(
																"mobile-nav-button__line--3");

												$('.mobile-menu').toggleClass(
														'mobile-menu--open');
												return false;
											});
						});
	</script>
	<!-- //menu -->
	<!-- Gallery-plugin -->
	<script src="js/jquery.mobile.custom.min.js"></script>
	<script src="js/jquery.cm-overlay.js"></script>
	<script>
		$(document).ready(function() {
			$('.cm-overlay').cmOverlay();
		});
	</script>
	<!-- //Gallery-plugin -->
	<!-- responsiveslides -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto : true,
				pager : false,
				nav : true,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!-- //responsiveslides -->

	<!-- //Navigation-JavaScript -->
	<!--pop-up-box -->
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //pop-up-box -->

	<!-- banner-type-text -->
	<script src="js/typed.js" type="text/javascript"></script>
	<script>
		$(function() {

			$("#typed").typed({
				// strings: ["Typed.js is a <strong>jQuery</strong> plugin.", "It <em>types</em> out sentences.", "And then deletes them.", "Try it out!"],
				stringsElement : $('#typed-strings'),
				typeSpeed : 30,
				backDelay : 500,
				loop : false,
				contentType : 'html', // or text
				// defaults to false for infinite loop
				loopCount : false,
				callback : function() {
					foo();
				},
				resetCallback : function() {
					newTyped();
				}
			});

			$(".reset").click(function() {
				$("#typed").typed('reset');
			});

		});

		function newTyped() { /* A new typed object */
		}

		function foo() {
			console.log("Callback");
		}
	</script>
	<!-- //banner-type-text -->
	<!-- jarallax-js -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>

	<div class="arr-w3ls">
		<a href="#home" id="toTop" style="display: block;"> <span
			id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
	<!-- //smooth scrolling -->


	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	<%
		}
		}
	%>
</body>
</html>