# How deep are your unit tests?
原文地址:[http://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests](http://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests)


I get paid for code that works, not for tests, so my philosophy is to test as little as possible to reach a given level of confidence (I suspect this level of confidence is high compared to industry standards, but that could just be hubris). If I don't typically make a kind of mistake (like setting the wrong variables in a constructor), I don't test for it. I do tend to make sense of test errors, so I'm extra careful when I have logic with complicated conditionals. When coding on a team, I modify my strategy to carefully test code that we, collectively, tend to get wrong.


老板为我的工作代码付钱,而不是测试。因此,我的观点是:测试尽可能达到给定的置信水平(我怀疑这种程度的信心高与行业标准相比,但这可能只是傲慢)。如果我不通常犯的一种错误(如设置错误的变量在一个构造函数),我不测试。我倾向于有意义的测试错误,所以我格外小心当我有逻辑复杂的条件。当在一个团队编码时,我会调整策略仔细测试团队容易出错的代码！
