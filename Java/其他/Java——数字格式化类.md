# 数字格式化

## DecimalFormat类——格式化输出数字

- 首先区分＃/０
  - 整数部分： 整数部分#认为整数不存在时，可不写；0认为不存在时，但至少写一位，写0
  - 小数部分：#代表最多有几位，0代表必须有且只有几位

```java
double pi = 3.1415926;
// 取一位整数
System.out.println(new DecimalFormat("0").format(pi));// 3
// 取一位整数和两位小数
System.out.println(new DecimalFormat("0.00").format(pi));// 3.14
// 取两位整数和三位小数,整数不足一0填补
System.out.println(new DecimalFormat("00.000").format(pi));// 03.142
// 取所有整数部分
System.out.println(new DecimalFormat("#").format(pi));// 3
// 以百分比方式计数，并取两位小数
System.out.println(new DecimalFormat("0.##%").format(pi / 100));// 3.14%

long c = 299792458;
// 显示为科学计数法，并取五位小数
System.out.println(new DecimalFormat("0.00000E0").format(c));// 2.99792E8
// 显示为两位整数的科学计数法，并取四位小数
System.out.println(new DecimalFormat("00.0000E0").format(c));// 29.9792E7
// 每三位以逗号进行分隔
System.out.println(new DecimalFormat(",###").format(c));// 299,792,458
// 将格式化数字嵌入文本
System.out.println(new DecimalFormat("光速的大小为,###m/s").format(c));// 光速的大小为299,792,458m/s
```
