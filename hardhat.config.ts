import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.6.11",
      },
      {
        version: "0.8.9",
        settings: {},
      },
    ],
  },
  networks: {
    'truffle-dashboard': {
      url: "http://localhost:24012/rpc"
    },
  },
};

export default config;
