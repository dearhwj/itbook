# Python Dict

*** 删除Key-Value***
```

alien_0 = {'color': 'green', 'points': 5}
print(alien_0)
del alien_0['points']
print(alien_0)

```



*** 遍历Dict***

```
遍历key/value对
user_username = {
	'0': 'efermi',
	'first': 'enrico',
	'last': 'fermi',
}
for key, value in user_0.items():
	print("\nKey: " + key)
	print("Value: " + value)


遍历key
for name in favorite_languages.keys():
	print(name.title())

排序遍历key
for name in sorted(favorite_languages.keys()):
	print(name.title())



遍历value

for language in favorite_languages.values():
	print(language.title())
```