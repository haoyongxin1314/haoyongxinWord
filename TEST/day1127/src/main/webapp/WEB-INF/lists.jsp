<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";  //http://localhost:8080/easyuiDemo/easyui
	String linkPath = basePath+"/easyui"; //http://localhost:8080/easyuiDemo/easyui
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- 1引入easyui的css样式 -->

<link href="<%=linkPath %>/themes/black/easyui.css"  rel="stylesheet" type="text/css" >
<link href="<%=linkPath %>/themes/color.css" >
<link href="<%=linkPath %>/themes/icon.css" >
<!-- 2引入easyui的js -->
<script type="text/javascript" src="<%=linkPath %>/jquery.min.js"></script>
<script type="text/javascript" src="<%=linkPath %>/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=linkPath %>/easyui-lang-zh_CN.js"></script>

<title>Easyui样式界面</title>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',title:'头部标签',split:true" style="height:100px;">
           <center>
               <b style="font-size: 20px">这是我做的一个项目，瞎玩的！</b>
           </center>
    </div>       
    <div data-options="region:'west',title:'菜单栏',split:true" style="width:100px;">
        <a id="leftMenuOne" href="javascript:void(0)" class="easyui-linkbutton" style="margin: 10px;color: red">点击展示列表</a>
    	<a id="leftMenuTwo" href="javascript:void(0)" class="easyui-linkbutton" style="margin: 10px;color:pink" >点击啥也没有</a>
    </div>   
    <div data-options="region:'center',plain:false,fit:true" style="background:#eee;" class="easyui-tabs" id="tt">
		   
    </div>
    <div data-options="region:'east',iconCls:'icon-reload',title:'右侧',split:true" style="width:100px;"></div> 
            
	<script type="text/javascript">
	$(function(){
 		$("#leftMenuOne").click(function(){
 			
 			var exists = $('#tt').tabs("exists","电子商务");
 			
 			if(exists){
 				//选中该标签页
 				$('#tt').tabs("select","电子商务"); 	
 			}else{
 				//添加tabs标签页	
 	 			$('#tt').tabs('add',{
 	 			    title:'电子商务',
 	 			    // content:'Tab Body 1',
 	 			    href : "table.action",
 	 			    closable: true
 	 			});
 			}
 		})
 		
 		$("#leftMenuTwo").click(function(){
 			
 			var exists = $('#tt').tabs("exists","哇哇");
 			
 			if(exists){
 				$('#tt').tabs("select","哇哇"); 
 			}else{
 				//添加tabs标签页	
 	 			$('#tt').tabs('add',{
 	 			    title:'哇哇',
 	 			    content:'啥也没有 ',
 	 			    closable: true
 	 			});
 			}
 		})
 		
 		
 	})
	</script>
</body>  

</html>