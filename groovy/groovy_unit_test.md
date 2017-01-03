# Unit Testing and Mocking

### Stubs vs. Mocks    A stub stands in for a real object. It simply reciprocates the coached expected response when the code being tested calls it. The response is set up to satisfy the needs for the test to pass. A mock object does a lot more than a stub. It helps us ensure our code is interacting with its dependencies, the collaborators, as expected. It can keep track of the sequence and number of calls our code makes on the collaborator it stands in for. It ensures proper parameters are passed in to method calls. Whereas stubs verify state, mocks verify behavior. When we use a mock in our test, it verifies not only the state, but also the behavior of our code’s interaction with its dependen- cies.a


### Mocking Using Categories


```
import com.agiledeveloper.CodeWithHeavierDependenciesclass TestUsingCategories extends GroovyTestCase { void testMyMethod() {def testObj = new CodeWithHeavierDependencies() use(MockHelper) {            testObj.myMethod()            assertEquals 35, MockHelper.result          }} }
class MockHelper { def static resultdef static println(self, text) { result = text }def static someAction(CodeWithHeavierDependencies self) { 25 }Mocking Using Categories • 283 }

```

### Mocking Using ExpandoMetaClass

```

class TestUsingExpandoMetaClass extends GroovyTestCase {


void testMyMethod() {	def result	def emc = new ExpandoMetaClass(CodeWithHeavierDependencies, true) 
	emc.println = { text -> result = text }	emc.someAction = { -> 25 }	emc.initialize()	def testObj = new CodeWithHeavierDependencies()
	testObj.metaClass = emc   testObj.myMethod()   assertEquals 35, result```
### Mocking Using Map
```
class TestUsingMap extends GroovyTestCase { void testMethodA() {def text = ''def fileMock = [write : { text = it }]def testObj = new ClassWithDependency() testObj.methodA(1, fileMock)assertEquals "The value is 1.", text }}
```


### Mocking Using the Groovy Mock Library
#### Using StubFor
```
import com.agiledeveloper.ClassWithDependencyclass TestUsingStubFor extends GroovyTestCase {	void testMethodB() {	 def testObj = new ClassWithDependency() -	 def fileMock = new groovy.mock.interceptor.StubFor(java.io.FileWriter)	 def text
	 fileMock.demand.write { text = it.toString() }	 fileMock.demand.close {} -    fileMock.use {   } 	testObj.methodB(1)	assertEquals "The value is 1.", text -}}
```


#### Using MockFor


```
class TwoFileUserTest extends GroovyTestCase { 
	void testUseFiles() {		def testObj = new TwoFileUser()		def testData = 'Multi Files'		def fileMock = new groovy.mock.interceptor.MockFor(java.io.FileWriter) 
		fileMock.demand.write() 	{ assertEquals testData, it } 
		fileMock.demand.write() { assertEquals testData.size(), it }
		fileMock.demand.close(2..2) {}		fileMock.use {    	  	testObj.useFiles(testData)	    }	}

	void tearDown() {		new File('output1.txt').delete() new File('output2.txt').delete()	}



```