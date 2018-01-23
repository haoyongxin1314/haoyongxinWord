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
<title>列表展示界面</title>
</head>
<body>
  <center>
    <h1 style="color: green">电子商务购物系统</h1>
     <table>
        <tbody>
          <tr>
             <td>
             品牌：
               <c:forEach items="${plist }" var="p">
                 <input type="checkbox" name="ping" value="${p.pid}">${p.pname}(${p.pename })
               </c:forEach>
             </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox" id="havegoods" name="havegoods">仅显示有货<br>
                请输入关键字查询：<input type="text" name="mohu" id="mohu" class="easyui-searchbox" style="width:300px" data-options="prompt:'请输入商品名称'">
            <a id="changePriceBtn" href="javascript:void(0)" class="easyui-linkbutton" >价格调整</a>
            <a id="showJiluBtn" href="javascript:void(0)" class="easyui-linkbutton" >价格调整记录</a>
            
            </td>
          </tr>
        </tbody>  
     </table>
       
   <table class="dd"></table>
   
   <div id="win" class="easyui-window" title="回显所选行的数据" style="width:600px;height:400px"
		    data-options="closed:true">
		   		<table>
		   			<tbody>
		   				<tr>
		   					<td>商品编号</td>
		   					<td id="sid"></td>
		   				</tr>
		   				<tr>
		   					<td>商品名称</td>
		   					<td id="sname"></td>
		   				</tr>
		   				<tr>
		   					<td>品牌（中文）</td>
		   					<td id="pname"></td>
		   				</tr>
		   				<tr>
		   					<td>品牌</td>
		   					<td id="pename"> </td>
		   				</tr>
		   				<tr>
		   					<td>尺寸</td>
		   					<td id="chicun"></td>
		   				</tr>
		   				<tr>
		   					<td>价格</td>
		   					<td>
		   						<input type="number"  id="price" name="price" >
		   						<input type="hidden"  id="hid" name="hid">
		   						<input type="hidden"  id="oldPrice" name="oldPrice">
		   					</td>
		   				</tr>
		   				<tr>
		   					<td></td>
		   					<td><a id="savePriceBtn" href="javascript:void(0)" class="easyui-linkbutton" >保存修改的价格</a></td>
		   				</tr>
		   			</tbody>
		   		</table>
		</div>
   
        <div id="win2" class="easyui-window" title="根据sid查看修改记录" style="width:600px;height:400px"
		    data-options="closed:true">
		    <table>
		   			<tbody>
		   				<tr>
		   					<td>商品编号</td>
		   					<td class="sid"></td>
		   				</tr>
		   				<tr>
		   					<td>商品名称</td>
		   					<td class="sname"></td>
		   				</tr>
		   				</tbody>
		   	</table>
		    <table id="jilu"></table>
		</div> 
   
  </center>
  
<script type="text/javascript">

   
   $(function(){
	   //查看商品记录事件
	   $("#showJiluBtn").click(function(){
		   var selectRow=$(".dd").datagrid("getSelected")
			  if(null==selectRow){
				  alert("请选择一条数据再进行查看");
				  return false;
			  }
		        
		        //td
		      $(".sid").text(selectRow.sid);
			  $(".sname").text(selectRow.sname);
		   var sid=selectRow.sid;
		   //弹窗之前初始化窗口里面的表格
		   $("#jilu").datagrid({
			   url:'getJiluList',
			   queryParams:{
				   sid:sid
			   },
			   fitColumns: true,//行宽自适应
			    columns:[[ //列属性
			    	{field:'createtime',title:'创建时间',width:150,
			    		formatter:function(value,row,index){
		    	        	 var date=new Date(value);
		    	        	 var y=date.getFullYear();
		    	        	 var m=date.getMonth()+1;
		    	        	 var d=date.getDate();
		    	        	 return y+"-"+m+"-"+d;
		    	         },
			    	align:"center",halign:"center"},
					{field:'beforeprice',title:'商品调整前价格',width:100,align:"center",halign:"center"},
					{field:'afterprice',title:'商品调整后价格',width:400,align:"center",halign:"center"},
					{field:'zhangfu',title:'涨幅',width:100,
						formatter:function(value,row,index){
							if(value<0)
								return "<span style='color:red'>"+value+"</span>";
								else return value;
						},
						align:'center',align:"center",halign:"center"}
			    ]]
		   })
		   $("#win2").window("open");
	   })
	   
	   //价格保存事件
	   $("#savePriceBtn").click(function(){
		   var nowPrice = $("#price").val();
		   var oldPrice = $("#oldPrice").val();
		   //商品id
		   var sid=$("#hid").val();
		   
		   //判断是否能保存的条件：nowPrice>oldPrice*1.1 nowPrice<oldPrice*0.9 
		   if(nowPrice>oldPrice*1.1||nowPrice<oldPrice*0.9){
			   alert("您输入的价格超出修改范围，请重新输入修改的价格");
			   return false;
		   }
		   $.ajax({
			    url:"savePrice.action",
			    data:{"sid":sid,"nowPrice":nowPrice,"oldPrice":oldPrice},
			    type:"post",
			    dataType:"json",
			    success:function(obj){
			    	if(obj.success){
			    		alert("保存成功");
			    		//关闭窗口
			    		$("#win").window('close');
			    		//刷新表格
			    		//location.reload();
			    		$(".dd").datagrid("load");
			    	}else{
			    		alert("保存失败！");
			    	}
			    }
		   })
	   })
	   //选中列表回显界面
	    $("#changePriceBtn").click(function(){
		  var selectRow=$(".dd").datagrid("getSelected")
		  if(null==selectRow){
			  alert("请选择一条数据再进行调整");
			  return false;
		  }
		  /* console.log(selectRow); */
		  //td
		  $("#sid").text(selectRow.sid);
		  $("#sname").text(selectRow.sname);
		  $("#pname").text(selectRow.pname);
		  $("#pename").text(selectRow.pename);
		  $("#chicun").text(selectRow.chicun);  
		  $("#price").val(selectRow.price);
		  
		  $("#oldPrice").val(selectRow.price);
		  $("#hid").val(selectRow.sid);
		  
		  //在窗口显示本表格所选行数据
		  $("#win").window("open");
	   }) 
	   
	   function a(){
		   //品牌
		   var pids=$("[name='ping']:checked").map(function(){
			   return $(this).val();
		   }).get().join(",");
		   //是否有货
		   var haveGoods=$("#havegoods").prop("checked");
		   //关键字
		   var mohu=$("#mohu").val();
		   
		   $('.dd').datagrid('load',{
			   pids:pids,
			   haveGoods:haveGoods,
			   mohu:mohu
		   })
	   }
	   
	   
	   $("#havegoods").change(function(){
		        a();
	   })
	   
	   $("#mohu").click(function(){
		        a();
	   })
	   $('#mohu').searchbox({
		    searcher:function(value,name){
		    	a(value);
		    },
		    prompt:'商品名称'
		});
	   
	   $("[name='ping']").each(function(){
		    $(this).change(function(){
		    	a();
		    })
	   })
	   
	 //初始化一个easyui的表格组件
		$(".dd").datagrid({
			url: "list.action",//远程获取数据的请求地址
			fitColumns: true,//行宽自适应
			rownumbers :true,
			singleSelect :true,
			pagination :true,
			pageNumber : 1,
			pageSize : 3,
			pageList:[1,3,5,7,9],
			loadMsg : "数据加载，请稍候...",
		    columns:[[ //列属性
		    	{field:'id',width:10,align:"center",halign:"center",checkbox:true},
				{field:'sid',title:'商品编号',width:5,align:"center",halign:"center"},
				{field:'sname',title:'商品名称',width:20,align:"center",halign:"center"},
				{field:'pname',title:'品牌（中文）',width:5,align:'center',halign:"center"},
				{field:'pename',title:'品牌',width:5,align:'center',halign:"center"},
				{field:'chicun',title:'尺寸',width:5,align:'center',halign:"center"},
				{field:'price',title:'价格',width:5,align:'center',halign:"center"}, 
				{field:'kucun',title:'库存',width:5,align:'center',halign:"center"}
		    ]]
		});   
   });
   
</script>
</body>
</html>