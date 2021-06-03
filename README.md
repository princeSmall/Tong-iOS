# Tong--iOS

### oc对象本质

1. iOS对象占8字节内存，属性占4字节内存，而系统最小分配16字节内存

```
占用内存：class_getInstanceSize([NSObject class])

分配内存：
#import <malloc/malloc.h>

malloc_size((__bridge const void *)([NSObject new]))
  
```

2. oc中的对象主要可以分为三类：
  * instance对象
  * class对象
  * meta-class对象

3. load 和initialize

load方法是无论类有没有被用到，只要添加被引入到项目就会被调用，而initialize则是在这个类或者其子类第一次调用方法的时候就会进行调用。

4. 如何给category添加成员变量

由于分类的结构体中没有存放成员变量的数组，所以其无法创建和使用成员变量，但是我们可以通过runtime的API

```
<!-- 添加关联对象-->
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

<!--获取关联对象-->
- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
}

```

去给分类实现成员变量的添加

### Block

```
 block三种方式：
 全局区block：不获取任何外部变量，内存在编译时就确定
 堆区block：copy 到堆内存空间上，可以在定义的范围外使用
 栈区block：MRC下，栈内有效，出栈销毁
 
  block本质是一个oc对象，内部与欧一个isa指针，block是封装了函数调用以及函数调用环境的oc对象
 isa: 指向所属类的指针，也就是block的类型
 flags: 标志变量，在实现block的内部操作时会用到
 Reserved: 保留变量
 invoke: block执行时调用的函数指针，block内部的执行代码都在这个函数中
 descriptor: block的详细描述，包含 copy/dispose 函数，处理block引用外部变量时使用
         reserved: 保留变量
         size: block的内存大小
         copy: 拷贝block中被 __block 修饰的外部变量
         dispose: 和 copy 方法配置应用，用来释放资源
 variables: block范围外的变量，如果block没有调用任何外部变量，该变量就不存在

```

### 通知

 观察者模式：传递方式一对多
 
 当两个类没有关联时，并且响应数据改变时，使用通知
 
 在dealloc中移除通知，避免内存泄漏
 


### KVC与KVO

KVC(Key-value coding）：

1. 键值对编码，也就是我们可以通过变量的名称来读取或者修改它的值,而不需要调用明确的存取方法。这样就可以在运行时动态地访问和修改对象的属性。而不是在编译时确定。对于类里的私有属性，Objective-C是无法直接访问的，但是KVC是可以的。
2. KVC+Runtime  字典转模型

