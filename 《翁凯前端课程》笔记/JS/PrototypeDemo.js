// JS类原型属性用法,类似与static
function Person() {
	Person.prototype.name = "CLZ";
	Person.prototype.gender = "man";
	Person.prototype.age = 30;
}
let person1 = new Person();
console.log(person1.name);
let person2 = new Person();
person2.name = "车厘子";
console.log(person2.name);
console.log(person1.name); 