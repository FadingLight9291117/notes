function Person(name){
	this.name = name;
	this.foo = function(){
		console.log("Hello"+this.name);
	}
}
var a = eval("421");
console.log(a);