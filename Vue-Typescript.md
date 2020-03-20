# Vue-Typescript

[官方文档](https://class-component.vuejs.org/)

## Class Component

### @Component

> @Component装饰器使一个类变成Vue组件

```js
import Vue from 'vue'
import Component from 'vue-class-component'

// HelloWorld class will be a Vue component
@Component
export default class HelloWorld extends Vue {}
```

> 指定组件放在@Component装饰器里面

```js
@Component({
  // Specify `components` option.
  // See Vue.js docs for all available options:
  // https://vuejs.org/v2/api/#Options-Data
  components: {
    OtherComponent
  }
})
export default class HelloWorld extends Vue {}
```

### Data

> 直接就是类的属性

```vue
<template>
  <div>{{ message }}</div>
</template>

<script>
import Vue from 'vue'
import Component from 'vue-class-component'

@Component
export default class HelloWorld extends Vue {
  // Declared as component data
  message = 'Hello World!'
}
</script>
```

### Method

> 直接就是类的方法

