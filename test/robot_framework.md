# Robot Framework




## 变量
### 定义变量
Syntax for variable definition is quite simple, as seen in this variable table:

```
*** Variables ***
${USERNAME}               janedoe
${PASSWORD}               J4n3D0e
${NEW PASSWORD}           e0D3n4J1. . 
${DATABASE FILE}          ${TEMPDIR}${/}robotframework-quickstart-db.txt
${PWD INVALID LENGTH}     Password must be 7-12 characters long
${PWD INVALID CONTENT}    Password must be a combination of lowercase and uppercase letters and numbers


```


Variables can also be given from the command line which is useful if the tests need to be executed in different environments.

```
robot --variable USERNAME:johndoe --variable PASSWORD:J0hnD0e QuickStart.rst

```


Robot Framework has its own variables that can be used as scalars, lists or dictionaries using syntax 
```${SCALAR}, @{LIST} and &{DICT}```, respectively. In addition to this, environment variables can be used directly with syntax %{ENV_VAR}.



### Setting variables in command line
```
--variable EXAMPLE:value
--variable HOST:localhost:7272 --variable USER:robot
--variable ESCAPED:Qquotes_and_spacesQ --escape quot:Q --escape space:_
```



## Organizing test cases

测试用例的组织层次结构如下:
1. 在测试用例文件(test case file)中建立测试用例2. 一个测试文件自动的建成一个包含了这些测试用例的测试集(test suite)3. 一个包含多个测试用例文件(test case file)的目录构成更高级的测试集，即这个测试集目录包含多个子测试集，而子测试集即是由测试文件创建而来。4. 一个测试集目录可以包 其他测试集目录，这种层次结构可以满足层嵌套的需要5. 测试集目录可以有一个特殊的初始文件(initialization file) 

此外，还有:
1. 测试库(Test libraries)包含最低级的关键字(keywords)2. 资源文件(Resource files)包含变量和更高层次的用户自定义关键字   
3. 变量文件(Variable files)可以提供比资源文件更灵活的方式创建变量

### Initialization files
A test suite created from a directory can have similar settings as a suite created from a test case file. Because a directory alone cannot have that kind of information, it must be placed into a special test suite initialization file. An initialization file name must always be of the format \__init__.ext, where the extension must be one of the supported file formats (for example, __init__.robot or __init__.html). The name format is borrowed from Python, where files named in this manner denote that a directory is a module.

Initialization files have the same structure and syntax as test case files, except that they cannot have test case tables and not all settings are supported. Variables and keywords created or imported in initialization files are not available in the lower level test suites. If you need to share variables or keywords, you can put them into resource files that can be imported both by initialization and test case files.

The main usage for initialization files is specifying test suite related settings similarly as in test case files, but setting some test case related settings is also possible. 

```
*** Settings ***
Documentation    Example suite
Suite Setup      Do Something    ${MESSAGE}
Force Tags       example
Library          SomeLibrary

*** Variables ***
${MESSAGE}       Hello, world!

*** Keywords ***
Do Something
    [Arguments]    ${args}
    Some Keyword    ${arg}
    Another Keyword

```
### Setups and teardowns

1. Test Setup
2. Test Teardown
3. Suite Setup
4. Suite Teardown

### Using tags
1. Force Tags
2. Default Tags
3. [Tags]


