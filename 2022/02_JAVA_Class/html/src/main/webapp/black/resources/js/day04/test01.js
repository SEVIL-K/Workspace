var obj1 = {
	name: 'Nobody',
	age: 0
};

console.log(obj1.name + ' : ' + obj1['age']);

var obj2 = obj1;

obj1.name = 'jennie';

console.log('obj1.name : ' + obj1.name);
console.log('obj2.name : ' + obj2.name);

class Member {
	constructor(name, age){
		this.name = name;
		this.age = age;
	}
}

var memb1 = new Member('제니', 27);
var memb2 = new Member('리사', 27);

console.log('memb1.name : ' + memb1.name);
console.log('memb2.name : ' + memb2.name);

memb1.groupName = 'Black Pink';

// 출력
console.log('memb1.groupName : ' + memb1.groupName);
console.log('memb2.groupName : ' + memb2.groupName);
//memb2.groupName = 'Black Pink';

Member.prototype.groupName = 'Black Pink';
// 출력
console.log('memb1.groupName : ' + memb1.groupName);
console.log('memb2.groupName : ' + memb2.groupName);

memb2.groupName = '블랙핑크';
// 출력
console.log('memb1.groupName : ' + memb1.groupName);
console.log('memb2.groupName : ' + memb2.groupName);

Member.prototype.groupName = '블랙핑크';
// 출력
console.log('memb1.groupName : ' + memb1.groupName);
console.log('memb2.groupName : ' + memb2.groupName);