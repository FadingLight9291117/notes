# Kotlin 笔记

## 表达式

### if 表达式

``` kotlin
// As expression
val max = if (a > b) a else b

// if branches can be blocks, and the last experience is the value of block
val max = if (a > b) {
    print("Choose a")
    a
} else {
    print("Choose b")
    b
}
```

> if you are using **if** as an expression rather than a statement, the expression is required to have an **else** branch.

### when 表达式

> when replaces the switch operator of C-like language.

``` kotlin
when (x) {
    1 -> print("x == 1")
    2 -> print("x == 2")
    else -> { // Note the block
        print("x is neither 1 nor 2")
    }
}

when (x) {
    0, 1 -> print("x == 0 or x == 1")
    else -> print("otherwise")
}
```

> when matches its argument against all branches sequentially until some branch condition is satisfied.

when关键字的参数可以省略:

```kotlin
when {
    sunny -> library()
    else -> study()
}
```

### for循环与范围表达式

#### 1.for循环

```kotlin
for (i in 1..10) {
    println(i)
}

for (i: Int in 1..10) {
    println(i)
}
```

#### 2.范围表达式(range)

```kotlin
"abc".."xyz"

// 指定步长
for (i in 1..10 step 2) print(i)

//倒序
for (i in 10 downTo 1 step 2) print(i)

// 半开区间
for (i in 1 until 10) print(i0) // 不包含10
```

#### 3.用in来检查成员关系

```kotlin
"a" in listOf("b", "c")

"a" !in listOf("b", "c")
```

### 中缀表达式

```kotlin
infix fun <A, B> A.to(that: B): Pair<A,B>
```

### 函数可变参数vararg

```kotlin
fun printLetters(vararg letters: String, count: Int)

// 使用*（星号）来传入外部的变量作为可变参数的变量
val letters = arrayOf("a", "b", "c")
printLetters(*letters, count = 3)
```







