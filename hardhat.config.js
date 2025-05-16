require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.18",
  networks: {
    goerli: {
      url: "https://goerli.infura.io/v3/YOUR_INFURA_PROJECT_ID", // Replace this with your Infura URL
      accounts: ["0xYOUR_PRIVATE_KEY"], // Replace with your wallet private key
    },
  },
};
