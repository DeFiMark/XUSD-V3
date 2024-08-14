//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
    PROMISE USD - Promisary Note for Cross Chain XUSD Swaps

    Main functionality:
        - store USDC
        - release USDC form XUSD, but mint pUSD tokens into XUSD to maintain value
        - release USDC from self
        - pay back USDC into XUSD, burn pUSD tokens to maintain XUSD value


    Transaction Flow:

        Deposit USDC:
            - if PUSD has a balance in XUSD, use USDC to pay that balance back
            - else, release USDC from XUSD, minting PUSD tokens into XUSD to maintain value
            - then, send cross chain message to XUSD on other chain, telling to to `Release`

        Release:
            - if PUSD has USDC stored, release it
            - else release USDC from XUSD, minting PUSD tokens into XUSD to maintain value
 */
contract PUSD {
    
}