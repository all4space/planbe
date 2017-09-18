<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Gantt</title>
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
	
		
		
<script type = "text/javascript" src="/planbe/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	
</head>
<style type="text/css"> #chart_div { overflow-y: scroll; height: 500px; } </style> 
<script>


	$(function(){
		/* var projectNo = ${projectNo}
		if(projectNo != null){ Gantt(); } */
		google.charts.load('current', {'packages':['gantt']});
		google.charts.setOnLoadCallback(drawChart); 
	})
	
function drawChart(GanttList, date) {
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Task ID');
  data.addColumn('string', 'Task Name');
  data.addColumn('string', 'Resource');
  data.addColumn('date', 'Start Date');
  data.addColumn('date', 'End Date');
  data.addColumn('number', 'Duration');
  data.addColumn('number', 'Percent Complete');
  data.addColumn('string', 'Dependencies');
 
  var listSize = null;
  
  $(GanttList).each(function(index, item) {
	var per = (item.doneTime / item.totalTime) * 100;
		if(date != 'year'){
			a = [item.taskNo+'d', item.taskName, item.taskPriority, new Date(item.startDate), new Date(item.dueDate), null, per, null];
		}else{
			var dueDate = (parseInt(item.dueDate) + index);
			a = [item.taskNo+'d', item.taskName, item.taskPriority, new Date(item.startDate,00,00), new Date(dueDate,00,00), null, per, null];
		}
	data.addRow(a);
	listSize += 1;
  });// for each 
  
  var options = {
    height: listSize*40,
    gantt: {
      trackHeight: 30
    }
  };

  var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

  chart.draw(data, options);
}

/* 버튼 생성  */	
	function drawButton(projectNo){
		var date = ["'year'","'month'","'week'"];
     	var button = '<input type = "button" class="btn" onclick="Gantt('+projectNo+','+date[0]+')" value = "year">';
			button += '<input type = "button" class="btn" onclick="Gantt('+projectNo+','+date[1]+')" value = "month">';
			button += '<input type = "button" class="btn" onclick="Gantt('+projectNo+','+date[2]+')" value = "week">';
		 $(".btn-group").html(button);
		
 		var address = ["'/planbe/task/taskForm'","'/planbe/wbs/wbsForm?projectNo="+projectNo+"'"];
		var button2 = '<button class="btn btn-large btn-primary" onclick= "location.href ='+address[0]+'">수정</button>'
			button2 += '<button class="btn btn-large btn-warning" onclick= "location.href ='+address[1]+'">「 WBS 」로 보기</button>';
		$(".btn_group2").html(button2);
	}

/* Gantt 데이터 불러오기 */	
	function Gantt(projectNo,date){
	var ad = null;	
		switch(date){
			case 'year' : ad = "/planbe/gantt/year"; break;
			case 'month' : ad = "/planbe/gantt/month"; break;
			default : ad = "/planbe/gantt/getGantt";
			}
		$.ajax({
		  		url: ad,
		  		type: "post",
		  		data: {"projectNo" : projectNo},
		  		datatype: "json",
		  		success: function(result) {
                    var GanttList = result;
                    drawChart(GanttList,date);
                    drawButton(projectNo);
				}, // success,
		  		error: function() {	alert("통신 에------라!");	}
		})
	}
</script>

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
				<li>
					<i class="icon-list-alt"></i>
					<a href="#">Gantt</a>
				</li>
			</ul>
			
	
<!-- ========================================================================================================================== -->
					
								
			
	        <!-- WBS 트리 박스  -->
				
			<!-- Project List 페이지에서 하나의 프로젝트를 클릭하면, 해당 프로젝트의 projectNo을 넘기는 구조 -->
            
<!-- 내가 소속된 Project List 추출   -->
<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Project List</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content" onTablet="span6" onDesktop="span5">
						<table class="table table-striped table-bordered bootstrap-datatable datatable" >
						  <thead>
							  <tr>
								  <th>ProjectName</th>
								  <th>Project Content</th>
								  <th>Project Status</th>
								  <th>Start Date</th>
								  <th>Due Date</th>
								  <th>Authority</th>
							  </tr>
						  </thead>   
						  <tbody>
						  	<c:forEach items="${project}" var="project" varStatus="status">
									<tr>
										<td><button  class="btn btn-success" onclick="Gantt(${project.projectNo},'null')">${project.projectName}</button>
											</td>
										<td class="center">${project.projectContent}</td>
										<td class="center">
								<c:choose>
						  			<c:when test="${project.projectStatus == 'Waiting'}">
										<span class="label label-warning">${project.projectStatus}</span>
						  			</c:when>
						  			<c:when test="${project.projectStatus == 'Progress'}">
						  				<span class="label label-success">${project.projectStatus}</span>
						  			</c:when>
						  			<c:otherwise>
						  				<span class="label label-important">${project.projectStatus}</span>
						  			</c:otherwise>
								</c:choose>						  		
										</td>
										<td class="center">${project.startDate}</td>
										<td class="center">${project.dueDate}</td>
										<td class="center">${member[status.index].projectAuthority}</td>
									</tr>
						  	</c:forEach>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			</div><!--/row-->

<!-- gantt -->            
			  <div class="row-fluid">
				
				<div class="box span12">
						<div class="box-header">
							<h2><i class="halflings-icon white th"></i><span class="break"></span>Gantt Chart</h2>
						</div>
						
						<div class="box-content">
						<div id="chart_div"></div> <!-- Gantt  -->
						<div id="oneGroup">
							<p class="btn-group"><!-- 년월일 버튼  -->
							</p>							
						</div>
							<div class="box-content buttons">
								<p class="btn_group2"></p>
							</div> <!-- wbs연동  -->
						</div>
				</div><!--/span-->
			</div><!--/row-->			
			<div>
			
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
	
	<div class="clearfix"></div>

	<!-------------------------------------------------------------------------------------------------------------- 아래  -->	
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
	
		<script src='/planbe/resources/bootstrap/js/fullcalendar.min.js'></script>
	
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
	<!-- end: JavaScript-->
	
</body>
</html>
