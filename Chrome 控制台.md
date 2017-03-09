---
typora-copy-images-to: ./
---

# Chrome 控制台

2017-3-2		陈明锋



## 前言

​	Chrome 浏览器想必是每个前端工程师必备的利器之一，速度快、体积小、支持的特性也比其他浏览器多；除此之外，它还拥有强大的控制台功能，但很多开发者并没有用出控制台的精髓，只是使用`console.log();`其实控制台的功能远不止那么简单。

## console

既然`console`能打印出我们想要的信息，那么我们试着打印下它自己。

```javascript
console.log(console);
```

![](http://i1.piimg.com/567571/829e630bbca98837.png)

​	可见，`console`也是一个对象，而且除了我们常用的`log()`方法外，还有很多实用的方法。那么我们来看看它们有多实用。

### assert()

> `console.assert();` 用于判断表达式，满足表达式时才输出语句

​	当你想代码在满足某些条件时才在控制台输出信息，那么大可不必用`if`或者三元表达式来实现，`console.assert();`就是这样场景下的好方法，它会先对传入的表达式进行断言，表达式为`true`时不会输出信息，只有表达式为`false`时才会在控制台输出`error`信息。

```javascript
var isTrue = false;
console.assert(isTrue, "条件不满足！");
```

![](http://p1.bpimg.com/567571/eec366a6234d550a.png)

### clear()

> `console.clear();`用于清空控制台

当然，你也可以用以下方式：

- 直接在控制台输入`clear()`
- 直接用快捷键`Ctrl + L(Win)`、`Cmd + K(Mac)`

### count()

> console.count();用于记录代码执行的次数
>

当你想要知道某一段代码被执行了多少次，不用自己去写相关的逻辑，内置的`console.count();`完全可以胜任这项任务。

```javascript
function fun() {
	//函数体
	console.count("fun被执行次数");
}
fun();
fun();
fun();
```

![](http://p1.bqimg.com/567571/b6443c8871d28da1.png)

### debug()、log()、info()、warn()、error()

> `console.debug();` 用于输出调试的信息
> `console.log();`用于输出一般的信息
> `console.info();`用于输出提示的信息
> `console.warn();`用于输出警示的信息
> `console.error();`用于输出错误的信息
>

```javascript
console.debug("调试的信息");
console.log("一般的信息");
console.info("提示的信息");
console.warn("警示的信息");
console.error("错误的信息");
```

![](http://p1.bqimg.com/567571/fed0c3669e30eb3e.png)

​	大家都会用`log()` ，但很少有人能够很好地利用warn，error等将输出到控制台的信息进行分类整理。他们功能区别不大，意义在于将输出到控制台的信息进行归类，或者说让它们更语义化。

​	另外，`console.log();`可以接收多个参数，参数间用逗号分隔，控制台会根据参数的设置把多个消息打印到同一行。

​	如果`log()`里第一个参数是带有**特殊标识符**的字符串的话，控制台会根据不同的标识符来把后面的参数填充到前面的字符串中去。常见的标识符有：

> `%s` 表示输出字符串
> `%d` 表示输出数字（也可以用`%i`）
> `%f` 表示输出浮点数值
> `%o` 表示输出Dom元素
> `%O ` 表示输出JavaScript对象
> `%c` 表示对输出的文字应用特殊的样式

```javascript
var a = 123;
var b = [456, "789", true];
var c = function() {
	name : "张三";
	age : 20;
	sex : "男"
}
console.log(a, b, c);

console.log("今天%s星期%d", "是", 6);
console.log("%o", document.body);
console.log("%O", document.body);
```

![](http://p1.bqimg.com/567571/d77ea10f5f0f9b84.png)

最特别的还是`%c`的用法，可以让控制台输出由你定制样式的内容。例如这样：

```javascript
console.log("%cFrom CMF:", "color: yellow; background: red; font-size: 20px; border-radius: 5px", "Hello World!");
```

![](http://p1.bpimg.com/567571/a0ad0e6054df6051.png)

还有这样酷炫的：

```javascript
console.log("%chello world","background-image:-webkit-gradient(linear, left top, right top, color-stop(0, #f22), color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(0.45, #2ff), color-stop(0.6, #2f2), color-stop(0.75, #2f2), color-stop(0.9, #ff2), color-stop(1, #f22) ); color:transparent; -webkit-background-clip: text; font-size:5em;");
```

![](http://i1.piimg.com/567571/b16f216e22204ce7.png)

可以看出`%c`应用的样式是CSS的语法，所以CSS支持的样式语句基本上都可以支持。

​	添加了样式的输出语句貌似看起来没啥用，但是当多人分模块开发一个大型的项目的时候，控制台输出一大堆信息，肯定没办法一下子找到属于自己模块的信息。要是你给自己的模块输出语句添加了具有特色的样式，那么就能较快地定位，这也是提高效率的一个小技巧。

### dir()

> `console.dir();`用于展开输出一个DOM元素的JavaScript对象
>

区别：`console.dir();`是将DOM结点以JavaScript对象的形式输出到控制台，而`console.log();`是直接将DOM结点以DOM树的结构进行输出，与在元素审查时看到的结构是一致的。

```javascript
console.log(document.body);
console.dir(document.body);
```

![](http://p1.bqimg.com/567571/8879df320c0fa610.png)

同样，它们也可以以不同的形式打印函数。

```javascript
function People () {
	name : "张三";
	age : 20;
	sex : "男"
}
console.dir(People);
console.log(People);
```

![](http://i1.piimg.com/567571/244ba2c8c3b6a0a8.png)

### dirxml()

> console.dirxml();用于查看页面中某个节点的html/xml代码

```html
<div id="div">
	<p>我在div里面呢</p>
</div>
```

```javascript
var div = document.getElementById("div");
console.dirxml(div);
console.log(div);
```

效果跟`console.log();`是一样的。

![](http://p1.bqimg.com/567571/25ef5ade74fb7a9e.png)

### group() & groupEnd()

> `console.group();`和`console.groupEnd();`配合使用，用于将各自的信息分组到以各自命名空间为名称的组里面。

```javascript
console.group("module_1");
console.log("来自module_1的普通信息");
console.info("来自module_1的提示信息");
console.groupEnd();

console.group("module_2");
console.warn("来自module_2的警示信息");
console.error("来自module_2的错误信息");
console.groupEnd();
```

这样的控制台信息看上去就一目了然，再也不用为了找这是属于哪一个模块输出的而翻源码。

![](http://p1.bqimg.com/567571/8884f98331f674e3.png)

如果想要输出为折叠模式，可以使用 `console.groupCollapsed();` ，用法和 `console.group();` 类似。

```javascript
console.groupCollapsed("module_1");
console.log("来自module_1的普通信息");
console.info("来自module_1的提示信息");
console.groupEnd();

console.groupCollapsed("module_2");
console.warn("来自module_2的警示信息");
console.error("来自module_2的错误信息");
console.groupEnd();
```

![](http://i1.piimg.com/567571/2c58e6250391e208.png)

### table()

> `console.table();` 用于以表格的形式输出信息

​	有的时候后端传回来一大串数据，如果直接`console.log();`或是通过抓包工具来查看，肯定会让你晕头转向，这个时候`console.table();`可以发挥作用了，以表格的形式呈现数据，自然一目了然。

而且点击表头还可以对数据进行排序。

```javascript
var data = {
	num : 30,
	students : [
		{
			name : "张三",
			age : 20,
			sex : "男",
			hobby : "打篮球"
		},
		{
			name : "李四",
			age : 21,
			hobby : "打游戏",
			sex : "男"
		},
		{
			name : "王五",
			sex : "女",
			age : 18
		}
	]
};
console.table(data.students);
```

![](http://p1.bpimg.com/567571/b6218ddd1deef739.png)

### time() & timeEnd()

> `console.time();`和`console.timeEnd();`配合使用，用于记录代码运行所消耗的时间
>

输出一些调试信息只是控制台最常用而且最基本的功能。当做一些性能测试时，同样可以在这里很方便地进行。比如需要考量一段代码执行的耗时情况时。

```javascript
console.time("for循环耗时");
for (var i = 0; i < 10000000; i++) {
	//循环体
}
console.timeEnd("for循环耗时");
```

![](http://p1.bpimg.com/567571/0f41e3ea2f54975f.png)

------

## 一些其他指令

### $_

> 表示上一次在控制台键入的命令，也可以用快捷键`↑`来达到同样的效果

```javascript
2 + 2	//回车
$_+1	//再回车得5
```

![](http://i1.piimg.com/567571/15fe5b0f8c920891.png)

### `$0` ~ `$4`

> 可以在控制台输出在`Elements`面板选中的页面元素
>
> `$0~$4`代表最近5个你选择过的DOM节点

​	什么意思呢？在页面右击选择审查元素，然后在弹出来的DOM节点树上面随便点选，这些被点过的节点会被记录下来，而`$0`会返回最近一次选的DOM节点，以此类推，`$1`返回的是上上次选的DOM节点，最多保存5个，如果不够5个，则返回`undefined`。

![](http://p1.bpimg.com/567571/ca3bd662c9794039.gif)

### copy()

```javascript
copy(document.body);
```

然后就可以Ctrl+V了。

**注意：**它不依附于任何全局变量比如window，所以其实在JS代码里是访问不了这个copy方法的。

### keys() & values()

这是一对基友。

> `keys();`返回传入对象所有属性名组成的数组
>
> `values();`返回传入对象所有属性值组成的数组。

具体请看下面的例子：

```javascript
var people = {
	name : "张三",
	sex : "男",
	age : 20,
	hobby : "打篮球"
};
keys(people);
values(people);
```

![](http://i1.piimg.com/567571/ac779d47b58b37ba.png)

### monitor() & unmonitor()

> `monitor(function);`接收一个函数名作为参数，比如function sayHello，每次sayHello被执行了，都会在控制台输出一条信息，里面包含了函数的名称sayHello及执行时所传入的参数。而`unmonitor(function);`则是用来停止这一监听。
>

```javascript
function sayHello(name) {
	alert("Hello," + name);
}
monitor(sayHello);
sayHello("CMF");
sayHello("HTML5");
unmonitor(sayHello);
```
![](http://p1.bqimg.com/567571/44a5f8f15cb2c08a.png)

总结：提高开发效率！！！

## 待续。。。