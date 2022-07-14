const ethers = require("ethers");
const fs = require("fs-extra");

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(
    "http://127.0.0.1:7545" //Ganache RPC
  );
  const wallet = new ethers.Wallet(
    "78292689791e5295800f700ed006c624e1cca11a61bbb2af03262de71a415e26", //One account private from ganache
    provider
  );
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  const contract = await contractFactory.deploy();

  //Get transaction receipts
  console.log("This is transaction receipt");
  const transactionReceipt = await contract.deployTransaction.wait(1); // 1 is one block confirmation before getting the receipt
  console.log(transactionReceipt);
  console.log("This is deployment transaction or transaction response");
  console.log(contract.deployTransaction);
}

main();
