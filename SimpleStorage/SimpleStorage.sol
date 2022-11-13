// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract SimpleStorage{
//uint type
uint256   favoriteNumber;
//创建一个结构体变量
//People public person =People({favoriteNumber:23,name:"wstar"});

//声明一个mapping
mapping(string => uint256) public nameToNumber; 

//声明一个数组
People[] public people;
//结构体的声明
struct People{
uint256 favoriteNumber;//index=0
string name;//index = 1
}
//定义一个存储函数
function store(uint256 _favorityNumber) public virtual {
	favoriteNumber = _favorityNumber;
}
//view
function retrieve() public view  returns(uint256){
	return favoriteNumber;
}
//pure
function add() public pure returns(uint256){
return (20+3);
}
//数组的push方法,mapping的添加方法
function addPeople(string memory _name,uint256 _favorityNumber) public {
	people.push(People(_favorityNumber,_name));
	nameToNumber[_name] = _favorityNumber;
}
} 
