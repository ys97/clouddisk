<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${filename }</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="css/video-js.min.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/video.min.js"></script>
<script>
	videojs.options.flash.swf = "js/video-js.swf";
</script>
<%
	String[] apis = {"http://jiexi.92fz.cn/player/vip.php?url=", "https://api.47ks.com/webcloud/?v=",
			"https://all.baiyug.cn:2021/vip_all/index.php?url=", "http://api.hlglwl.com/jx.php?url=",
			"https://www.917k.la/?url=", "https://2wk.com/vip.php?url="};
	int n = 0;
	pageContext.setAttribute("apis", apis);
	Map<String, String> searchengines = new HashMap<String, String>() {
		{
			put("爱奇艺", "https://so.iqiyi.com/so/q_");
			put("优酷", "https://so.youku.com/search_video/q_");
		}
	};
%>
<script type="text/javascript">
	$(function() {
		$("#bt").bind("click", function() {
			var source = $("#source").val();
			//var myPlayer = videojs('myvideo');
			//myPlayer.src(source);
			//myPlayer.load();
			videojs("myvideo", {
				source : [ {
					src : source,
					type : 'video/mp4'
				}, {
					src : source,
					type : 'video/webm'
				}, {
					src : source,
					type : 'video/ogg'
				} ]
			}, function() {
				this.load();
			});
		});
		$("#apis")[0].selectedIndex = 0;
		$("#searchengine")[0].selectedIndex = 0;
		//window.history.back(-1);
		$("#searchbt").click(function() {
			var searchvalue = $("#searchvalue").val();
			var searchengine = $("#searchengine").val();
			window.open(searchengine + searchvalue);
		});

		$("#vipbt")
				.click(
						function() {
							var source = $("#vipsource").val();
							var api = $("#apis").val();
							$(".video-area")
									.html(
											'<iframe id="play-box" height="100%" width="100%" src='
													+ api
													+ source
													+ ' frameborder=0 border="0"  allowfullscreen="true"></iframe>');
						});
	})
</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">410云盘</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="${pageContext.request.contextPath}/autoSignIn?user_name=${user_name}"><span
						class="glyphicon glyphicon-user"></span>我的主页</a></li>
				<li><a href="${pageContext.request.contextPath}/index.jsp"><span
						class="glyphicon glyphicon-home"></span>首页</a></li>
				<li><a href="${pageContext.request.contextPath}/help.jsp"><span
						class="glyphicon glyphicon-info-sign"></span>帮助</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="form-group">
					<input id="source" type="text" class="col-lg-9"> <label
						id="bt" class="col-lg-1">自定义播放</label>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-10  col-lg-offset-1">
				<div class="form-group">
					<select class="col-lg-1" id="searchengine"><c:forEach
							items="${searchengines}" var="searchengine">
							<option value="${searchengine.value }">${searchengine.key }
						</c:forEach></select> <input id="searchvalue" type="text" class="col-lg-8"> <label
						id="searchbt" class="col-lg-1">视频搜索</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="form-group">
					<select class="col-lg-1" id="apis"><c:forEach
							items="${apis }" var="api">
							<option value="${api }">解析地址${n=n+1 }</option>
						</c:forEach>
					</select> <input id="vipsource" type="text" class="col-lg-8"> <label
						id="vipbt" class="col-lg-1">vip视频解析</label>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div>
					<h4>${filename}</h4>
				</div>
				<div class="video-area" style="height: 600px">
					<video id="myvideo"
						class="video-js vjs-big-play-centered vjs-fluid" controls
						preload="auto" data-setup="{}">
						<source src="${url}" type='video/mp4' />
						<source src="${url}" type='video/webm' />
						<source src="${url}" type='video/ogg' />
						<!-- <track kind="captions" src="demo.captions.vtt"
					srclang="en" label="English"> </track>Tracks need an ending tag thanks to IE9
				<track kind="subtitles" src="demo.captions.vtt" srclang="en"
					label="English"></track>Tracks need an ending tag thanks to IE9 -->
					</video>
				</div>
				<script type="text/javascript">
					//var myPlayer = videojs('myvideo');
					videojs("myvideo", {
						//techOrder:["html5","flash"],
						//bigPlayButton:false,
						//textTrackDisplay:false,
						//posterImage:false,
						//errorDisplay:false,
						//"autoPlay":true,
						//fluid : true,
						playbackRates : [ 0.5, 1, 1.5, 2 ],
					//control:{
					//captionsButton:false,
					//chaptersButton:false,
					//subtitlesButton:false,
					//liveDisplay:false
					//}
					}).ready(function() {
						//console.log(this);
						this.play();
					});
				</script>
			</div>
		</div>
	</div>
</body>
</html>