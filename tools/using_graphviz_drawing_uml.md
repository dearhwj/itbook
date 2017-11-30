# 使用Graphviz画UML类图



## 泛化

概念：泛化是一种一般与特殊、一般与具体之间关系的描述，具体描述建立在一般描述的基础之上，并对其进行了扩展。在程序中是通过继承类实现的。比如狗是对动物的具体描述，在面向对象设计的时候一般把狗设计为动物的子类。

表示方法：空心三角形箭头的实线，子类指向父类

### 实现

​
​
### 泛化
​
概念：泛化是一种一般与特殊、一般与具体之间关系的描述，具体描述建立在一般描述的基础之上，并对其进行了扩展。在程序中是通过继承类实现的。比如狗是对动物的具体描述，在面向对象设计的时候一般把狗设计为动物的子类。
​
表示方法：空心三角形箭头的实线，子类指向父类
​
### 实现
​
概念：实现是一种类与接口的关系，表示类是接口所有特征和行为的实现，在程序中一般通过类实现接口来描述
​
表示方法：空心三角形箭头的虚线，实现类指向接口
​
​
### 依赖
​
概念：是一种使用的关系，即一个类的实现需要另一个类的协助，所以要尽量不使用双向的互相依赖，在程序中一般表现为类A中的方法需要类B的实例作为其参数或者变量，而类A本身并不需要引用类B的实例作为其成员变量。
​
表示方法：虚线箭头，类A指向类B
​
​
### 关联
​
概念：表示类与类之间的联接,它使一个类知道另一个类的属性和方法，这种关系比依赖更强、不存在依赖关系的偶然性、关系也不是临时性的，一般是长期性的，在程序中被关联类B以类属性的形式出现在关联类A中，也可能是关联类A引用了一个类型为被关联类B的全局变量
​
表示方法：实线箭头，类A指向类B
​
### 聚合
​
概念：聚合关联关系的一种特例，是强的关联关系。聚合是整体和个体之间的关系，即has-a的关系，整体与个体可以具有各自的生命周期，部分可以属于多个整体对象，也可以为多个整体对象共享。程序中聚合和关联关系是一致的，只能从语义级别来区分；
​
表示方法：尾部为空心菱形的实线箭头（也可以没箭头），类A指向类B
​
​
### 组合
​
概念：组合也是关联关系的一种特例。组合是一种整体与部分的关系，即contains-a的关系，比聚合更强。部分与整体的生命周期一致，整体的生命周期结束也就意味着部分的生命周期结束，组合关系不能共享。程序中组合和关联关系是一致的，只能从语义级别来区分。
​
表示方法：尾部为实心菱形的实现箭头（也可以没箭头），类A指向类B
​
### 双向箭头连线
    
    A->B[dir="both"] 
​
### 无向箭头连线
​
    C->D[dir="none"] 
​
绘制的语法和图片的效果如下
​
​
​
```graphviz
    digraph G {
      fontname = "Courier New"
      fontsize = 8
​
      node [
              fontname = "Courier New"
              fontsize = 8
              shape = "record"
      ]
​
      edge [
              fontname = "Courier New"
              fontsize = 8
      ]
      Animal [
              label = "{Animal|+ name : string\l+ age : int\l|+ die() : void\l}"
      ]
​
      Dog [
              label = "{Dog||+ bark() : void\l}"
      ]
​
      Cat [
              label = "{Cat||+ meow() : void\l}"
      ]
      edge [
              arrowhead = "empty"
      ]
​
​
​
​
      People [
      label = "{People|+crossRiver(Boat boat)\l}"
      ]
​
​
​
      Teacher [
      label = "{Teacher|+Course\l}"
      ]
​
​
​
      Class [
          label = "{Class|+Course\l+Students\l}"
      ]
​
      Dog -> IDog [style=dashed arrowhead=empty label=实现]
      Dog -> Animal [ arrowhead = "empty" label=泛化]
      Cat -> Animal [ arrowhead = "empty" label=泛化]
​
      Student-> Class[arrowhead=ediamond label=聚合]
      People -> Boat[style=dashed label=依赖]
      Teacher -> Course[style=dashed label=关联]
      Head -> Human[arrowhead=diamond label=组合]
      LeftLeg -> Human[arrowhead=diamond label=组合]
      RightLeg -> Human[arrowhead=diamond label=组合]
  }
​
```

​
```graphviz
digraph G {
    fontname = "Courier New"
    fontsize = 8
​
    node [
            fontname = "Courier New"
            fontsize = 8
            shape = "record"
    ]
​
    edge [
            fontname = "Courier New"
            fontsize = 8
    ]
    Animal [
            label = "{Animal|+ name : string\l+ age : int\l|+ die() : void\l}"
    ]
​
    Dog [
            label = "{Dog||+ bark() : void\l}"
    ]
​
    Cat [
            label = "{Cat||+ meow() : void\l}"
    ]
    edge [
            arrowhead = "empty"
    ]
​
​
    
    
    People [
    label = "{People|+crossRiver(Boat boat)\l}"
    ]
    
​
​
    Teacher [
    label = "{Teacher|+Course\l}"
    ]
    
    
    
    Class [
        label = "{Class|+Course\l+Students\l}"
    ]
    
    Dog -> IDog [style=dashed arrowhead=empty label=实现]
    Dog -> Animal [ arrowhead = "empty" label=泛化]
    Cat -> Animal [ arrowhead = "empty" label=泛化]
    
    Student-> Class[arrowhead=ediamond label=聚合]
    People -> Boat[style=dashed label=依赖]
    Teacher -> Course[style=dashed label=关联]
    Head -> Human[arrowhead=diamond label=组合]
    LeftLeg -> Human[arrowhead=diamond label=组合]
    RightLeg -> Human[arrowhead=diamond label=组合]
    
    A->B [dir=both label=双向箭头连线]
​
    
    C->D[dir=none label=无向箭头连线] 
}
​
```