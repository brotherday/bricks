// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BricksCore.sol";
import "../src/transparent_proxy/TransparentUpgradeableProxy.sol";
import "../src/transparent_proxy/ProxyAdmin.sol";
import "../src/Pool.sol";

contract BricksCoreScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        BricksCore bricksCore = new BricksCore();
        ProxyAdmin proxyAdmin = new ProxyAdmin();
        TransparentUpgradeableProxy transparentUpgradeableProxy = new TransparentUpgradeableProxy(
            address(bricksCore),
            address(proxyAdmin),
            abi.encodeWithSignature("intialize()")
        );

        Pool pool = new Pool(address(transparentUpgradeableProxy));

        vm.stopBroadcast();
    }
}
