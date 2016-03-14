# JQuery Tips


[jQuery页面加载初始化的3种方法](http://blog.csdn.net/tjcyjd/article/details/6713474)
	
	$(document).ready(function(){  
     alert("第一种方法。");   
	});  
	
	$(function(){  
    alert("第二种方法。");  
	});   
	
	jQuery(function($) {  
    alert("第三种方法。");  
	});


[jQuery JSONP 跨域实践](http://aijezdm915.iteye.com/blog/1066299)



[JQuery ajax](http://www.cnblogs.com/jayleke/archive/2012/08/10/2633174.html) 
    
    $.ajax({

     type: 'POST',

     url: url ,

    data: data ,

    success: success ,

    dataType: dataType

    });

[jquery radio的取值 radio的选中 radio的重置](http://www.cnblogs.com/lear/p/3392644.html)

	1. 获取radio选中的value.

	$('input:radio[name=sex]:checked').val();

	2. 选择 radio 按钮 (Male).

	$('input:radio[name=sex]:nth(0)').attr('checked',true);
		或者
	$('input:radio[name=sex]')[0].checked = true;

	3. 选择 radio 按钮 (Female).

	$('input:radio[name=sex]:nth(1)').attr('checked',true);
		或者
	$('input:radio[name=sex]')[1].checked = true;

	4. 选择 radio 按钮 (Unknown).

	$('input:radio[name=sex]:nth(2)').attr('checked',true);
		或者
	$('input:radio[name=sex]')[2].checked = true;

	5. 重置 radio 按钮.

	$('input:radio[name=sex]').attr('checked',false);


[jquery 调用 click 事件 的 三种 方式](http://blog.csdn.net/topwqp/article/details/8561366)

	第一种方法

    $(document).ready(function(){  
     $("#clickme").click(function(){  
       alert("Hello World  click");  
      });  
      
      
	第二种方法

    $('#clickmebind').bind("click", function(){  
    alert("Hello World  bind");  
    });       
    
	第三种方法

	$('#clickmeon').on('click', function(){  
 	alert("Hello World  on");  
	});  
	});  
	
[jQuery ajax - post() 方法](http://www.w3school.com.cn/jquery/ajax_post.asp)
	    
    