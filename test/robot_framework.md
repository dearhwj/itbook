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

### Test suite
1. Test cases are created in test case files。
1. A test case file automatically creates a test suite containing the test cases in that file.
1. A directory containing test case files forms a higher-level test suite. Such a test suite directory has suites created from test case files as its sub test suites.
1. A test suite directory can also contain other test suite directories, and this hierarchical structure can be as deeply nested as needed.
2. Test suite directories can have a special initialization file.

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


