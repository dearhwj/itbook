# Javascript Regular Expression
[JavaScript 正则表达式 验证整数、小数、实数、有效位小数最简单]("http://www.jb51.net/article/19159.htm")
	
	正整数: /^\d+$/.test(this.value)
	负整数:/^-\d+$/.test(this.value)
	整　数:/^-?\d+$/.test(this.value)
	正小数: /^\d+\.\d+$/.test(this.value)
	负小数: /^-\d+\.\d+$/.test(this.value)
	小数:   /^-?\d+\.\d+$/.test(this.value)
	实　数:  /^-?\d+\.?\d*$/.test(this.value)
	保留1位小数:/^-?\d+\.?\d{0,1}$/.test(this.value)
	保留2位小数:/^-?\d+\.?\d{0,2}$/.test(this.value)
	保留3位小数: /^-?\d+\.?\d{0,3}$/.test(this.value)
