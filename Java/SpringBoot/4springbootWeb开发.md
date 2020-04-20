# Spring Boot Web开发

## 一. 简介

- 使用SprigBoot
   1. 创建Spring Boot应用，选中我们需要的模块；
   2. SpringBoot已经默认将这些场景配置好了，只需要在配置文件中指定少量的配置就可以运行起来
   3. 自己编写业务代码

- 自动配置原理？

> xxxAutoConfiguration: 帮我们给容器自动配置组件；
> xxxProperties: 配置类来封装配置文件的内容。

- 这个场景SpringBoot帮我们配置了什么？能不能修改？能修改哪些配置？能不能扩展？xxx

## 二. SpringBoot对静态资源的映射规则

```java
@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
    if (!this.resourceProperties.isAddMappings()) {
        logger.debug("Default resource handling disabled");
        return;
    }
    Duration cachePeriod = this.resourceProperties.getCache().getPeriod();
    CacheControl cacheControl = this.resourceProperties.getCache().getCachecontrol().toHttpCacheControl();
    if (!registry.hasMappingForPattern("/webjars/**")) {
        customizeResourceHandlerRegistration(registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/")
                .setCachePeriod(getSeconds(cachePeriod)).setCacheControl(cacheControl));
    }
    String staticPathPattern = this.mvcProperties.getStaticPathPattern();
    if (!registry.hasMappingForPattern(staticPathPattern)) {
        customizeResourceHandlerRegistration(registry.addResourceHandler(staticPathPattern)
                .addResourceLocations(getResourceLocations(this.resourceProperties.getStaticLocations()))
                .setCachePeriod(getSeconds(cachePeriod)).setCacheControl(cacheControl));
    }
}
```

### 1. webjars

- 所有/webjars/**,都去classpath:/META-INF/resources/webjars/找资源

- webjars：以jar包的形式引入静态资源
- [官网](https://www.webjars.org/)
- ![path](.\imgs\webjars-jquery.png)

- localhost:8080/webjars/jquery/3.4.1/jquery.js

  ```xml
      <!-- 引入jquery-webjar -->在访问的时候只需要写webjars下面资源的名称即可
      <dependency>
          <groupId>org.webjars</groupId>
          <artifactId>jquery</artifactId>
          <version>3.4.1</version>
      </dependency>
  ```

### 2. 静态资源 

- "/**"访问当前项目的任何资源，（静态资源）

```java
"classpath:/META-INF/resources/",
"classpath:/resources/",
"classpath:/static/",
"classpath:/public/"
"/":当前项目的根路径
```

- localhost:8080/abc——去静态资源文件夹里面找abc

### 3. 欢迎页面

> 静态资源文件夹下的所有index.html页面，被/**映射

### 4. 图标

> 所有的**/favicon 都是在静态资源文件夹下找

### 5. 自定义静态资源文件夹

```properties
# 自定义静态资源文件夹，原文件夹不可使用
spring.resources.static-locations=classpath:/hello
```

## 三. 模板引擎

> JSP,Velocity,Freemarker,Thymeleaf

- SpringBoot推荐使用Thymeleaf

### 1. 引入

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

### 2. Thymeleaf的使用与语法

```java
@ConfigurationProperties(prefix = "spring.thymeleaf")
public class ThymeleafProperties {

    private static final Charset DEFAULT_ENCODING = StandardCharsets.UTF_8;

    public static final String DEFAULT_PREFIX = "classpath:/templates/";

    public static final String DEFAULT_SUFFIX = ".html";
}
```

> 只要我们把HTML放在classpath://templates/，thymeleaf就能自动渲染

#### 使用

> [官方文档](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.pdf)

1. 导入thymeleaf的名称空间

    ```html
    <html lang="en" xmlns:th="http://www.thymeleaf.org">
    ```

2. 使用thymeleaf语法

    ```html
    <!DOCTYPE html>
    <html lang="en" xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
    <h1>成功！</h1>
    <!--th:text 将div里面的文本内容设置为-->
    <div th:text="${hello}">这里显示欢迎信息</div>
    </body>
    </html>
    ```

3. 语法规则

   - th:text：改变元素里面的文本内容
     - th：任意html属性：来替换原生属性的值
   - 表达式
     - 内置对象

    > 看文档

## 四. Spring MVC 自动配置

[官方文档](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-spring-mvc-auto-configuration)

### 1. Spring MVC Auto-configuration

>SpringBoot 自动配置好了SpringMVC;
>以下是SpringBoot对SpringMVC的默认配置：

Spring Boot provides auto-configuration for Spring MVC that works well with most applications.

The auto-configuration adds the following features on top of Spring’s defaults:

- Inclusion of ContentNegotiatingViewResolver and BeanNameViewResolver beans.
  - 自动配置了ViewResovler（视图解析器：根据方法的返回值得到视图对象（view)，视图对象决定如何渲染（转发？重定向？））
  - ContentNegotiatingViewResovler：组合所有视图解析器
  - 如何定制：我们可以自己给容器中添加一个视图解析器；自动的将其组合进来；

- Support for serving static resources, including support for WebJars (covered later in this document)).
  - 静态资源路径；webjars

- Automatic registration of Converter, GenericConverter, and Formatter beans.
  - Converter：转换器，public String hello(User user):类型转换使用converter
  - Formatter: 格式化器 2020.3.14==Date;

```java
@Bean
@ConditionalOnProperty(perfix = "spring.mvc", name = "date-formatter")  // 在文件中配置日期格式化的规则
public Formatter<Date> dateFormatter() {
    return new DateFormatter(this.mvcProperties.getDateFormat());   // 日期格式化
}
```

> 自己添加的格式化转换器，我们只需放在容器中即可

- Support for HttpMessageConverters (covered later in this document).
  - HttpMessageConverters: SpringMVC用来转换HTTP请求和响应的；User---json
  - HttpMessageConverters: 是从容器中确定；获取所有的HttpMessageConverter；
  - 如果自己给容器中添加HttpMessageConverter，只需将自己的组件注册到容器中（@Bean，@Component）

- Automatic registration of MessageCodesResolver (covered later in this document).
  - 定义错误代码生成规则

- Static index.html support.

- Custom Favicon support (covered later in this document).

- Automatic use of a ConfigurableWebBindingInitializer bean (covered later in this document).
  - 我们可以配置一个默ConfigurableWebBingingInitialize来替换默认的；（添加到容器）
  - 初始化WebDataBindere;

> org.springframework.boot.autoconfigure.web: web的所有自动场景

If you want to keep those Spring Boot MVC customizations and make more MVC customizations (interceptors, formatters, view controllers, and other features), you can add your own @Configuration class of type WebMvcConfigurer but without @EnableWebMvc.

### 2. 扩展SpringMVC

```xml
<mvc:view-controller path="/hello" view-name="sucess"/>
<mvc:interceptors>
	<mvc:interceptor>
    	<mvc:mapping path="/hello"/>
    </mvc:interceptor>
</mvc:interceptors>
```

==编写一个配置类(@Configuration),是WebMvcConfigurerAdapter类型；不能标注@EnableWebMvc==

既保留了所有的自动配置，也能用我们扩展的配置:

```java
// 扩展SpringMvc的功能
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // 浏览器发送 /atclz 请求来到success
        registry.addViewController("/atclz").setViewName("success");
    }
}
```

原理:

1. WebMvcAutoConfiguration是SpringMvc的自动配置类
2. 在做其他自动配置时会导入；@Import(EnableWebConfiguration.class)
3. 容器中所有的WebMvcConfigurer都会一起起作用
4. 我们的配置类也会被调用

### 3. 全面接管SpringMVC

> SpringBoot对SpringMVC的自动配置不需要了，所有都是我们自己配置；所有的SpringMVC的自动配置都失效了

**我们只需在配置类中添加@EnableWebMvc即可；**

```java
// 扩展SpringMvc的功能
@EnableWebMvc
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // 浏览器发送 /atclz 请求来到success
        registry.addViewController("/atclz").setViewName("success");
    }
}
```

原理:

为什么@EnableWebMvc自动配置就失效了？

1. @EnableWebMvc的核心

```java
@Import(DelegatingWebMvcConfiguration.class)
public @interface EnableWebMvc {
```

2.

```java
public class DelegatingWebMvcConfiguration extends WebMvcConfigurationSupport {
```

3. ```java
   @Configuration(proxyBeanMethods = false)
   @ConditionalOnWebApplication(type = Type.SERVLET)
   @ConditionalOnClass({ Servlet.class, DispatcherServlet.class, WebMvcConfigurer.class })
   // 容器中没有这个组件的时候，这个自动配置类才生效
   @ConditionalOnMissingBean(WebMvcConfigurationSupport.class)
   @AutoConfigureOrder(Ordered.HIGHEST_PRECEDENCE + 10)
   @AutoConfigureAfter({ DispatcherServletAutoConfiguration.class, TaskExecutionAutoConfiguration.class,
         ValidationAutoConfiguration.class })
   public class WebMvcAutoConfiguration {
   ```

   4. @EnableWebMvc将WebMvcConfigurationSupport组件导入进来；
   5. 导入的WebMvcConfigurationSupport只是SpringMVC的最基本的功能

## 五. 如何修改SpringBoot的默认配置

模式：

1. SpringBoot在自动配置很多组件的时候，先看容器中有没有用户自己配的（@Bean，@Component），如果有就用用户自己配置的，如果没有，才自动配置；如果有些组件可以有多个（ViewResolver）将用户配置和自己默认的组合起来；

2. 在SpringBoot中会有非常多的xxxConfigure帮助我们扩展配置

## 六.国际化

> i18n : internationalization国际化，去首尾字母，中间18个字母，简称位i18n

![image-20200415121440965](.\imgs\image-20200415121440965.png)

## 七. 登录拦截器

- 配置拦截器

```java
/**
 * 登录检查
 */
@Component
public class LoginHandlerInterceptor implements HandlerInterceptor {
    // 目标方法之前
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Optional<String> username = Optional.ofNullable((String) session.getAttribute("username"));
        Optional<String> password = Optional.ofNullable((String) session.getAttribute("password"));
        if (username.isEmpty() || password.isEmpty()) {
            request.getRequestDispatcher("/login");
            return false;
        } else {
            return true;
        }
    }
```

- 注册拦截器

```java
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    // 注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandlerInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/index.html", "/form", "/", "/user/login");
    }
}

```

## 八.定制错误页面

- 原理:
- 可以参照ErrorMvcAutoConfiguration
- 给容器添加以下组件
  - DefaultErrorAttributes
  - BasicErrorConstroller
  - ErrorPageCustomizer
  - DefaultErrorViewResolver

## 九.嵌入式servlet容器配置修改

问题？

1. 如何定制和修改servlet容器的相关配置；

   1. 修改和server相关的配置（ServerProperties）：

   ```properties
   server.port=8001
   server.context-path=/curd
   
   server.tomcat.url-encoding=UTF-8
   
   // 通用的Servlet容器配置
   server.xxx
   // Tomcat的设置
   server.tomcat.xxx
   ```

   2. 编写一个EmbeddedServletContainerCustomizer

## 十.注册Servlet三大组件

1. 注册Servlet，Filter，Listener
   1. ServletRegistrationBean
   2. FilterRegistrationBean
   3. ServletListenerRegistrationBean

## 十一.替换其他嵌入式Servlet容器

jetty

```xml
<dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-tomcat</artifactId>
                </exclusion>
            </exclusions>
        </dependency>

        <!-- 引入其他的Servlet容器 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jetty</artifactId>
        </dependency>
```

