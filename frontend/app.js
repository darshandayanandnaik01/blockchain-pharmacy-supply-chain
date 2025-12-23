let web3;
let account;
let contract;

// 🔐 Replace after deploying contract locally
const CONTRACT_ADDRESS = "PASTE_CONTRACT_ADDRESS_HERE";
const ABI = [ /* PASTE ABI FROM REMIX HERE */ ];

const STATE_NAMES = [
  "CreatedBySupplier",
  "InTransitToManufacturer",
  "WithManufacturer",
  "InTransitToDistributor",
  "WithDistributor",
  "InTransitToPharmacy",
  "AtPharmacy",
  "Sold"
];

async function connectWallet() {
  if (!window.ethereum) {
    alert("MetaMask not installed");
    return;
  }

  const accounts = await window.ethereum.request({
    method: "eth_requestAccounts"
  });

  account = accounts[0];
  web3 = new Web3(window.ethereum);
  contract = new web3.eth.Contract(ABI, CONTRACT_ADDRESS);

  document.getElementById("walletLabel").innerText = account;
}
