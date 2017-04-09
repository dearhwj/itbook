#《大教堂和市集》阅读笔记


1. 开源软件系 统性地利用开放式开发和分布式同行评审(peer review)，不仅降低了成本，还提高了软件质量。
2. 世界上的建筑可以分两种：一种是集市，天天开放在那里，从无到有，从小到大；还有一种是大教堂，几代人呕心沥血，几十年才能建成，投入使用。当你新建一座建筑时，你可以采用集市的模式，也可以采用大教堂的模式。一般来说，集市的特点是开放式建设、成本低、周期短、品质平庸；大教堂的特点是封闭式建设、成本高、周期长、品质优异。
3. 集市要变成大教堂，有几个前提条件：

 * 你不能从零开始建设集市，你必须先有一个原始项目。（It's fairly clear that one cannot code from the ground up in bazaar style.）
 * 你的原始项目可以有缺陷，但是它必须能运行。（It can be crude, buggy, incomplete, and poorly documented. What it must not fail to do is run.）
 * 你必须向用户展示一个可行的前景，且让潜在的合作者相信在可预见的将来它会变成一个真正漂亮的东西。（When you start community-building, what you need to be able to present is a plausible promise, and convince potential co-developers that it can be evolved into something really neat in the foreseeable future.）
 * 项目的主持者本身不一定是天才，但他一定要能够慧眼识别出他人的优秀想法。（it is not critical that the coordinator be able to originate designs of exceptional brilliance, but it is absolutely critical that the coordinator be able to recognize good design ideas from others.）
 * 项目的主持者必须要有良好的人际关系、交流技能和人格魅力。这样才能吸引他人，使别人对你所做的事感兴趣，愿意帮助你。（A bazaar project coordinator or leader must have good people and communications skills.）

1.  Eric Raymond也总结了一些成功的充分条件。
 * 项目首先必须是你自己感兴趣的，但是最终能对其他人有用。
 * 将用户当作合作者。
 * 尽快地和经常地做出改进，多听取用户的意见。
 * 健壮的结构远比精巧的设计来得重要。换句话说，结构是第一位的，功能是第二位的。
 *  保持项目的简单性。设计达到完美的时候，不是无法再增加东西了，而是无法再减少东西了。

1.  集市模式的成功
 * 好的软件作品，往往源自于开发者的个人需要。
 * 优秀的程序员知道写什么，卓越的程序员知道改写(和重用)什 么。


## 测试
1. 早发布，常发布，倾听用户的反馈。（Linus在持续不断地激励和回报着他的黑 客/用户，用自我满足感激励他们，用持续改进(甚至每天都有改进)回 报他们。）
2. Linus定律道出了大教堂模式和集市模式最关键的区别:在大教堂建筑者 看来，bug是棘手的、难以发现的、隐藏在深处的，要经过几个人数月的 全心投入和仔细检查，才能有点信心说已经剔除了所有错误。而发布间隔 越长，倘若等待已久的发布版本并不完美，人们的失望就越发不可避免。


## 复杂度
1. 如果报告bug的用户对源码 不关心，则其报告通常不会很有用。对源码不关心的用户，往往报告的都 是表面症状，他们把自己的运行环境当成是理所当然的，他们不仅省略了 重要的背景数据，而且很少给出重现bug的可靠方法。
2. 聪明的数据结构配上愚笨的代码，远比反过来要好得多
3. 仅次于拥有好主意的是，识别来自用户的好主意，有时后者会更好。
4. 通常，那些最有突破性和最有创新力的解决方案来自于你认识到你对问题的基本观念是错的
5. 任何工具都应具备预期内的功能，但一个伟大的工具能给你带来预期外的功能。## Brooks定律
“在一个 已经延期的项目上增加人手，只会让项目更加延期。”更为一般地讲， Brooks定律指出，随着开发人员数目的增长，项目复杂度和沟通成本按照 人数的平方增加，而工作成果只会呈线性增长。人们发现，bug很容易集中在不同人 写的代码的交互接口上，沟通/协调的开销会随开发者间接口数的增加而 增多，也就是说，问题规模和开发人员间的沟通路径数相关，即和人数的 平方相关(更精确地讲，应该是N (N-1)/2，N代表开发者数目)


## 软件管理有五个功能* 明确目标并让大家朝同一个方向努力。* 监督并确保关键细节不被遗漏。 51* 激励人们去做那些乏味但必要的“体力活”。* 组织人员部署并获得最佳生产力。* 调配项目所需的资源。