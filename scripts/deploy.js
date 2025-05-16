async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contract with account:", deployer.address);

  const ContextumPlatform = await ethers.getContractFactory("ContextumPlatform");
  const contextum = await ContextumPlatform.deploy();

  await contextum.deployed();

  console.log("ContextumPlatform deployed to:", contextum.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
