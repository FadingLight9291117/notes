# Set集合

- 集合Set
  - 确定性：对任意对象都能判定其是否属于某一个集合
  - 互异性：集合内每个元素都是不相同的，**注意是内容互异**
  - 无序性：集合内的顺序无关

- Java的集合接口Set
  - HashSet（基于散列函数的集合，无序，不支持同步,可容纳null，）
  - LinkedHashSet（基于散列函数和双向链表的集合，可排序，不支持同步，可容纳null）
  - TreeSet（基于树结构的集合，可排序，不支持同步,不可容纳null）
  
- HashSet,LinkedHashSet,TreeSet的元素都只能是对象

## 三种实现类

### （一）HashSet

>基于HashMap实现的，可以容纳null元素，不支持同步

- 实现同步：Set s = Collections.synchronizedSet(new HashSet(...));

- add 添加一个元素
- clear 清理整个HashSet
- contains 判定是否包含一个元素
- remove 删除一个元素
- size 数据元素个数
- retainAll 计算两个集合交集

- 由于集合的互异性，集合不能容纳重复的元素。

- HashSet没有保留顺序，其遍历顺序无序

- 两种遍历方式
  - iterator遍历
  - foreach遍历

- 两种遍历方式效率比较
  - foreach遍历 > iterator遍历
  
### （二）LinkedHashSet

> 继承HashSet，也是基于HashMap实现的，可容纳null元素，不支持同步

- 同步实现：
  - Set s = Collections.synchronizeedSet(new LinkedHashSet(...));

- 方法和HashSet基本一致
  - add,clear,contains,remove,size
  
- 通过一个双向链表维护插入顺序

- LinkedHashSet是保留顺序的，其遍历顺序于插入顺序一致

- 两种遍历方式
  - foreach遍历 > iterator遍历

### （三）TreeSet

> 基于TreeMap实现的，不可容纳null元素，不支持同步

- 实现同步：
  - SortedSet s = Collections.synchronizedSortedSet(new TreeSet(...));

- add,clear,contains,remove,size

- 根据compareTo方法或指定Comparator排序

- TreeSet的遍历结果是升序的

- 两种遍历方式效率比较
  - foreach > iterator

## 三种集合遍历顺序如何？

- HashSet是无序输出的
- LinkedHashSet是按照插入的顺序进行遍历输出
- TreeSet是按照所存储对象大小升序排序

## 三种集合如何保证元素互异？

- HashSet,LinkedHashSet,TreeSet的元素都只能是对象
  
- HashSet和LinkedHashSet判定元素重复的原则
  - 判定两个元素的hashCode返回值是否相同，若不同，返回fasle
  - 若两者hashCode相同，判定equals方法，若不同，返回false，否则返回true。
  - hashCode和equals方法是所有类都有的，因为Object类有

- TreeSet判定元素重复的原则
  - **需要元素继承自Comparable接口**
  - 比较两个元素的compareTo方法

- 例如下面俩个例子

  ```java
    public class Cat {
      private int i;

      public Cat(int i) {
          this.i = i;
      }

      public int getSize() {
          return this.i;
      }

      @Override
      public boolean equals(Object obj) {
          System.out.println("=======equals======");
          return this.i == ((Cat) obj).getSize() ? true : false;
      }

      @Override
      public int hashCode() {
          System.out.println(i + "======hashCode=====");
          return this.i;
      }

      @Override
      public String toString() {
          String str = "第{}只猫";
          Object[] arg = new Object[] { i };
          String value = MessageFormat.format(str, arg);
          return value;
      }
    }
  ```

  - 类本身没有hashCode(),而是继承Object类的,而Object的hashCode()会返回对象信息和内存地址经过运算后的一个int值,两个不同的对象,它们的hashCode()返回值不同
  - Cat类改写了hashCode()方法,所以两个不同发Cat(0),它们的hashCode()返回值相同
  - 这3个方法三位一体,equals()是相同的,hashCode()是相同的,toString()也应该是相同的.

  ```java
    public class tiger implements Comparable {
        private int i;

        public tiger(int i) {
            this.i = i;
        }

        public int getSize() {
            return i;
        }

        @Override
        public int compareTo(Object o) {
            System.out.println(i+"====== compareTo======");
            return this.i - ((tiger)o).getSize();
        }
    }
  ```
  
  - compareTo方法具体规则如下
    - int a = obj1.compareTo(obj2)
    - 如果a > 0,则obj1 > obj2
    - 如果a == 0,则obj1 == obj2
    - 如果a < 0,则obj1 < obj2
  
  -HashSet的元素判定规则只和hashCode,equals这2个方法有关,和compareTo无关
