# URLConnection

[URLConnection的连接、超时、关闭用法总结](http://liuxi1024.iteye.com/blog/519047)
	
	HttpURLConnection urlCon = (HttpURLConnection)url.openConnection();  
	urlCon.setConnectTimeout(30000);  
	urlCon.setReadTimeout(30000);  
