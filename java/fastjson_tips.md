# FastJson Tips

###说明
Alibaba FastJson是一个Json处理工具包，包括“序列化”和“反序列化”两部分，它具备如下特征：
速度最快，测试表明，fastjson具有极快的性能，超越任其他的Java Json parser。包括自称最快的JackJson；
功能强大，完全支持Java Bean、集合、Map、日期、Enum，支持范型，支持自省；无依赖，能够直接运行在Java SE 5.0以上版本

###Tips

Fastjson的序列化属性
	
	QuoteFieldNames 双引号字段名称
	SkipTransientField 忽略TransientField
	UseSingleQuotes  使用单引号
	WriteMapNullValue 是否输出值为null的字段,默认为false
	WriteEnumUsingToString “用枚举toString()值输出”
	WriteEnumUsingName		用枚举name()输出
	UseISO8601DateFormat	“用ISO8601DateFormat日期格式”
	WriteNullListAsEmpty	list是null的时候输出空列表
	WriteNullStringAsEmpty	sting是null的时候，输出空字符串
	WriteNullBooleanAsFalse	 boolean null值，输出false
	SortField	排序SortField
	PrettyFormat	输出格式优化
	WriteClassName	输出ClassName
	DisableCircularReferenceDetect	禁止循环引用
	WriteSlashAsSpecial	
	BrowserSecure
	NotWriteDefaultValue  不输出缺省值
	WriteNonStringKeyAsString	输出
	BeanToArray				bean换成Array
	DisableCheckSpecialChar	禁止特殊字符检查
	NotWriteRootClassName	不输出根class名称
	WriteDateUseDateFormat	
	BrowserCompatible
	

[fastjson把对象转化成json避免$ref](http://blog.csdn.net/wxwzy738/article/details/30244993)

	DisableCircularReferenceDetect来禁止循环引用检测：
	JSON.toJSONString(..., SerializerFeature.DisableCircularReferenceDetect)
	当进行toJSONString的时候，默认如果重用对象的话，会使用引用的方式进行引用对象。
	
	很多场景中，我们需要序列化的对象中存在循环引用，在许多的json库中，这会导致stackoverflow。在功能强大的fastjson中，你不需要担心这个问题。


[fastjson生成json时Null属性不显示](http://wuzhuti.cn/2175.html)

    Fastjson的b序列化属性
	QuoteFieldNames———-输出key时是否使用双引号,默认为true 
	WriteMapNullValue——–是否输出值为null的字段,默认为false 
	WriteNullNumberAsZero—-数值字段如果为null,输出为0,而非null 
	WriteNullListAsEmpty—–List字段如果为null,输出为[],而非null 
	WriteNullStringAsEmpty—字符类型字段如果为null,输出为”“,而非null 
	WriteNullBooleanAsFalse–Boolean字段如果为null,输出为false,而非null

