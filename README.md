# freeCodeCamp

本仓库存储freecodecamp课程的智能合约，合约内容均为跟随课程手写。

### 一、SimpleStorage contract

- 将其他的智能合约导入
- 与其他只能合约进行交互
- 使用继承，重写合约方法，给与智能合约新的特性

### 二、FundMe contract

##### 合约功能

实现一个基金合约，任何人都可以向该合约中发送以太坊，只有部署的人才能取出合约中所有的以太坊。合约规定至少要发送现价价值50美元以上的以太坊。

##### 实现环境

测试网：Goerli

合约地址：0x975fE4afCFbbCBd5fFE72FA0e47203f93eEC096a

ABI：可根据仓库中FundMe.sol生成

##### 功能特点

- 使用chainlink以去中心化的方式获取实时以太坊价格
- 合约中使用library的方式简化合约中的代码
