```kotlin
fun main() {
    // val sum: Int -> Int = { x -> x + 1 } 错误
    val sum: (Int) -> Int = { x -> x + 1 }
	val result = sum(1)
	println(result)
}
```

