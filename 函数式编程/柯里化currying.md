# 柯里化——Currying

## 什么是柯里化？

> *柯里化（Currying）*是指把**多个参数的函数变换成一系列仅接收单一参数函数的过程**。

举一个例子：

- Java版：

```java
// 一个三个数求和的函数
int sum(int x, int y, int z) {
    return x + y + z;
}
sum(1, 2, 3); // 6

// 柯里化
Function<Integer, Function<Integer, Function<Integer, Integer>>> sum = x -> y -> z -> x + y + z;
sum.apply(1).apply(2).apply(3); // 6
```



- JavaScript版：

```javascript
// 一个三个数求和的函数
function sum(a, b, c) {
    return a + b + c;
}
sum(1, 2, 3); // 6

// 柯里化
const sum = a => b => c => a + b + c;
sum(1)(2)(3); // 6

```

- Kotlin版

```kotlin
// 一个三个数求和的函数
fun sum(x: Int, y: Int, z: Int) = x + y + z
sum(1, 2, 3) // 6

// 柯里化
fun sum(x: Int) = { y: Int -> 
	{ z: Int -> x + y + z } 
}
sum(1)(2)(3) // 6
```



