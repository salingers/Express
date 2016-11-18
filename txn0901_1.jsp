<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.neux.utility.utils.jsp.info.JSPQueryStringInfo"%>
<%@ page import="com.neux.utility.utils.jsp.JSPUtils"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="com.neux.proj.eai.rq.CheckRQBean"%>
<%@ page import="com.neux.proj.eai.rs.CheckRSBean"%>
<%@ page import="com.neux.proj.eai.EAIAgent"%>
<%@ page import="com.neux.proj.eai.rs.PayRSBean"%>
<%@ page import="com.neux.proj.eai.rq.PayRQBean"%>
<%@ page import="com.neux.garden.dbmgr.DaoFactory"%>
<%@ page import="com.neux.utility.orm.bean.DataObject"%>
<%@ page import="com.neux.garden.dbmgr.WebFlowDao"%>
<%@ page import="com.neux.utility.orm.dal.dao.module.IDao"%>
<%@ page import="java.util.*"%>

<%@ page import="com.neux.utility.orm.ORMAPI"%>



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
<meta name="copyright" CONTENT="本網頁著作權彰化銀行所有">
<meta name="URL" content="http://www.bankchb.com/">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--[if IE 8]>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <![endif]-->
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="css/ky-about.css">
<link rel="stylesheet" href="css/style_payment.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style_common.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="css/digitbr_utils.css">
<!--[if IE 7]>
    <link rel="stylesheet" href="css/style_ie7.css">
    <![endif]-->
<title>彰化銀行數位分行</title>

<style>
.page {
	display: none;
}

.clickable {
	cursor: pointer;
}
</style>


</head>


<title>彰化銀行數位分行</title>
</head>

<body class="pageie7">

	<!-- 內容區塊 -->
	<div class="page-content dashboard-style">

		<div class="container">
			<div class="pg-header">

				<!-- ------------------------------------------------------------ -->
				<!-- 導覽列 -->
				<!-- ------------------------------------------------------------ -->

				<div class="stepHeader">

					<!-- For正常 -->

					<ol class="breadcrumb">
						<li class="breadcrumb-active"><i
							class="glyphicon glyphicon-home"></i>申辦個人貸款</li>
						<li><a href="#" class="breadcrumb-active">輸入預填資料</a></li>
						<li><a href="#">確認頁</a></li>
					</ol>

					<!-- For IE7 -->
					<div class="stepBoxIE7 stepTwo">
						<ul>
							<li>輸入預填資料</li>
							<li>預填單確認</li>
							<li>交易結果</li>
						</ul>
					</div>

				</div>

			</div>





			<!-- ------------------------------------------------------------ -->
			<!-- 表單-->
			<!-- ------------------------------------------------------------ -->



			<form role="form" method="post" id="tx0901_1_form"
				name="tx0901_1_form" action="txn0901_2.jsp">
				<div class="pg-body">

					<!-- ------------------------------------------------------------ -->
					<!-- 浮動視窗 -->
					<!-- ------------------------------------------------------------ -->


					<div class="modal fade" id="info" role="dialog">
						<div class="modal-dialog">

							<!-- 訊息內容-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">同意事項</h4>
								</div>
								<div class="modal-body">
									<p>本行保有最後核貸權。</p>

								</div>
								<div class="modal-footer">


									<button type="submit" class="btn btn-default"
										data-dismiss="modal" id="agree" name="agree">同意</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" id="disagree" name="disagree">不同意</button>
								</div>
							</div>
						</div>
					</div>

					<!-- ------------------------------------------------------------ -->
					<!--  -->
					<!-- ------------------------------------------------------------ -->

					<div class="panel panel-warning">
						<div class="panel-heading">
							<p>申辦個人貸款</p>
						</div>
					</div>

					<!-- ------------------------------------------------------------ -->
					<!--  -->
					<!-- ------------------------------------------------------------ -->

					<fieldset class="page" id="page1">

						<!-- 「資金用途」 -->
						<div class="form-group">
							<h5>資金用途：</h5>
							<select id="purpose" name="purpose" title="請選擇一項用途"
								style="width: 100%">
								<option value="">請選擇</option>
								<option value="1">購屋(建)住宅</option>
								<option value="2">修繕住宅</option>
								<option value="3">購置汽車</option>
								<option value="4">理財週轉</option>
								<option value="5">其他個人小額信貸</option>
								<option value="6">其他</option>
							</select>
						</div>
						<!-- 「資金用途」「其它資金用途」 -->
						<div class="form-group">
							<h5>其它資金用途：</h5>
							<input id="purpose_1" name="purpose_1" />
						</div>
						<!-- 「*姓名」 -->
						<div class="form-group">
							<h5>姓名：</h5>
							<input type="text" id="name" name="name" class="form-control"
								maxlength="5" size="5" placeholder="請輸入姓名">
						</div>
						<!-- 「*行動電話」 -->
						<div class="form-group">
							<h5>行動電話：</h5>
							<input type="tel" id="phone" name="phone" class="form-control"
								maxlength="10" size="10" placeholder="請輸入行動電話">
						</div>
						<!-- 「*電子郵件信箱」 -->
						<div class="form-group">
							<h5>電子郵件信箱：</h5>
							<input type="email" name="email" class="form-control"
								maxlength="30" size="30" placeholder="請輸入電子郵件信箱">
						</div>
						<!-- 「備註」 -->
						<div class="form-group">
							<h5>備註：</h5>
							<textarea id="note" name="note" maxlength="50" rows="3" cols="38"
								style="width: 100%">
										</textarea>
						</div>



						<!-- ------------------------------------------------------------ -->
						<!--  -->
						<!-- ------------------------------------------------------------ -->


						<div class="form-group" align="right">
							<input type="submit" style="display: none;" />
							<button type="button" class="btn btn-default" name="close">回預填單主頁</button>
							<button type="button" id="confirm" name="next"
								class="next btn btn-normal">確認</button>
						</div>
					</fieldset>


				</div>
			</form>
			<hr>

		</div>

		<div class="step-footer"></div>
	</div>


	<div class="keypad-popup" style="display: none;"></div>


	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.mmenu.min.all.js"></script>
	<script type="text/javascript" src="js/jquery.easing.js"></script>
	<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="js/jquery.plugin.min.js"></script>
	<script type="text/javascript" src="js/jquery.keypad.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/ebill_utils.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/moment.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript" src="assets/js/txn0601.js"></script>
	<script type="text/javascript" src="js/validate_showErrors.js"></script>
	<script type="text/javascript" src="js/tooltip.js"></script>
	<script type="text/javascript" src="js/jquery.validate.ext.js"></script>
	<script type="text/javascript" src="assets/js/accvalidate.js"></script>
	<script type="text/javascript" src="js/jquery.twzipcode.js"></script>

	<div id="mm-blocker" class="mm-slideout"></div>
	<script>
		//------------------------------------------------------------
		// 
		//------------------------------------------------------------
		window.onload = function() //
		{
			$('#confirm').removeAttr('disabled');
			$('#confirm').css('background-color', '');
		}();
		//------------------------------------------------------------
		// 
		//------------------------------------------------------------

		$(document).ready(
				function() //
				{
					//------------------------------------------------------------
					// 初始化
					//------------------------------------------------------------

					$('#page1').show();

					var purpose_textarea = jQuery('<textarea />').attr(//
					{
						'id' : 'purpose_1',
						'name' : 'purpose_1',
						'rows' : '3',
						'cols' : '38',
						'maxlength' : '50',
						'style' : 'width: 100'
					});
					$('#purpose_1').replaceWith(purpose_textarea);
					$('#purpose_1').parent().hide();

					//------------------------------------------------------------
					//按鈕事件
					//------------------------------------------------------------

					$('button[name=agree]').on('click touchstart', function(e) //
					{
						e.preventDefault();
						e.stopPropagation();

						$('input[type="submit"]').trigger('click');
					});

					$('button[name=disagree]').on(
							'click touchstart',
							function(e) //
							{
								e.preventDefault();
								e.stopPropagation();
								
								$('#info').modal('hide');

								$('#confirm').attr('disabled', false);
								$('#confirm').css(' background-color',
										'#ffffff');
							});

					$('button[name=close]').on('click touchstart', function(e) //
					{
						e.preventDefault();
						e.stopPropagation();

						history.go(-1);
					});

					//------------------------------------------------------------
					//表單 - 按鈕事件
					//------------------------------------------------------------

					$('#purpose').on('change', function(e) //
					{
						var selected = $(this).find("option:selected");
						var value = selected.val();

						if (value == '6') //
						{
							$('#purpose_1').parent().show();
						}//
						else //
						{
							$('#purpose_1').parent().hide();
						}
					});

					$('button[name=close]').on('click touchstart', function(e) //
					{
						e.preventDefault();
						e.stopPropagation();

						history.go(-1);
					});

					$('#confirm').on(digitbr_event, function(e) //
					{
						e.stopPropagation();
						e.preventDefault();

						if (IsValidated($('#page1'))) //
						{
							$('#confirm').attr('disabled', true);
							$('#confirm').css(' background-color', '#cccccc');

							$('#info').modal('show');

						}
					});

					//------------------------------------------------------------
					//驗證事件
					//------------------------------------------------------------
					//purpose
					//purpose_1
					//name
					//phone
					//email
					//note

					//purpose
					$.validator.addMethod("selectedvalue", function(value,
							element, arg) //
					{
						console.log('value');
						console.log(value);
						console.log('element');
						console.log(element);
						console.log('arg');
						console.log(arg);
						return arg != value;
					}, "請選擇一項用途");
					//name
					$.validator.addMethod("chinese", function(value, element) //
					{
						var chinese = /^[\u4e00-\u9fa5]+$/;
						return this.optional(element) || (chinese.test(value));
					}, "請輸入中文");

					//驗證欄位
					var validator = $("#tx0901_1_form").validate(
							{
								showErrors : validate_err,
								onsubmit : false,
								rules : //
								{
									purpose : //
									{
										selectedvalue : ""
									},
									purpose_1 : //
									{
										required : function(e) //
										{
											return $(e).closest('form').find(
													'#purpose').val() == 6;
										},
										minlength : 1
									},
									name : //
									{
										required : true,
										chinese : true,
										minlength : 1
									},
									phone : //
									{
										required : true,
										digits : true,
										minlength : 10
									},
									email : //
									{
										required : true,
										email : true
									}
								},

								messages : //
								{
									purpose : //
									{
										selectedvalue : "請選擇一項用途。"
									},
									purpose_1 : //
									{
										required : "為必填選項，提供50位文字格式欄位。",
										minlength : jQuery.validator
												.format("請輸入其他基金用途。")
									},
									name : //
									{
										required : "為必填選項，請輸入中文名稱。",
										chinese : "請輸入中文名稱。"
									},
									phone : //
									{
										required : "為必填選項，提供10位數字格式欄位。",
										digits : jQuery.validator
												.format("請輸入數字。"),
										minlength : jQuery.validator
												.format("請輸入正確的電話長度與格式。")
									},
									email : //
									{
										required : "為必填選項，提供30位數英、數字格式欄位。",
										email : "請輸入正確的MAIL制定格式。"
									}
								},
								submitHandler : function(form) //
								{
									//	form.submit();
								}
							});

				});

		//------------------------------------------------------------
		// 驗證函式
		//------------------------------------------------------------
		function IsValidated(group) //
		{

			var isValid = true;

			group.find(':input').each(function(i, item) //
			{
				$(item).validate();

				if (!$(item).valid()) //
				{
					isValid = false;
				}
			});

			group.find('#selected').each(function(i, item) //
			{
				$(item).validate();

				if (!$(item).valid()) //
				{
					isValid = false;
				}
			});

			return isValid;
		}
	</script>
</body>
</html>