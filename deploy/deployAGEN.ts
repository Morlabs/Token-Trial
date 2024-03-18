const {ethers, upgrades} = require('hardhat')

async function main() {
    const ONE_GWEI = ethers.BigNumber.from('1000000000')
    const AgenContract = await ethers.getContractFactory("AGEN")
}