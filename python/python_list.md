# Python List

### List的循环
* 用while循环
```
unconfirmed_users = ['alice', 'brian', 'candace']

# Verify each user until there are no more unconfirmed users.
# Move each verified user into the list of confirmed users.
while unconfirmed_users:
	current_user = unconfirmed_users.pop()
	print("Verifying user: " + current_user.title())
```

* 用for循环

```
>>> a=[1,2,3]
>>> for i in a:
...     print(i)
... 

```

* 用数组长度来循环
```
a = ['Mary', 'had', 'a', 'little', 'lamb']
for i in range(len(a)):
     print i, a[i]
```



### List的循环删除

```
#方法一
l = ['aadfds','dsa', 'dcver','weiry','11111']
l = [x for x in l if 'a' not in x]      #列表解析
print l

#方法二
l = ['aadfds','dsa', 'dcver','weiry','11111']
l = filter(lambda x:'a' not in x, l)    #filter
print l

#方法三
l = ['aadfds','dsa', 'dcver','weiry','11111']

for i in range(len(l)-1,-1,-1):         #倒序
    if 'a' in l[i]:
        del l[i]

print l

```