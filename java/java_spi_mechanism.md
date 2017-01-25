# Java spi机制浅谈
原文地址：[http://singleant.iteye.com/blog/1497259](http://singleant.iteye.com/blog/1497259)


Java spi的具体约定如下 ：
当服务的提供者，提供了服务接口的一种实现之后，在jar包的META-INF/services/目录里同时创建一个以服务接口命名的文件。该文件里就是实现该服务接口的具体实现类。而当外部程序装配这个模块的时候，就能通过该jar包META-INF/services/里的配置文件找到具体的实现类名，并装载实例化，完成模块的注入。 
基于这样一个约定就能很好的找到服务接口的实现类，而不需要再代码里制定。
jdk提供服务实现查找的一个工具类：java.util.ServiceLoader

```

package search;  
  
import java.util.Iterator;  
import java.util.ServiceLoader;  
  
public class SearchTest {  
  
    public static void main(String[] args) {  
        ServiceLoader<Search> s = ServiceLoader.load(Search.class);  
        Iterator<Search> searchs = s.iterator();  
        if (searchs.hasNext()) {  
            Search curSearch = searchs.next();  
            curSearch.search("test");  
        }  
    }  
}  



```


最后创建在META-INF/searvices/search.Search文件。
当search.Search文件内容是"search.FileSearch"时，程序输出是：
now use file system search. keyword:test
当search.Search文件内容是"search.DatabaseSearch"时，程序输出是：
now use database search. keyword:test 
可以看出SearchTest里没有任何和具体实现有关的代码，而是基于spi的机制去查找服务的实现。
