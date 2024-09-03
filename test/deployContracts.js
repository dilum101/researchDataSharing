async function main() {
  const DataSharingFactory = await ethers.getContractFactory("DataSharing");
  const GrantManagementFactory = await ethers.getContractFactory(
    "GrantManagement"
  );

  const dataSharing = await DataSharingFactory.deploy();
  console.log(
    "DataSharing deployment transaction sent, waiting for confirmation..."
  );

  await dataSharing.deployTransaction.wait();
  console.log("DataSharing deployed to:", dataSharing.address);

  const grantManagement = await GrantManagementFactory.deploy(
    dataSharing.address
  );
  console.log(
    "GrantManagement deployment transaction sent, waiting for confirmation..."
  );

  await grantManagement.deployTransaction.wait();
  console.log("GrantManagement deployed to:", grantManagement.address);
}

main().catch((error) => {
  console.error("Error during deployment:", error);
  process.exitCode = 1;
});
