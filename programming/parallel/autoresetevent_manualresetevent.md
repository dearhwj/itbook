# AutoResetEvent和ManualResetEvent的区别
原文地址:[http://blog.csdn.net/pyrtvu/article/details/6934175](http://blog.csdn.net/pyrtvu/article/details/6934175)


## 终止状态和非终止状态

首先说说线程的终止状态和非终止状态。AutoResetEvent和ManualResetEvent的构造函数中，都有bool变量来指明线程的终止状态和非终止状态。true表示终止状态，false表示非终止状态。看代码片段1：

代码片段1： 
        AutoResetEvent _autoResetEvent = new AutoResetEvent(false);

        private void BT_Temp_Click(object sender, RoutedEventArgs e) 
        { 
            Thread t1 = new Thread(this.Thread1Foo); 
            t1.Start(); 
            Thread.Sleep(3000); //Thread.Sleep(Int32)是批当前进程挂起3000毫秒，与线程t1是一点关系也没有的。
            _autoResetEvent.Set(); 
        }

        void Thread1Foo() 
        { 
            _autoResetEvent.WaitOne(); 
            MessageBox.Show("t1 end"); 
        } 
    这段代码的执行结果，就是3秒钟过后，弹出“t1 end”。 
    而如果把： 
    AutoResetEvent _autoResetEvent = new AutoResetEvent(false); 
    改为： 
    AutoResetEvent _autoResetEvent = new AutoResetEvent(true); 
    则“t1 end”将会立刻弹出。 
    也就是说，在终止状态中，_autoResetEvent.WaitOne()是不会起到阻滞工作线程的作用的。（PS：ManualResetEvent也同样）

## AutoResetEvent和ManualResetEvent的区别 

接下来，再来看看AutoResetEvent和ManualResetEvent的区别。我们看代码段2和代码段3：

代码段2： 
     AutoResetEvent _autoResetEvent = new AutoResetEvent(false); 
        private void BT_Temp_Click(object sender, RoutedEventArgs e) 
        { 
            Thread t1 = new Thread(this.Thread1Foo); 
            t1.Start(); 
            Thread t2 = new Thread(this.Thread2Foo); 
            t2.Start(); 
            Thread.Sleep(3000); 
            _autoResetEvent.Set(); 
        }

        void Thread1Foo() 
        { 
            _autoResetEvent.WaitOne(); 
            MessageBox.Show("t1 end"); 
        }

        void Thread2Foo() 
        { 
            _autoResetEvent.WaitOne(); 
            MessageBox.Show("t2 end"); 
        } 

该段代码运行的效果是，过3秒后，要么弹出“t1 end”，要么弹出“t2 end”，不会两个都弹出。也就是说，其中一个进行将会结束，而另一个进程永远不会结束。

代码段3： 
        ManualResetEvent _menuRestEvent = new ManualResetEvent(false);

        private void BT_Temp_Click(object sender, RoutedEventArgs e) 
        { 
            Thread t1 = new Thread(this.Thread1Foo); 
            t1.Start(); 
            Thread t2 = new Thread(this.Thread2Foo); 
            t2.Start(); 
            Thread.Sleep(3000); 
            _menuRestEvent.Set(); 
        }

        void Thread1Foo() 
        { 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t1 end"); 
        }

        void Thread2Foo() 
        { 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t2 end"); 
        } 

该段代码运行的效果是，过3秒后，“t1 end”和“t2 end”，两个都被弹出。也就是说，两个进程都结束了。 
这个特性就是说，AutoResetEvent只会给一个线程发送信号，而不会给多个线程发送信号。在我们需要同步多个线程的时候，就只能采用ManualResetEvent了。至于深层次的原因是，AutoResetEvent在set()之后，会将线程状态自动置为false，而ManualResetEvent在Set()后，线程的状态就变为true了，必须手动ReSet()之后，才会重新将线程置为false。这也就是为什么他们的名字一个为Auto，一个为Manual的原因。为了更加充分的验证ManualResetEvent的这点特性，我们再来看代码片段4

代码片段4： 
    ManualResetEvent _menuRestEvent = new ManualResetEvent(false);

        private void BT_Temp_Click(object sender, RoutedEventArgs e) 
        { 
            Thread t1 = new Thread(this.Thread1Foo); 
            t1.Start(); 
            Thread t2 = new Thread(this.Thread2Foo); 
            t2.Start(); 
            Thread.Sleep(3000); 
            _menuRestEvent.Set(); 
            //_menuRestEvent.Reset();            
        }

        void Thread1Foo() 
        { 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t1 step1 end"); 
            //睡1S，用于等待主线程_menuRestEvent.Reset(); 
            Thread.Sleep(1000); 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t1 step2 end"); 
        }

        void Thread2Foo() 
        { 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t2 step1 end"); 
            //睡1S，用于等待主线程_menuRestEvent.Reset(); 
            Thread.Sleep(1000); 
            _menuRestEvent.WaitOne(); 
            MessageBox.Show("t2 step2 end"); 
        } 

在代码片段4中，我们对//_menuRestEvent.Reset()进行了注释，也就是说， _menuRestEvent.Set()后，线程的状态就是true状态的，程序运行的结果是"t1 step1 end"、"t1 step2 end"、"t1 step2 end"、"t2 step2 end"在3秒之后全部弹出。
    而如果我们将//_menuRestEvent.Reset()的注释去掉，会发现"t1 step2 end"和"t2 step2 end"永远不会弹出。除非我们在主线程中再次对_menuRestEvent进行Set()。