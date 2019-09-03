module.exports = {
  rpc: {
    host:"localhost",
    port:8543
  },
  networks: {
    development: {
      host: "localhost", //our network is running on localhost
      port: 8543, // port where your blockchain is running
      network_id: "*",
      from: "0x1d0bf2a87c5f83d53910db81730a343c09f3a3d5", // use the account-id generated during the setup process
      gas: "0x888888888"
    }
  }
};