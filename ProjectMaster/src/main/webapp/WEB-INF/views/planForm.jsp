<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Plan</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="/planbe/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/planbe/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="/planbe/resources/bootstrap/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="/planbe/resources/bootstrap/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<link id="base-style" href="/planbe/resources/bootstrap/css/calendarSchedule.css" rel="stylesheet">
	<link id="base-style" href="/planbe/resources/bootstrap/css/jquery.timepicker.css" rel="stylesheet">
	<link id="base-style" href="/planbe/resources/bootstrap/css/jquery.timepicker.min.css" rel="stylesheet">
		<link id="base-style" href="/planbe/resources/bootstrap/css/wickedpickercss" rel="stylesheet">
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="/planbe/resources/bootstrap/css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="/planbe/resources/bootstrap/css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="/planbe/resources/bootstrap/img/favicon.ico">
	<!-- end: Favicon -->
	
	<!-- pdf 파일 보여줄 때, 형식 -->
	
	<!-- pdf 파일 보여줄 때, 형식 -->
	
	
	<script type="text/javascript">
	 
    $("#startTime").timepicker();
    $("#endTime").timepicker();
	</script>
	

	
</head>

<body>
	
<!-- Head Menu -->
	<div>
	<%@include file="headMenu.jsp"%>
    </div>
	
		<div class="container-fluid-full">
		<div class="row-fluid">
		
<!-- Side Menu -->
	<div>
     <%@include file="sideMenu.jsp"%>
    </div>	

			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
						
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.jsp">Main</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Plan</a></li>
			</ul>
			
			<div>
				<a href="/planbe/plan/pdfForm"><input type="button" id="excel" class="pull-right" value="PDF"/></a>
			</div>

			<div class="row-fluid sortable">
				<div class="box span12">
				  <div class="box-header" data-original-title>
					  <h2><i class="halflings-icon white calendar"></i><span class="break"></span>Calendar</h2>
				  </div>
				 
				

						<div id="calendar" class="span9"></div>

						<div class="clearfix"></div>
					
			
					
					<!-- 일정 생성 modal -->
	<div class="modal fade" id="schduleForm" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">close</button>
					<h4 class="modal-title">일정등록</h4>
				</div>
				
				
				<div class="modal-body">
					<form class='form-margin40' action="/planbe/plan/insertPlan" method="POST"
						id='frmSchdule' name="form">
						
						<input type="hidden" name="userNo" id="userNo" value="${userNo}">				
						<div class='form-group'>
							<label>제목</label> <input type='text' class='form-control'
								id='summary' name='title'
								placeholder="예: 오후 6시에 팀 회식">
						</div>
						<div class='form-group'>
							<label>시작시간</label> <input class='form-control' type="time"
								id='startTime' name='startTime' readonly="readonly">
						</div>
						<div class='form-group'>
							<label>시작날짜</label> <input class='form-control startDate'
								type="date" id='startDate' name='startDate'  readonly="readonly">
						</div>
						<div class='form-group'>
							<label>종료시간</label> <input class='form-control' type="time"
								id='endTime' name='endTime'>
						</div>
						<div class='form-group'>
							<label>종료날짜</label> <input class='form-control startDate'
								type="date" id='endDate' name='endDate'>
								
						</div>
						<div class='form-group'>
							<label>내용</label>
							<textarea rows="7" class='form-control' id="description"
								name='content'></textarea>
						</div>
						<div class='modal-footer'>
							<input type="submit" class='btn btn-sm btn-warning' value="확인" /> 
							<input type="reset" class='btn btn-sm btn-warning' value="초기화"/> 
							<input type='button' class='btn btn-sm btn-warning'data-dismiss='modal' value="취소"/>
						</div>
					</form>
				</div>
				
				
			</div>
		</div>
	</div>
					
				</div>
			</div><!--/row-->
			
			<!-- pdf 파일 -->
			
			<div id="results" class="hidden"></div>
    		<div id="pdf"></div>



			
			<!-- pdf 파일 -->
		

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">Ã</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="http://themifycloud.com">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2017 <a href="/planbe/ourTeam" alt="Bootstrap_Metro_Dashboard">SCIT MASTER 33rd CLASS B TEAM 2 </a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="/planbe/resources/bootstrap/js/jquery-1.9.1.min.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/modernizr.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/bootstrap.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.cookie.js"></script>
	
		<script src='/planbe/resources/bootstrap/js/fullcalendar.js'></script>
		
		<script src='/planbe/resources/bootstrap/js/fullcalendar.init.js?version=10'></script>
	
		<script src='/planbe/resources/bootstrap/js/jquery.dataTables.min.js'></script>

		<script src="/planbe/resources/bootstrap/js/excanvas.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.pie.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.stack.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.resize.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.chosen.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uniform.min.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/jquery.cleditor.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.noty.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.elfinder.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.raty.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.iphone.toggle.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.gritter.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.imagesloaded.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.masonry.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.knob.modified.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.sparkline.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/counter.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/retina.js"></script>

		<script src="/planbe/resources/bootstrap/js/custom.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/pdfobject.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/pdfobject.min.js"></script>
			
		<script src="/planbe/resources/bootstrap/js/moment.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/wickedpicker.js"></script>
		
		
	<!-- end: JavaScript-->
	
</body>
</html>
