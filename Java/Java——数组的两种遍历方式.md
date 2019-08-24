# 数组的两种遍历方式

>1. for循环
>2. for-each循环

---

## 一、普通for循环语句

```java
    String[] str = new String[] { "abcd", "efghi", "jklmn" };
    // 普通for循环
    System.out.println("============普通for循环================");
    for (int i = 0; i < str.length; i++) {
        System.out.println(str[i]);
    }
```

## 二、for-each循环语句

```java
    String[] str = new String[] { "abcd", "efghi", "jklmn" };
    // for-each循环
    System.out.println("============for-each循环=============");
    for (String item : str) {
        System.out.println(item);
    }
```

---

>两种循环结果相同，效率也相近，后者写法更简洁，前者更灵活
