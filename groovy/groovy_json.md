# Groovy操作JSON

[Groovy JSON Module](http://www.groovy-lang.org/json.html)

	JsonSlurper is a class that parses JSON text or reader content into Groovy data structures (objects) such as maps, lists and primitive types like Integer, Double, Boolean and String.

	JsonOutput is responsible for serialising Groovy objects into JSON strings. It can be seen as companion object to JsonSlurper, being a JSON parser.

[groovy 操作json]("http://berdy.iteye.com/blog/1182590")

```
def builder = new JsonBuilder()  
//如同构建对象般  
builder.pepole{  
    person {  
        firstName 'leng'  
        lastName 'feng'  
        //传入map  
        address(  
                city: 'Shanghai',  
                country: 'China',  
                zip: 12345,  
                )  
        married true  
        //传如list  
        conferences 'JavaOne', 'Gr8conf'  
    }  
}  
//以树形结构输出  
println JsonOutput.prettyPrint(builder.toString())  
  
  
String json = """  
{  
    "pepole": {  
        "person": {  
            "firstName": "leng",  
            "lastName": "feng",  
            "address": {  
                "city": "Shanghai",  
                "country": "China",  
                "zip": 12345  
            },  
            "married": true,  
            "conferences": [  
                "JavaOne",  
                "Gr8conf"  
            ]  
        }  
    }  
}  
"""  
//类似XmlSlurper  
def root = new JsonSlurper().parseText(json)  
assert root instanceof Map  
assert root.person.conferences instanceof List  
assert root.person.firtsName == 'leng'  
assert root.person.conferences[1] == 'Gr8conf'
``` 