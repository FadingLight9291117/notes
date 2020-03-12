# 《JavaScript教程》学习笔记

## 数据类型

### 概述

1. 3种方法判断类型
   - typeof运算符
   - instanceof运算符
   - Object.prototype.toString方法

### 数值

1. null undefined
2. NaN 非数字，属于Number，isNaN()
3. Infinity 无穷，超出表示范围,isInfinity()
4. parseInt() parseFloat() 整型和浮点数转换

### 字符串

### 对象

1. delete 删除属性

2. in

3. for...in...

4. with——它的作用是操作同一个对象的多个属性时，提供一些书写的方便。

### 函数

1. 函数参数不是必需的，JavaScript 允许省略参数。

2. arguments 对象——包含了函数运行时的所有参数，arguments[0]就是第一个参数

3. 闭包——最大用处有两个，一个是可以读取函数内部的变量；另一个就是让这些变量始终保持在内存中，即闭包可以使得它诞生环境一直存在。

4. eval命令接受一个字符串作为参数，并将这个字符串当作语句执行。

### 数组

1. typeof 返回是对象

### 运算符

1. 比较运算符

   - 严格相等 ===
  
   - 不严格相等 ==

2. 其他运算符

   - void运算符的作用是执行一个表达式，然后不返回任何值，或者说返回undefined。
    用户点击链接提交表单，但是不产生页面跳转。
    ```<a href="javascript: void(document.form.submit())">```

   - 逗号运算符用于对两个表达式求值，并返回后一个表达式的值。

## 语法专题

### 数据类型转换

1. 强制转换主要指使用Number()、String()和Boolean()

### 错误处理机制

1. error实例对象

   - message：错误提示信息

   - name：错误名称（非标准属性）

   - stack：错误的堆栈（非标准属性）
  
2. 自定义错误——继承error

3. throw

4. try-catch-finally

### 编程风格

1. JavaScript 会自动添加句末的分号，导致一些难以察觉的错误——因此，表示区块起首的大括号，不要另起一行。
2. 相等运算符会自动转换变量类型，造成很多意想不到的情况——因此，建议不要使用相等运算符（==），只使用严格相等运算符（===）。

### console对象

1. 静态方法
1.1 console.log()——类似C语言的标准格式化输出
console.info() console.debug() console.warn() console.error() 
1.2 console.table()——表格化显示对象
1.3 console.count()——计数
1.4 console.dir()
console.dirxml()——格式化输出对象，DOM。Node 环境之中，还可以指定以代码高亮的形式输出。console.dir(obj, {colors: true})
1.5 console.assert()——方法主要用于程序运行过程中，进行条件判断，如果不满足条件，就显示一个错误，但不会中断程序执行。
1.6 console.time()
console.timeEnd()——计时
1.7 console.group()
console.groupEnd()
console.groupCollapsed()——可折叠输出消息
1.8 console.trace()
显示当前执行的代码在堆栈中的调用路console.clear()
2. debugger语句——设置断点

## 标准库

1. Object
1.1. Object()函数
1.2. 静态方法
1.3. 其他方法——反射相关
1.4. 实例方法
1.4属性描述对象
2. Array对象
3. Boolean对象
4. Number对象
5. String对象
6. Math对象
7. RegExp对象
8. JSON 对象
   - JSON.stringify()
     - 参数对象的 toJSON 方法
     - JSON.parse()

## 面向对象

### 继承

1. prototype属性

    - 原型对象的所有属性和方法，都能被实例对象共享。

2. 原型链
3. intanceof 运算符
4. 调用父类构造函数——Super.call(this);
5. call()——调用无参构造函数；
   apply()——调用有参构造函数；
   bind()——返回函数指针。

## 异步操作

### 概述

1. 单线程模型
   - “事件循环”机制（Event Loop）
   - 创建多个线程，但子线程完全受主线程控制，且不得操作 DOM。本质是单线程。
2. 任务队列和事件循环
   - JavaScript 运行时，除了一个正在运行的主线程，引擎还提供一个任务队列（task queue），里面是异步任务。主线程等到同步任务全部执行完，就会去看任务队列里面的异步任务。如果满足条件，那么异步任务就重新进入主线程开始执行，这时它就变成同步任务了。等到执行完，下一个异步任务再进入主线程开始执行。一旦任务队列清空，程序就结束执行。
3. 异步操作的模式
   - 回调函数
   - 事件监听
   - 发布订阅

### 定时器

1. setTimeout()——一次调用
2. setInterval()——循环调用
3. clearTimeout()
4. clearInterval()

### Promise对象
