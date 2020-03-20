# Kotlin 笔记

## 一.if expression

``` kt
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

## 二.when expression

> when replaces the switch operator of C-like language.

``` kt
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

