import dotenv from "dotenv"
dotenv.config()
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

function privateKey() {
  return process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : []
}

console.log({env: privateKey()})

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  ignition: {
    blockPollingInterval: 1_000,
  },
  networks: {
    hardhat: {},
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/sVwldSQ77KuuOepviwhyCCh8YTjUGyyI`,
      accounts: privateKey(),
      gasMultiplier: 1.2,
    }
  }
};

export default config;
