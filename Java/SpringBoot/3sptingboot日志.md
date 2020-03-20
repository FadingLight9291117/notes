# Spring Boot 与日志

## 一．日志框架

1.	System.out.println(“”);
2.	框架来记录系统的一些运行信息；日志框架；
3.	高大上的几个功能？异步功能？自动归档？
4.	将以前框架卸下来？换上新框架，重新修改之前相关的API；
5.	JDBC——数据库驱动；写了一个统一的接口层；日志门面；给项目中导入具体的日志实现就行了；我们之前的日志框架都是实现的抽象层。

### 1. 市面上常见的日志框架

> JUL，JCL，Jboss-logging,logbak,log4j,log4j2,slf4j…

| 日志门面（日志的抽象层）                                     | 日志实现                                          |
| ------------------------------------------------------------ | ------------------------------------------------- |
| JCL(Jakarta Commons Logging)，SLF4J(Simple Logging Facade for Java) ，Jboss-logging | Log4j， JUL(java.util.logging) ，Log4j2， Logback |

- 左边选一个门面，右边来选一个实现；
- 日志门面：SLF4J；
- 日志实现：Logback；
- SpringBoot：底层是Spring框架，Spring框架默认使用JCL；
- **SpringBoot选用SLF4j和logback**

## 二. SLF4J使用

### 1. 如何在系统中使用SLF4J

> 以后开发的时候，日志记录方法的调用，不应该直接调用日志的实现类，而是应该调用日志抽象层里面的方法；

- 给系统中导入slf4j和logback的实现jar

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloWorld {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(HelloWorld.class);
    logger.info("Hello World");
  }
}
```

- 调用示意图![示意图](http://www.slf4j.org/images/concrete-bindings.png)
- 每一个日志的实现框架都有自己的配置文件，使用slf4j以后，**配置文件还是做成日志实现框架自己本身的配置文件**

### 2. 遗留问题

> (slf4j + logback): Spring(commons-logging),Hibernate(Jboss-logging),Mybatis,xxx 统一日志记录，即使是别的框架也能和我一起统一使用slf4j进行输出？

- ![legacy](http://www.slf4j.org/images/legacy.png)

### 3. 如何让系统中所有的日志都统一到slf4j

1. 将系统中其他日志框架先排除出去
2. 用中间包来替换原有的日志框架
3. 我们导入slf4j其他的实现

## 四. SpringBoot日志关系

- 总结：
  1. SpringBoot底层也是使用slf4j+logback的方式进行日志记录
  2. SpringBoot也是把其他日志都替换成了slf4j
  3. 中间替换包？
  4. 如果我们要引入其他框架？一定要把这个框架的默认日志依赖移除掉？
     - spring框架用的是commons-logging;

> SpringBoot能自动配置所有的日志，而且底层使用slf4j，而且底层使用slf4j+logback的方式记录日志，引入其他框架的时候，只需要把这个框架依赖的日志框架排除掉。

## 五. 日志的使用

### 1. 默认配置

> springboot默认帮我们配置好了日志

```java
    // 记录器
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Test
    void contextLoads() {
        // 日志的级别
        // 由低到高 trace<debug<info<warn<error
        // 可以调整输出的日志级别，日志就会只在这个级别以后的高级别生效
        logger.trace(() -> "这是trace日志...");
        logger.debug(() -> "这是debug日志...");
        // springboot默认给我们使用的是info级别
        // 没有指定级别的就用springboot默认指定的级别；root级别
        logger.info(() -> "这是info日志...");
        logger.warn(() -> "这是warn日志...");
        logger.error(() -> "这是error日志...");
    }
```

#### 配置文件

``` properties
  # 指定日志级别
  logging.level.com.example.demo=trace

  #logger.paths
  # 不指定路径在当前路径下生成springboot.log日志
  # 可以指定完整路径
  # 在当前磁盘的根路径下创建spring文件夹和里面的log文件夹，默认使用spring.log为文件名
  logging.file.path=/spring/log

  # 在控制台输出的日志的格式
  logging.pattern.console=%d{yyyy-MM-dd} [%thread] %-5level %logger{50} - %msg%n
  # 在指定文件输出日志的格式
  logging.pattern.file=%d{yyyy-MM-dd} [%thread] %-5level %logger{50} - %msg%n
```

#### 日志输出格式

- %d表示时间，
- %thread表示线程名
- %-5level：级别从左显示5个字符宽度
- %logger{50}：表示logger名字最长50个字符，否则按照句点分割。
- %msg：日志消息
- %n：换行

- %d{yyyy-MM-dd} [%thread] %-5level %logger{50} - %msg%n

### 2.指定配置

> 给类路径下放上每个日志框架自己的配置文件即可；SpringBoot就不使用默认配置了

[官方文档](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-custom-log-configuration)

| Logging System          | Customization                                                             |
| ----------------------- | ------------------------------------------------------------------------- |
| Logback                 | logback-spring.xml, logback-spring.groovy, logback.xml, or logback.groovy |
| Log4j2                  | log4j2-spring.xml or log4j2.xml                                           |
| JDK (Java Util Logging) | logging.properties                                                        |

- 推荐使用**logback-spring.xml**（加spring）
- logback.xml: 直接就被日志框架识别
- logback-spring.xml: 日志框架就不直接加载日志的配置项，由SpringBoot解析日志配置，可以使用SpringBoot的高级Profile功能。

```xml
  <springProfile name="staging">
      <!-- configuration to be enabled when the "staging" profile is active -->
  </springProfile>

  <springProfile name="dev | staging">
      <!-- configuration to be enabled when the "dev" or "staging" profiles are active -->
  </springProfile>

  <springProfile name="!production">
      <!-- configuration to be enabled when the "production" profile is not active -->
  </springProfile>
```

## 五. 切换日志框架

- 可以按照slf4j的日志适配图，进行相关的切换；

- slf4j + log4j的方式

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
    <exclusions>
        <exclusion>
            <artifactId>logback-classic</artifactId>
            <groupId>ch.qos.logback</groupId>
        </exclusion>
        <exclusion>
            <artifactId>log4j-to-slf4j</artifactId>
            <groupId>org.apache.logging.log4j</groupId>
        </exclusion>
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-log4j12</artifactId>
</dependency>
```

- 切换为log4j2

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
    <exclusions>
        <exclusion>
            <artifactId>spring-boot-starter-logging</artifactId>
            <groupId>org.springframework.boot</groupId>
        </exclusion>
    </exclusions>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-log4j2</artifactId>
</dependency>
```
