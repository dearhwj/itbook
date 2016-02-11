# Cookie
[How do browser cookie domains work](http://stackoverflow.com/questions/1062963/how-do-browser-cookie-domains-work)

	Mapping this knowledge onto your questions, the following should apply:

	Cookie with Domain=.example.com will be available for www.example.com
	Cookie with Domain=.example.com will be available for example.com
	Cookie with Domain=example.com will be converted to .example.com and thus will also be available for www.example.com
	Cookie with Domain=example.com will not be available for anotherexample.com
	www.example.com will be able to set cookie for example.com
	www.example.com will not be able to set cookie for www2.example.com
	www.example.com will not be able to set cookie for .com
	And to set and read a cookie for/by www.example.com and example.com, set it for .www.example.com and .example.com respectively. But the first (.www.example.com) will only be accessible for other domains below that domain (e.g. foo.www.example.com or bar.www.example.com) where .example.com can also be accessed by any other domain below example.com (e.g. foo.example.com or bar.example.com).
