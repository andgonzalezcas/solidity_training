const AndToken = artifacts.require('andToken.sol')
const AndNFT = artifacts.require('andNFT.sol')

module.exports = async function (deployer) {
  await deployer.deploy(AndToken)
  await deployer.deploy(AndNFT, AndToken.address, 1)
}