# Map

- Map映射
  - k-v对，{Key,Value}，键值对

- Java中的Map
  - Hashtable（同步，慢，数据量小）
  - HashMap（非同步，块，数据量大）
  - Properties（同步，文件形式，数据量小）

## 三种实现类

### （一）Hashtable

- K-V对，K和V都不允许null
- 同步，多线程安全
- 无序的
- 适合小数据量
- 主要方法
    | 方法名        | 描述                |
    | :------------ | :------------------ |
    | clear         | 清空数据            |
    | contains      | 等同于containsValue |
    | containsKey   | 是否包含某一个Key   |
    | containsValue | 是否包含某一个值    |
    | get           | 根据Key获取相应的值 |
    | put           | 增加新的K-V对       |
    | remove        | 删除某一个K-V对     |
    | size          | 返回数据元素数量    |
- 三种遍历方法
  - Entry迭代器遍历

    ```java
        public static void traverByEntry(Hashtable<Integer, String> ht) {
            long startTime = System.nanoTime();
            System.out.println("================Entry迭代器遍历=========");
            Integer key;
            String value;
            Iterator<Entry<Integer, String>> iter = ht.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry<Integer, String> entry = iter.next();
                // 获取Key
                key = entry.getKey();
                // 获取value
                value = entry.getValue();
            }
            long endTime = System.nanoTime();
            long duration = endTime - startTime;
            System.out.println(duration + "纳秒");
        }
    ```

  - 根据Key的Iterator遍历

    ```java
        public static void traverByKeySet(Hashtable<Integer, String> ht) {
            long startTime = System.nanoTime();
            System.out.println("=============KeySet迭代器遍历===========");
            Integer key;
            String value;
            Iterator<Integer> iter = ht.keySet().iterator();
            while (iter.hasNext()) {
                key = iter.next();
                value = ht.get(key);
            }
            long endTime = System.nanoTime();
            long duration = endTime - startTime;
            System.out.println(duration + "纳秒");
        }
    ```

  - 根据Key的Enumeration遍历

    ```java
        public static void traverByEnumeration(Hashtable<Integer, String> ht) {
            long startTime = System.nanoTime();
            System.out.println("=======KeyEnumeration迭代器遍历==========");
            Integer key;
            String value;
            Enumeration<Integer> keys = ht.keys();
            while (keys.hasMoreElements()) {
                key = keys.nextElement();
                value = ht.get(key);
            }
            long endTime = System.nanoTime();
            long duration = endTime - startTime;
            System.out.println(duration + "纳秒");
        }
    ```

    - 三种遍历效率相近

### （二）HashMap

- K-V对，K和V都允许null
- 不同步，多线程不安全
  - 实现同步：Map m = Collections.synchronizedMap(new HashMap(...));

- 无序的
- 主要方法：clear,containsValue,containsKey,get,put,remove,size

- 两种遍历方式
  - Entry遍历
  - KeySet迭代器遍历
  
- 遍历效率比较
  - KeySet > Entry

### （三）LinkedHashMap

- 基于双向链表的维持插入顺序的HashMap

### （四）TreeMap

- 基于红黑树的Map，可以根据Key的自然排序或者compareTo方法进行排序输出

## 遍历顺序

- HashMap遍历是无序的
- LinkedHashMap遍历的顺序和它插入的顺序保持一致
- TreeMap遍历的顺序是按照大小或compareTo方法规定的
  
### （五）Properties

- 继承于Hashtable
- 可以将K-V对保存在文件中
- 适用于数据量小的配置文件
- 继承自Hashtable的方法：clear,contains/containsValue,containsKey,get,put,remove,size

- load：加载源文件中所有的k-v对
- store：将所有的k-v对写入到文件中
- getProperty：是获取某一个Key所对应的Value
- setProperty：是写入一个k-v对

- 写入到文件
  
```java
    public static void writeProperties(String filePath, String key, String value, String comments) throws Exception {
            File file = new File(filePath);
            if (!file.exists()) {
                file.createNewFile();
            }
            Properties pps = new Properties();
            InputStream in = new FileInputStream(file);
            // 从输入流中读取属性列表（键和元素树）
            // 强制要求属性键和值为String类型
            pps.load(in);
            OutputStream out = new FileOutputStream(file);

            pps.setProperty(key, value);
            // 以适合使用load方法加载到Properties表中的格式
            // 将此properties表中的属性列表（键和元素对）写入输出流
            pps.store(out, comments);
            out.close();
        }
```

- 遍历方法
  - entry迭代遍历
  - 根据key的Iterator迭代遍历
  - 根据key的enumeration迭代遍历
  
  ```java
    public static void GetAllProperties(String filePath) throws Exception {
            Properties pps = new Properties();
            InputStream in = new BufferedInputStream(new FileInputStream(filePath));
            pps.load(in);// 加载所有kv对

            Enumeration en = pps.propertyNames();

            while (en.hasMoreElements()) {
                String strKey = (String) en.nextElement();
                String strValue = pps.getProperty(strKey);
                // System.out.println("key:"+strKey+" value:"+strValue);
            }
        }
  ```

## 总结

- HashMap是最常用的映射结构
- 如需排序，考虑LinkedHashMap和TreeMap
- 如需将K-V对存储为文件。可采用Properties类
