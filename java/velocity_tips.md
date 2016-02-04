# Velocity Tips
[velocity 显示List和Map方法]("http://blog.163.com/ydmx_lei/blog/static/7705340520124445156188/")

遍历map类型

	 #foreach($param in ${paramValues.keySet()})  
    	<tr>  
        <th>$param</th>  
        <td>${paramValues.get($param)}</td>  
   	</tr>  
		#end  
		
遍历List

	#foreach($sal in ${salerList})  //后面${salerList}页面传过来的值
    $sal.name  
    #end  		
		
		