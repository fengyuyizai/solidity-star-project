### contract txhash
0x0484694c6df1135871e50dfa8d59542c79a855906699954618eb1450f501fb39
### contract address
0x56e7a06cff4c912775f13033d1c87342be50b89d

###  putStarUpForSale txhash
0x1f77a070824dd11632a7c405360e8b5c52bb85e306cffdc8d078a5554ef0eff1


### createStar txhash
0x6c3c43842972a80f9fcdc7c392e98b66a8c28ed8b91ab9fad0b23165781d31ae

### transactionHash
0x355b708809f7d7365d1a69dd688373e736a1c763d532b2843b502daf94a40b37



### I have a question, please answer the teacher.

1. I uploaded the contract to rinkeby test network, but I did not pass it when I initialized web3
```
New Web3 (Web3 currentProvider)
```
Get, but through
```
New Web3 (new Web3. Will. HttpProvider (" http://localhost:8545 "));
```
But the latter address cannot be used in rinkeby because the ganache-cli wallet is empty in rinkeby, so it cannot be tested directly, so I want to know about the correct rinkeby test process
Under github, I found someone who wrote it
```
Web3 = new web3 (new web3. Will. HttpProvider (" https://rinkeby.infura.io/v3/9f1fb598e3424075854ee430b1b69a7e "));
```
However, when I changed my address to mine, I found that I could not get the wallet address, so I could not test it, so I want to know if this is correct.What should I do if I'm right

You have answered this question， Please see the next question


### My running process

I still can't get the web3 injected by metaMask, so I can only provide the putStarUpForSale provided by ganache-cli, the address of createStar. I just click index.html directly, there is no service. Is the running method like this?

If not, please indicate the method