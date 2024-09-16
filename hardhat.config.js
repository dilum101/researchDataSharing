// Import the necessary Hardhat tools
require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.0",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      gas: 12000000,
      gasPrice: 20000000000,
      blockGasLimit: 0x1fffffffffffff, // High block gas limit
      allowUnlimitedContractSize: true,
    },

    sepolia: {
      url: 'https://eth-sepolia.g.alchemy.com/v2/KAVeQ1V8UkE6JlDQgFkY17g-8c5V-dXe',
      accounts: ["6a817a06dfe9d05bac826daf7f7d921484491a683b327ad4815f477ea05356c6"],
      gasPrice: 10000000000,
    },
  },
};
