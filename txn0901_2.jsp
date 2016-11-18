<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.neux.utility.utils.jsp.info.JSPQueryStringInfo"%>
<%@ page import="com.neux.utility.utils.jsp.JSPUtils"%>
<%@ page import="com.neux.proj.eai.rq.CheckRQBean"%>
<%@ page import="com.neux.proj.eai.rs.CheckRSBean"%>
<%@ page import="org.apache.commons.lang3.StringUtils"%>
<%@ page import="com.neux.utility.orm.dal.dao.module.IDao"%>
<%@ page import="com.neux.utility.orm.dal.SQLCommand"%>
<%@ page import="com.neux.garden.dbmgr.DaoFactory"%>
<%@ page import="com.neux.utility.orm.bean.DataObject"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!-- saved from url=(0053)http://garden.decoder.com.tw/ebill/ebill1.html# -->
<html
	class="js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="keywords" content="彰化銀行,彰銀" />
<meta name="description" content="" />
<meta name="author" content="kyart.com.tw">
<meta name="copyright" CONTENT="本網頁著作權CHB所有">
<meta name="URL" content="http://www.tbb.com.tw/">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap_ie8_fix.css">
<link rel="stylesheet" type="text/css" href="assets/css/component.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">

<link rel="stylesheet" href="assets/css/icomoon.css">
<link rel="stylesheet" href="assets/css/jquery.mmenu.all.css" />
<link rel="stylesheet" type="text/css" href="assets/css/jPushMenu.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/jquery.keypad.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/simple-sidebar.css">

<link rel="stylesheet" href="css/ky-about.css">
<link rel="stylesheet" href="css/style_payment.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style_common.css">


<!--[if IE 7]>
    <link rel="stylesheet" href="css/style_ie7.css">
    <![endif]-->
<title>彰化銀行全球資訊網</title>
</head>

<body class="pageie7">

	<!-- 內容區塊 -->
	<div class="page-content dashboard-style">
		<div class="container">
			<div class="pg-header">

				<div class="stepHeader">

					<ol class="breadcrumb">
						<li class="breadcrumb-active"><i
							class="glyphicon glyphicon-home"></i>信用卡申請</li>
						<li><a href="#" class="breadcrumb-active">輸入預填資料</a></li>
						<li><a href="#">確認頁</a></li>
					</ol>

					<!-- For IE7 -->
					<div class="stepBoxIE7 stepThree">
						<ul>
							<li>輸入預填資料</li>
							<li>預填單確認</li>
							<li>交易結果</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h4>預填單資訊</h4>
				</div>

			</div>

			<form role="form" method="post" id="tx0901_2_form"
				name="tx0901_2_form">
				<div class="pg-body">

					<!-- 頁面起始 page1 -->
					<fieldset class="page" id="page1">


						<!-- 「資金用途」 -->
						<div class="form-group">
							<h5>資金用途：</h5>
							<input type="text" id="purpose" name="purpose"
								value='${param.purpose}' default='' />
						</div>

						<!-- 「資金用途」「其它資金用途」 -->
						<div class="form-group">
							<h5>其它資金用途：</h5>
							<textarea id="purpose_1" name="purpose_1" rows=rows=
								"3" cols="38" style="width: 100%" value='${param.purpose_1}'>
							</textarea>
						</div>

						<!-- 「*姓名」 -->
						<div class="form-group">
							<h5>姓名：</h5>
							<input type="text" id="name" name="name" class="form-control"
								maxlength="5" size="5" placeholder="請輸入姓名" value='${param.name}'>
						</div>

						<!-- 「*行動電話」 -->
						<div class="form-group">
							<h5>行動電話：</h5>
							<input type="text" id="phone" name="phone" class="form-control"
								maxlength="10" size="10" placeholder="請輸入行動電話"
								value='${param.phone}'>
						</div>

						<!-- 「*電子郵件信箱」 -->
						<div class="form-group">
							<h5>電子郵件信箱：</h5>
							<input type="text" name="email" class="form-control"
								maxlength="30" size="30" placeholder="請輸入電子郵件信箱"
								value='${param.email}'>
						</div>

						<!-- 「備註」 -->
						<div class="form-group">
							<h5>備註：</h5>
							<textarea id="note" name="note" rows="3" cols="38"
								style="width: 100%" value='${param.note}'>
							</textarea>
						</div>

						<div class="form-group">
							<input type="hidden" name="txnNo" id="txnNo" value="Txn0901">

							<button type="button" class="btn btn-default" id="back">回上一頁</button>
							<button type="button" id="confirm" class="btn btn-normal">確認</button>
						</div>

					</fieldset>


				</div>
			</form>
		</div>

	</div>

	<hr>


	<!-- 內容區塊 -->

	<div class="keypad-popup" style="display: none;"></div>


	<script src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/canvasjs.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.pseudo.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/cbpHorizontalMenu.min.js"></script>
	<script src="js/jquery.magnific-popup.js"></script>
	<script src="js/jquery.tabSlideOut.v1.3.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/jPushMenu.js"></script>
	<script type="text/javascript" src="js/jquery.mmenu.min.all.js"></script>
	<script src="js/jquery.easing.js"></script>
	<script src="js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="js/jquery.plugin.min.js"></script>
	<script type="text/javascript" src="js/jquery.keypad.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/script_cp.js"></script>


	<script type="text/javascript" src="js/ebill_utils.js"></script>
	<div id="mm-blocker" class="mm-slideout"></div>

	<script>
		function set_page_param() //
		{
			var tmp_val;

			$('input:text').attr('readonly', true);
			$('input:checkbox').attr('disabled', true);
			$('select').attr('disabled', true);

			tmp_val = "<c:out value='${param.applyrelcd}' default=''></c:out>";
			if (tmp_val == '1') //
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '配偶'
				}));
			}//
			else if (tmp_val == '2') //
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '父母'
				}));
			}//
			else if (tmp_val == '3') //
			{

				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '子女'
				}));

			} //
			else if (tmp_val == '4')//
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '兄弟姊妹'
				}));
			}//
			else if (tmp_val == '5') //
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '受雇員工'
				}));

			}//
			else if (tmp_val == '6') //
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '其他'
				}));

			}//
			else //
			{
				$('[name=applyrelcd]').append($('<option>', //
				{
					value : tmp_val,
					text : '配偶父母'
				}));
			}
		}

		function conver_ss(element) //
		{
			var tmp = new Array();
			var a = element.val();
			var b = "";

			for (var i = 0; i < a.length; i++) //
			{
				if (a.charCodeAt(i) <= 57 && a.charCodeAt(i) >= 48) //
				{
					tmp[i] = a.charCodeAt(i) + 65248;//轉全形unicode +65248
				}//
				else //
				{
					tmp[i] = a.charCodeAt(i)
				}

				b += String.fromCharCode(tmp[i]);
			}
			element.val(b);
		}

		$(document)
				.ready(
						function() //
						{
							set_page_param();

							$('#back').off('click').on(digitbr_event,
									function(ev) //
									{
										ev.stopPropagation();
										ev.preventDefault();
										history.go(-1);
									});

							$('#confirm')
									.on(
											digitbr_event,
											function(ev)//
											{
												$('#confirm').attr('disabled',
														true);
												$('#confirm').css(
														'background-color',
														'#cccccc');

												var form = $('#tx0901_2_form');

												var formParam = form
														.serialize();

												$
														.ajax(//
														{
															async : false,
															url : 'TxnServlet?v='
																	+ new Date()
																			.getMilliseconds(),
															data : formParam,
															type : 'POST',
															dataType : 'json',
															success : function(
																	json) //
															{
																if (json.isSuccess == 'Y') //
																{
																	var form1 = $('#tx0901_2_form');
																	$('<input>')
																			.attr(
																					{
																						type : 'hidden',
																						name : 'apt',
																						value : json.APT
																					})
																			.appendTo(
																					form1);
																	form1
																			.attr(
																					"action",
																					"txn0001_3.jsp");
																	form1
																			.submit();
																} else if (json.isSuccess == 'N') {
																	ev
																			.preventDefault();
																	modal
																			.open({
																				title : "<strong>錯誤<strong>",
																				content : "<p>"
																						+ json.RespDesc
																						+ "</p>",
																				back : true
																			});
																	$(
																			'#confirm')
																			.css(
																					'background-color',
																					'');
																	$(
																			'#confirm')
																			.removeAttr(
																					'disabled');
																} else {
																	ev
																			.preventDefault();
																	modal
																			.open({
																				title : "<strong>錯誤<strong>",
																				content : "<p>不明原因的錯誤，請洽詢客服人員  02-412-2222</p>",
																				back : true
																			});
																	$(
																			'#confirm')
																			.css(
																					'background-color',
																					'');
																	$(
																			'#confirm')
																			.removeAttr(
																					'disabled');

																}

																//window.location = 'print_result.jsp';

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																alert("er");
															}
														});
											});

						});
	</script>

</body>
</html>