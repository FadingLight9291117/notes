# JCF简介

>JCF(Java Collection Framework)，Java容器框架

## （一）Collection和Collection Framework

- 容器：能够存放数据的空间结构
  - 数组/多维数组，只能线性存放
  - 列表/散列集/树/……
  
- 容器框架：为表示和操作容器二规定的一种标准体系结构
  - 对外的接口：容器中能存放的抽象数据类型
  - 接口的实现：可复用的数据结构
  - 算法：对数据的查找和排序

- 容器框架的优点：提高数据存取效率，避免程序员重复劳动

- 类似与C++的STL，Java的JCF

## （二）历史

- Java1.1和以前的数据结构
  - Vector，Stack，Hashtable，Enumeration等
  - Hashtable没有使用驼峰命名法，估计是设计错误
  - 基本废除不用

- Java1.2和以后，JCF集合框架
  - 功能更加强大
  - 易于学习
  - 接口和实现分离，多种设计模式设计更灵活
  - 泛型设计
  
## （三）JCF框架图

## （四）接口

- 早期接口Enumeration
  
- JCF的集合接口是Collection
  - add增加
  - contains包含
  - remove删除
  - size数据元素个数
  - iterator迭代器
  
- JCF的迭代器接口Iterator
  - hasNext判断是否有下一个元素 
  - next获取下一个元素
  - remove删除某一个元素

## （五）主要类

- JCF主要的数据结构实现类
  - 列表（List,ArrayList,LinkedList）
  - 集合（Set,HashSet,TreeSet,LinkedHashSet）
  - 映射（Map,HashMap,TreeMap,LinkedHashMap）

- JCF主要的算法类
  - Arrays：对数组进行查找和排序等操作
  - Collections：对Collection及其子类进行排序和查找操作

## （六）总结

- 容器框架的作用
  
- JCF主要数据结构
  - 列表
  - 集合
  - 映射
  