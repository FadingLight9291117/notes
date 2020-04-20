# Kotlin中的中缀表达式

看一个例子:

```kotlin
infix fun String.love(that: String): String = 
    "${this}爱$that"

infix fun String.but(other: String?): String = 
    "${this},但是$other"

fun main() {
    println("我" love "她" but "她不爱我") // => "我爱她，但是她不爱我"
    println("我" love "她" but "她" love "他") // => "我爱她，但是她爱他"
}
```

​	怎么样，是不是特别像自然语言:)

