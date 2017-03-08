# Chrome Command Line API 参考

参考文档地址:[https://developers.google.com/web/tools/chrome-devtools/console/command-line-reference](https://developers.google.com/web/tools/chrome-devtools/console/command-line-reference)
1. $_ 返回最近评估的表达式的值。
2. $0、$1、$2、$3 和 $4 命令用作在 Elements 面板中检查的最后五个 DOM 元素或在 Profiles 面板中选择的最后五个 JavaScript 堆对象的历史参考。
3. $(selector) 返回带有指定的 CSS 选择器的第一个 DOM 元素的引用。此函数等同于 document.querySelector() 函数。
4. $$(selector) 返回与给定 CSS 选择器匹配的元素数组。此命令等同于调用 document.querySelectorAll()。
5. $x(path) 返回一个与给定 XPath 表达式匹配的 DOM 元素数组。
6. clear()清除其历史记录的控制台。
7. copy(object) 将指定对象的字符串表示形式复制到剪贴板。
8. debug(function) 调用指定的函数时，将触发调试程序，并在 Sources 面板上使函数内部中断，从而允许逐行执行代码并进行调试。使用 undebug(fn) 停止函数中断，或使用 UI 停用所有断点。
9. dir(object) 显示所有指定对象的属性的对象样式列表。此方法等同于 Console API 的 console.dir() 方法。
10. dirxml(object) 输出以 XML 形式表示的指定对象，如 Elements 标签中所示。此方法等同于 console.dirxml() 方法。
11. inspect(object/function) 在相应的面板中打开并选择指定的元素或对象：针对 DOM 元素使用 Elements 面板，或针对 JavaScript 堆对象使用 Profiles 面板。
12. getEventListeners(object) 返回在指定对象上注册的事件侦听器。返回值是一个对象，其包含每个注册的事件类型（例如，“click”或“keydown”）数组。每个数组的成员是描述为每个类型注册的侦听器的对象。例如，下面列出了在文档对象上注册的所有事件侦听器：
13. keys(object) 返回一个包含属于指定对象的属性名称的数组。
14. values(object) 返回一个包含属于指定对象的所有属性值的数组。
14. monitor(function) 调用指定函数时，系统会向控制台记录一条消息，其中指明函数名称及在调用时传递到该函数的参数。使用 unmonitor(function) 停止监控。
15. monitorEvents(object[, events])当在指定对象上发生一个指定事件时，将 Event 对象记录到控制台。您可以指定一个要监控的单独事件、一个事件数组或一个映射到预定义事件集合的常规事件“类型”。unmonitorEvents(object[, events]) 可停止针对指定对象和事件的事件监控。
16. profile() 使用可选的名称启动一个 JavaScript CPU 分析会话。profileEnd() 在 Profile 面板中完成分析，并显示结果。
17. table(data[, columns])通过传入含可选列标题的数据对象记录具有表格格式的对象数据。


