async function main() {
  const DataSharingFactory = await ethers.getContractFactory("DataSharing");
  const GrantManagementFactory = await ethers.getContractFactory("GrantManagement");

  const dataSharing = await DataSharingFactory.deploy({
    gasLimit: 3000000 // Adjust this value as needed
  });
  console.log("DataSharing deployed to:", dataSharing.address);

  const grantManagement = await GrantManagementFactory.deploy(
    dataSharing.address
  );
  console.log("GrantManagement deployed to:", grantManagement.address);
}

main().catch((error) => {
  console.error("Error during deployment:", error);
  process.exitCode = 1;
});
