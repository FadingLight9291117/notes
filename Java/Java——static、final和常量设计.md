# static，final和常量设计

## static

- static变量：不管有多少个对象，内存中只有一份
- static方法：可以用类名直接引用，无需new对象来引用
- static块：static块只执行一次，并且static块>匿名块>构造函数
  
## final

- final类：没有子类继承
- final方法：不能被子类改写
- final变量：基本类型不能修改值，对象类型不能修改指针
  
## 常量设计和常量池

- public static final
- 常量池：相同的值只存储一份，节省内存
- Boolean,Byte,Short,Integer,Long,Character有常量池
- **Float**,**Double**没有常量池
- 常量式赋值创建，放在栈内存（**将被常量化**）
- new对象进行创建，放在堆内存（**不会常量化**）
- Java中的常量：static和final
- Java接口中的变量都是常量
- Java编译器会优化已经确定的变量

## 不可变对象

- 八个基本型别的包装类的对象
- String、BigInteger和BigDecimal等对象
- 优点：只读，线程安全；并发读，提高性能；可以重复利用
- 缺点：制造垃圾，浪费空间

## Java字符串

- 典型的不可变对象
- 字符串内容比较：equals方法
- 是否指向同一个对象：指针比较==
- 相同的常量字符串只储存一份，节省空间，共享访问

## 字符串的加法

- 如下，由于String不可修改，效率差

  ```java
    String a="abc";
    String b=a+"123";
  ```

- 使用StringBuffer和StringBuilder类的append方法修改

  ```java
    StringBuffer a=new StringBuffer("abc");
    a.append("aaa");
  ```

- StringBuffer和StringBuilder的对象都是可变对象
- StringBuffer（同步，线程安全，修改快速）
- StringBuilder（不同步，线程不安全，修改更快）
- 字符串append操作速度：StringBuilder>StringBuilder>String
  