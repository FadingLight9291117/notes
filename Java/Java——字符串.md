
# Java字符串

- Java中使用频率最高的类
- 典型的不可变对象，加减操作性能较差
- 字符串内容比较：equals方法
- 是否指向同一个对象：指针比较==
  
## String常用方法

*注：String的方法并不会改变自身字符串的值*

| 方法名                        | 描述                                                                             |
| :---------------------------- | :------------------------------------------------------------------------------- |
| .equals(s)                    | 比较两个字符串是否相等，返回boolean值，源字符串不能为null否则报空指针异常        |
| .equalsignoreCase(s)          | 比较两字符串的值是否相等，忽略大小写，返回boolean值                              |
| .split(regex)                 | 分割字符串，regex为正则表达式，以regex定义的字符串分割目的字符串，返回String数组 |
| .subString(int begin,int end) | 截取子串，返回从begin（包括）到end（不包括）的子串                               |
| .subString(int begin)         | 截取子串，返回begin（包括）之后的全部字符串                                      |
| .charAt(index)                | 返回下标为index的字符                                                            |
| .toLowerCase()                | 返回字母全部小写的拷贝                                                           |
| .toUpperCase()                | 返回字母全部大写的拷贝                                                           |
| .indexof(s)                   | 返回第一次出现子串s的索引                                                        |
| .replace(old,new)             | 返回一个拷贝，其中所有的old子串全部替换为new                                     |
| .replaceAll(old,new)          | 与replace()类似，支持正则表达式                                                  |
| .repalceFirst(old,new)        | 与replace()类似,仅替换第一次出现的子串                                           |
| .getBytes(decode)             | 将字符串转化为二进制数组(byte[])并返回，decode为编码方式                         |

## String其他方法
| 方法名                 | 描述                                                                                                   |
| :--------------------- | :----------------------------------------------------------------------------------------------------- |
| Object.toString()      | 将对象转化为String类型并返回，不改变原对象，需要类重载toString()方法，Object不能为null否则报空指针异常 |
| (String)Object         | 将对象转化为String对象，需要判断Object是否可转换，否则抛出异常，(String)null合法                       |
| String.ValueOf(Object) | 将Object转换为String并返回，不改变原对象，Object=null时返回"null"                                      |

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
