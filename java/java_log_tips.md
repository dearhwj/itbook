# Java Log Tips
[logback系列之三：输出日志到文件（滚动） ]("http://czj4451.iteye.com/blog/1975937")

[从Log4j迁移到LogBack的理由]("http://www.oschina.net/translate/reasons-to-prefer-logbak-over-log4j")


	logback-classic 非常自然的实现了SLF4J
	logback-classic中的登陆类自然的实现了SLF4J。当你使用 logback-classic作为底层实现时，涉及到LF4J日记系统的问题你完全不需要考虑。更进一步来说，由于 logback-classic强烈建议使用SLF4J作为客户端日记系统实现，如果需要切换到log4j或者其他，你只需要替换一个jar包即可，不需要去改变那些通过
	SLF4J API 实现的代码。这可以大大减少更换日记系统的工作量。