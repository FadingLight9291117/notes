# Kotlin中的?. ?: !!. 区别和用法

## 1. 安全调用?.

举个例子:

```kotlin
data class A(val b: B?)
data class B(val c:C?)
data class C(val d: Int)
······
println(a? .b? .c)
```

这里的意思是，当a不为空的时候调用b，然后当b不为空的时候调用c。

所以将?.称为**安全调用**。

## 2. Elvis操作符?:

还是上个例子:

```kotlin
a? .b? .c?:-1
```

意思是只要当a为空，或者a不为空b为空时就返回-1，当然a，b都不为空时就返回c。类似java中的三目运算符，java实现如下：

```java
a != null : a.b != null ? a.b.c : -1 : -1;
```

显然要比java的简洁。

以上的运算符称为**Elvis运算符**或**合并运算符**。

## 3. 非空断言!!.

一个例子:

```kotlin
b!!.c
```

意思是告诉编译器b肯定不为空；若b为空，则会抛出NPE异常。

