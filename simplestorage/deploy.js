const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();
async function main() {
    try {
        const provider = new ethers.providers.JsonRpcProvider(
            process.env.RPC_URL //Ganache RPC
        );
        const wallet = new ethers.Wallet(
            process.env.PRIVATE_KEY, //One account private from ganache
            provider
        );
        // const encryptedJson = fs.readFileSync("./.encryptedKey.json", "utf8");
        // const walletFromJson = new ethers.Wallet.fromEncryptedJsonSync(
        //     encryptedJson,
        //     process.env.PRIVATE_KEY_PASSWORD
        // );
        // const wallet = await walletFromJson.connect(provider);

        const abi = fs.readFileSync(
            "./SimpleStorage_sol_SimpleStorage.abi",
            "utf8"
        );
        const binary = fs.readFileSync(
            "./SimpleStorage_sol_SimpleStorage.bin",
            "utf8"
        );
        const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
        const contract = await contractFactory.deploy();

        //Get transaction receipts
        // console.log("This is transaction receipt");
        const contractTransactionReceipt =
            await contract.deployTransaction.wait(1); // 1 is one block confirmation before getting the receipt
        console.log(`Contract Address: ${contract.address}`);

        //Interracting with the deployed contract
        const currentFavoriteNumber = await contract.retrieve();
        console.log(
            `Current favourite Number: ${currentFavoriteNumber.toString()}`
        );
        const transactionResponse = await contract.store("7");
        const transactionReceipt = await transactionResponse.wait(1);
        const updatedFavoriteNumber = await contract.retrieve();
        console.log(
            `Updated favourite Number: ${updatedFavoriteNumber.toString()}`
        );
    } catch (error) {
        console.log(error);
    }
}

main();
