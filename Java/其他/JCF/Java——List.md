# List

---

- List:列表
  - 有序的Collection
  - 允许重复元素
  - {1,2,3,{5,2},1,3}

- List主要实现
  - ArrayList（非同步的）
  - LinkedList（非同步的）
  - Vector（同步）

## 三种实现方式

### （一）ArrayList

- 以数组实现的列表，不支持同步
- 利用索引位置可以快速定位访问
- 不适合指定位置的插入、删除操作
- 适合变动不大，主要用于查询的数据
- 和Java数组相比，其容量是可动态调整的
- ArrayList在元素填满容器时会自动扩充容器大小的50%

- 三种遍历方式
  - iterator遍历
  
   ```java
    public static void traverByIterator(ArrayList<Integer> a) {
        long startTime = System.nanoTime();
        System.out.println("======迭代器遍历======="); 
        Iterator<Integer> iter1 = a.iterator();
        while (iter1.hasNext()) {
            iter1.next();
        }
        long endTime = System.nanoTime();
        long duration = endTime - startTime;
        System.out.println(duration + "纳秒");
    }
    ```

  - 随机索引遍历
  
  ```java
  public static void traverByIndex(ArrayList<Integer> a) {
        long startTime = System.nanoTime();
        System.out.println("=====随机索引值遍历======");
        for (int i = 0; i < a.size(); i++) {
            a.get(i);
        }
        long endTime = System.nanoTime();
        long duration = endTime - startTime;
        System.out.println(duration + "纳秒");
    }
  ```

  - foreach遍历

  ```java
  public static void traverByFor(ArrayList<Integer> a) {
      long startTime = System.nanoTime();
      System.out.println("=====for循环遍历====");
      for (Integer item : a) {
          ;
      }
      long endTime = System.nanoTime();
      long duration = endTime - startTime;
      System.out.println(duration+"纳秒");
  }
  ```

- 三种遍历方式效率比较：
  - foreach稍高于于随机索引，iterator效率较差
  - foreach > 随机索引遍历 > iterator遍历
  
### （二）LinkedList

- 以双向链表实现的列表，不支持同步
- 可被当作堆栈，队列和双端队列进行操作
- 顺序访问高效，随机访问较差，中间插入和删除高效
- 适用于经常变化的数据

- 三种遍历方式（类似与ArrayList）
  - iterator遍历
  - 随机索引遍历
  - foreach遍历
  
- 三种遍历方式效率比较
  - 随机索引效率极差
  - foreach > iterator >> 随机索引

### （三）Vector（同步）

- Vector同步，适用在多线程下使用
- 和ArrayList类似，可变数组实现的列表，但性能稍差于Vector
- 原先不属于JCF框架，属于Java最早的数据结构，性能较差
- 从JDK1.2开始，Vector被重写，并纳入JCF
- 官方建议在非同步的情况下，优先使用ArrayList

- 四种遍历方式：（前三种与前面类似）
  - iterator遍历
  - 随机索引遍历
  - foreach遍历
  - Enumeration遍历（老方法，很少用）

  ```java
  public static void traverEnumeration(Vector<Integer> v) {
        System.out.println("=====Enumeration遍历======");
        for (Enumeration<Integer> enu = v.elements(); enu.hasMoreElements();) {
            enu.nextElement();
        }
    }
  ```

- 三种遍历方式效率比较
  - foreach > 随机索引遍历 > iterator遍历 = Enumeration遍历

## 三种List比较

- ArrayList适用于较多查询的（静态）数据
- LinkedList适用于频繁增删的数据
- Vector类似于ArrayList，但支持同步
- 同步采用Vector
- 非同步情况下，根据数据操作特点选取ArrayList/LinkedList
