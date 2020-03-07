# 事件修饰符

## @click.prevent

> 当链接被单击时阻止页面的跳转

## @click.stop

> 阻止事件继续传播，以避免在父级元素上触发事件

## @click.once

> 只在第一次触发事件的时候触发事件侦听器

## @click.capture

> 使用*捕获模式*（事件会在传递到当前元素的下级元素前触发），而*冒泡模式*（事件会沿着DOM树向上冒泡）

## @click.self

> 只监听元素本身而不是它的子元素上触发的事件（也就是说，event.target就是绑定该侦听器的元素）

## @click.stop.capture.once

> 也可以只设置事件名和修饰符而不传入侦听器，而且还可以将修饰符串联起来使用。这个例子意思就是阻止单击事件沿DOM树向下传递，但只在第一次触发时有效

# 按键修饰符

## @keyup

```js
 handleKeyup(e) {
    if (e.keyCode === 27) {
        alert("Hello")
    }
}
```

## @keyup.27

## @keyup.enter

## @keydown

还有其他如下:

- .enter
- .tab
- .delete
- .esc
- .space
- .up
- .down
- .left
- .right
- .ctrl
- .alt
- .shift
- .meta
  - Windows, Command
- .shift-left

    ```js
        e.key === ShiftLeft
     ```

## 其他

### 鼠标事件

- .left
- .middle
- .right
