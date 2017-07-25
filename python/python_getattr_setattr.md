# Python \__getattr\__/\__setattr\__

原文 [python __getattr__ 和 __setattr__方法、属性私有化](python __getattr__ 和 __setattr__方法、属性私有化)



\__getattr\__方法
拦截点号运算。当对未定义的属性名称和实例进行点号运算时，就会用属性名作为字符串调用这个方法。如果继承树可以找到该属性，则不调用此方法


\__setattr\__方法
会拦截所有属性的的赋值语句。如果定义了这个方法，self.arrt = value 就会变成self,\__setattr\__("attr", value).这个需要注意。当在\__setattr\__方法内对属性进行赋值是，不可使用self.attr = value,因为他会再次调用self,\__setattr\__("attr", value),则会形成无穷递归循环，最后导致堆栈溢出异常