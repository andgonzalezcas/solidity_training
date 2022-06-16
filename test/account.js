const Account = artifacts.require('Account.sol')

contract('Account', () => {
  it('Should Deposit', async () => {
    const account = await Account.new()
    await account.deposit(50);
    const data = await account.getBalance()
    assert(data.toString() === '50')
  }) 
})