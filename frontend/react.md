# React

## React

[在JSX中写If-Else ](https://facebook.github.io/react/tips/if-else-in-JSX.html)

	if-else statements don't work inside JSX. This is because JSX is just syntactic sugar for function calls and object construction.
	

[如何在React定义一个空元素](http://stackoverflow.com/questions/30097091/correct-way-to-define-an-empty-dom-element-in-react)

	var label2 = null; // react no generates any dom element
	var label3 = ''; // react generates and empty span like <span></span>

[组件的详细说明和生命周期（Component Specs and Lifecycle）](http://reactjs.cn/react/docs/component-specs.html)


[Flux](http://wiki.jikexueyuan.com/project/react-tutorial/flux.html)



[react-app-boilerplate](https://github.com/pro-react/react-app-boilerplate)

[React State(状态)](http://www.runoob.com/react/react-state.html)


[React Router 使用教程](http://www.ruanyifeng.com/blog/2016/05/react_router.html?utm_source=tool.lu)

React.createElement

	 React.createElement, which takes a tag name or component, a properties object, and variable number of optional child arguments.
	 
Element Factories
	
	React provides short-hand factory functions under React.DOM for common HTML tags.
	
	React.DOM.form({className:"commentForm"},	  React.DOM.input({type:"text", placeholder:"Name"}),	  React.DOM.input({type:"text", placeholder:"Comment"}),	  React.DOM.input({type:"submit", value:"Post"})	)	 
	
	Using destructuring assignment, it’s possible to tidy things up for a more concise syntax:	import React, { Component } from 'react'; import {render} from 'react-dom';	let { form,  		input	} = React.DOM;	class CommentForm extends Component { render(){		return form({className:"commentForm"}, input({type:"text", placeholder:"Name"}), 		input({type:"text", placeholder:"Comment"}), input({type:"submit", value:"Post"})		) }	}
	
## Redux


[全栈Redux实战](http://www.tuicool.com/articles/mqiyiq7)	