# 生命周期钩子

## 所有的钩子函数

- beforeCreate
  - 在实例初始化前被触发
- created
  - 会在实例初始化后之后，且被添加到DOM之前触发
- beforeMount
  - 会在元素已经准备好被添加到DOM，但还没有添加的时候调用
- mounted
  - 会在元素元素创建后触发（但不一定已经添加到了DOM，可以用nextTick来保证这一点
  
```js
    this.$nextTick(() => {
        // 确定元素已经被添加到DOM上
    })

    // 或者
    Vue.nextTick()
```

- beforeUpdate
  - 会在数据更新将要对DOM做一些更改时触发
- updated
  - 会在DOM的更改已经完成后触发
- beforeDestory
  - 会在组件即将销毁并且从DOM上移除时触发
- destoryed
  - 会在组件销毁后触发
