//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    )
        external
        payable
        returns (uint amountToken, uint amountETH, uint liquidity);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountToken, uint amountETH);

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapExactETHForTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    function swapTokensForExactETH(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapExactTokensForETH(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapETHForExactTokens(
        uint amountOut,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    function quote(
        uint amountA,
        uint reserveA,
        uint reserveB
    ) external pure returns (uint amountB);

    function getAmountOut(
        uint amountIn,
        uint reserveIn,
        uint reserveOut
    ) external pure returns (uint amountOut);

    function getAmountIn(
        uint amountOut,
        uint reserveIn,
        uint reserveOut
    ) external pure returns (uint amountIn);

    function getAmountsOut(
        uint amountIn,
        address[] calldata path
    ) external view returns (uint[] memory amounts);

    function getAmountsIn(
        uint amountOut,
        address[] calldata path
    ) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair);

    function allPairs(uint) external view returns (address pair);

    function allPairsLength() external view returns (uint);

    function createPair(
        address tokenA,
        address tokenB
    ) external returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function symbol() external view returns (string memory);

    function name() external view returns (string memory);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Returns the number of decimal places
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

abstract contract ReentrancyGuard {
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;
    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }
}

/**
 * @title Owner
 * @dev Set & change owner
 */
contract Ownable {
    address private owner;

    // event for EVM logging
    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    // modifier to check if caller is owner
    modifier onlyOwner() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        // This used to consume all gas in old EVM versions, but not anymore.
        // It is often a good idea to use 'require' to check if functions are called correctly.
        // As a second argument, you can also provide an explanation about what went wrong.
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    /**
     * @dev Set contract deployer as owner
     */
    constructor() {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);
    }

    /**
     * @dev Change owner
     * @param newOwner address of new owner
     */
    function changeOwner(address newOwner) public onlyOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    /**
     * @dev Return owner address
     * @return address of owner
     */
    function getOwner() external view returns (address) {
        return owner;
    }
}

interface IFlashLoanReceiver {
    function executeOperation(
        address _token,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    ) external returns (bool);
}

interface IPromiseUSD {
    function mint(uint256 amount) external;
}

/**
 *  Contract: XUSD V3
 *  Appreciating Stable Coin Inheriting The IP Of XUSD by xSurge
 *  Improved the mint function to appropriately handle the mint fee
 *  Made XUSD a single-asset token, disabling the stable swap but improving security
 *  PromiseUSD will enable XUSD to be multi-chain, allowing for cross-chain lending, earning a fee each time this operation passes
 *  This will play very closely with products being developed that will use XUSD on all chains as its primary liquidity source
 */
contract XUSD is IERC20, Ownable, ReentrancyGuard {

    // token data
    string private constant _name = "XUSD";
    string private constant _symbol = "XUSD";
    uint8 private constant _decimals = 18;
    uint256 private constant precision = 10**18;

    // 0 initial supply
    uint256 private _totalSupply;

    // balances
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    // address -> Fee Exemption
    mapping(address => bool) public isTransferFeeExempt;

    // Token Activation
    bool public tokenActivated;

    // Underlying Asset Is Underlying
    IERC20 public constant underlying = IERC20(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d);

    // Fees
    uint256 public mintFee     = 98000;  // 2% mint fee
    uint256 public sellFee     = 99000;  // 1% redeem fee
    uint256 public transferFee = 99750;  // 0.25% transfer fee
    uint256 private constant feeDenominator = 10 ** 5;

    // Flash Loan Provider
    bool public flashLoanOn;
    uint256 public flashLoanFee = 15;

    // Fee Recipient
    address public feeTo;
    uint256 public feePercentageForFeeTo = 20;

    // Price Data Tracking
    uint256[] public allPrices;
    uint256[] public allPriceTimestamps;

    // DEAD AND ZERO ADDRESSES
    address public constant DEAD = 0x000000000000000000000000000000000000dEaD;
    address public constant ZERO = 0x0000000000000000000000000000000000000000;

    // Lending Token
    address public PROMISE_USD;
    bool public lockPromiseUSD;

    // initialize some stuff
    constructor(address feeTo_) {
        require(goodAddress(feeTo_) == true, "Invalid Address!");

        // set fee recipient setter
        feeTo = feeTo_;

        // exempt deployer and fee setter
        isTransferFeeExempt[msg.sender] = true;
        isTransferFeeExempt[feeTo_] = true;

        // let token show on etherscan
        emit Transfer(address(0), msg.sender, 0);
    }

    /** Returns the total number of tokens in existence */
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    /** Returns the number of tokens owned by `account` */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /** Returns the number of tokens `spender` can transfer from `holder` */
    function allowance(
        address holder,
        address spender
    ) external view override returns (uint256) {
        return _allowances[holder][spender];
    }

    /** Token Name */
    function name() public pure override returns (string memory) {
        return _name;
    }

    /** Token Ticker Symbol */
    function symbol() public pure override returns (string memory) {
        return _symbol;
    }

    /** Tokens decimals */
    function decimals() public pure override returns (uint8) {
        return _decimals;
    }

    /** Approves `spender` to transfer `amount` tokens from caller */
    function approve(
        address spender,
        uint256 amount
    ) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    /** Transfer Function */
    function transfer(
        address recipient,
        uint256 amount
    ) external override nonReentrant returns (bool) {
        return _transferFrom(msg.sender, recipient, amount);    
    }

    /** Transfer Function */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override nonReentrant returns (bool) {
        require(
            _allowances[sender][msg.sender] >= amount,
            "Insufficient Allowance"
        );
        _allowances[sender][msg.sender] -= amount;
        return _transferFrom(sender, recipient, amount);
    }

    /** Internal Transfer */
    function _transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {
        // make standard checks
        require(
            recipient != address(0) && sender != address(0),
            "Transfer To Zero"
        );
        require(
            amount > 0, 
            "Transfer Amt Zero"
        );
        require(
            _balances[sender] >= amount,
            "Insufficient Balance"
        );

        // track price change
        uint256 oldPrice = _calculatePrice();

        // amount to give recipient
        uint256 tAmount = (isTransferFeeExempt[sender] || isTransferFeeExempt[recipient])
            ? amount
            : amount * transferFee / feeDenominator;

        // tax taken from transfer
        uint256 tax = amount - tAmount;

        // subtract from sender
        _balances[sender] -= amount;

        // give reduced amount to receiver
        _balances[recipient] += tAmount;

        // burn the tax
        if (tax > 0) {
            // Take Fee
            _takeFee(tax);
            _totalSupply -= tax;
            emit Transfer(sender, address(0), tax);
        }

        // require price rises
        _requirePriceRises(oldPrice);

        // Transfer Event
        emit Transfer(sender, recipient, tAmount);
        return true;
    }

    /** 
        Mint XUSD Tokens For `recipient` By Depositing `underlying` Into The Contract
            Requirements:
                Approval from the `underlying` token prior to purchase
        
        @param numTokens number of underlying tokens to mint XUSD with
        @param recipient Account to receive minted XUSD tokens
        @return tokensMinted number of XUSD tokens minted
    */
    function mintWithBacking(
        uint256 numTokens,
        address recipient
    ) external nonReentrant returns (uint256) {
        _checkGarbageCollector();
        return _mintWithBacking(numTokens, recipient);
    }

    /** 
        Burns Sender's XUSD Tokens and redeems their value in underlying
        @param tokenAmount Number of Tokens To Redeem, Must be greater than 0
    */
    function redeem(uint256 tokenAmount) external nonReentrant returns (uint256) {
        return _sell(tokenAmount, msg.sender);
    }

    /** 
        Burns Sender's XUSD Tokens and redeems their value in `underlying` for `recipient`
        @param tokenAmount Number of XUSD Tokens To Redeem, Must be greater than 0
        @param recipient Recipient Of underlying token transfer, Must not be address(0)
    */
    function redeemTo(
        uint256 tokenAmount,
        address recipient
    ) external nonReentrant returns (uint256) {
        return _sell(tokenAmount, recipient);
    }

    /** 
        Allows A User To Erase Their Holdings From Supply 
        DOES NOT REDEEM UNDERLYING ASSET FOR USER
        @param amount Number of XUSD Tokens To Burn
    */
    function burn(uint256 amount) external nonReentrant {
        // get balance of caller
        uint256 bal = _balances[msg.sender];
        require(bal >= amount && bal > 0, "Zero Holdings");
        // Track Change In Price
        uint256 oldPrice = _calculatePrice();
        // take fee
        _takeFee(amount);
        // burn tokens from sender + supply
        _burn(msg.sender, amount);
        // require price rises
        _requirePriceRises(oldPrice);
        // Emit Call
        emit Burn(msg.sender, amount);
    }

    /**
        Logs a donation (price increase)
     */
    function donate(uint256 amount) external nonReentrant {
        
        // Track Change In Price
        uint256 oldPrice = _calculatePrice();
        
        // Transfer in donation
        _transferIn(amount);

        // require price rises
        _requirePriceRises(oldPrice);
    }

    // Flashloan function
    function flashLoan(
        address _receiver,
        uint256 _amount,
        bytes calldata _params
    ) external nonReentrant {
        require(
            flashLoanOn && _receiver != address(0),
            "Flash Loan Not Enabled"
        );
        // Ensure the receiver is a contract.
        uint32 size;
        assembly {
            size := extcodesize(_receiver)
        }
        require(size > 0, "Receiver must be a contract");

        // Pre-requisites
        uint256 initialBalance = underlying.balanceOf(address(this));
        require(_amount <= initialBalance, "Not enough liquidity");

        // Price before loan
        uint256 oldPrice = _calculatePrice();

        uint256 fee = ( _amount * flashLoanFee ) / 10000;

        require(underlying.transfer(_receiver, _amount), "Transfer failed");

        require(
            IFlashLoanReceiver(_receiver).executeOperation(
                address(underlying),
                _amount,
                fee,
                _params
            ),
            "Callback failed"
        );

        require(
            underlying.balanceOf(address(this)) >= initialBalance + fee,
            "Insufficient repayment"
        );

        // Require price rises
        _requirePriceRises(oldPrice);

        emit FlashLoan(_receiver, address(underlying), _amount, fee);
    }

    /**
        Triggerable Only By PromisaryToken Contract
        Temporarily Sells XUSD Tax Free and holds XUSD in escrow
        Until Stable Amount Is Returned
        It is up to implementing contracts to ensure XUSD profits from this trade off

        @param amount number of USDC to borrow
        @return amountDelivered number of `stable` tokens returned to PROMISE_USD
     */
    function promise(uint256 amount) external nonReentrant returns (uint256) {
        require(msg.sender == PROMISE_USD, 'Only Promise');
        require(PROMISE_USD != address(0), 'Invalid Promise Address');

        // log old price
        uint256 oldPrice = _calculatePrice();

        // ensure we can deliver on `amount`
        require(
            amount > 0 &&
            amount <= underlying.balanceOf(address(this)),
            'Invalid Amount'
        );

        // send Tokens to Seller
        bool successful = underlying.transfer(PROMISE_USD, amount);
        require(successful, 'Transfer Failure');

        // Trigger Ghost Token Creation
        IPromiseUSD(PROMISE_USD).mint(amount);

        // require price rises
        require(
            _calculatePrice() >= oldPrice,
            'Price Must Rise'
        );

        // emit ghost event
        emit PromiseTokens(amount, amount);

        // return amount that was sent
        return amount;
    }

    ///////////////////////////////////
    //////  INTERNAL FUNCTIONS  ///////
    ///////////////////////////////////

    /** Stake Tokens and Deposits XUSD in Sender's Address, Must Have Prior Approval For Underlying */
    function _mintWithBacking(
        uint256 numUnderlying,
        address recipient
    ) internal returns (uint256) {
        require(
            tokenActivated || msg.sender == this.getOwner(),
            "Token Not Activated"
        );

        // calculate price change
        uint256 oldPrice = _calculatePrice();

        // previous backing
        uint256 previousBacking = underlying.balanceOf(address(this));

        // transfer in token
        uint256 received = _transferIn(numUnderlying);

        // if this is the first purchase, use new amount
        uint256 relevantBacking = previousBacking == 0
            ? underlying.balanceOf(address(this))
            : previousBacking;

        // Handle Minting
        return _mintTo(recipient, received, relevantBacking, oldPrice);
    }

    /** Burns XUSD Tokens And Deposits Underlying Tokens into Recipients's Address */
    function _sell(
        uint256 tokenAmount,
        address recipient
    ) internal returns (uint256) {
        // seller of tokens
        address seller = msg.sender;

        require(
            tokenAmount > 0 && _balances[seller] >= tokenAmount,
            "Insufficient Balance"
        );
        require(recipient != address(0), "Invalid Recipient");

        // calculate price change
        uint256 oldPrice = _calculatePrice();

        // tokens post fee to swap for underlying asset
        uint256 tokensToSwap = isTransferFeeExempt[seller]
            ? tokenAmount - 10
            : ( tokenAmount * sellFee ) / feeDenominator;

        // value of taxed tokens
        uint256 amountUnderlyingAsset = amountOut(tokensToSwap);

        // Take Fee
        if (!isTransferFeeExempt[msg.sender]) {
            uint fee = tokenAmount - tokensToSwap;
            _takeFee(fee);
        }

        // burn from sender + supply
        _burn(seller, tokenAmount);

        // send Tokens to Seller
        require(
            underlying.transfer(recipient, amountUnderlyingAsset),
            "Underlying Transfer Failure"
        );

        // require price rises
        _requirePriceRises(oldPrice);

        // Differentiate Sell
        emit Redeemed(seller, tokenAmount, amountUnderlyingAsset);

        // return token redeemed and amount underlying
        return amountUnderlyingAsset;
    }

    /** Handles Minting Logic To Create New XUSD */
    function _mintTo(
        address recipient,
        uint256 received,
        uint256 totalBacking,
        uint256 oldPrice
    ) internal returns (uint256) {

        // tokens to mint
        uint256 nTokensToMint = tokensToMint(received, totalBacking);

        // tokens to mint with no tax
        uint256 nTokensToMintNoTax = ( _totalSupply * received ) / totalBacking;

        // whether fee was applied or not
        bool hasFee = !isTransferFeeExempt[msg.sender] && _totalSupply > 0;

        // ensure there are tokens to mint
        require(nTokensToMint > 0, "Zero Amount To Mint");

        // mint to Buyer
        _mint(recipient, nTokensToMint);

        // apply fee to tax taken
        if (hasFee && nTokensToMintNoTax > nTokensToMint) {
            _takeFee(nTokensToMintNoTax - nTokensToMint);
        }

        // require price rises
        _requirePriceRises(oldPrice);

        // differentiate purchase
        emit Minted(recipient, nTokensToMint);
        return nTokensToMint;
    }

    /** Takes Fee */
    function _takeFee(uint mFee) internal {
        // send percentage to fee recipient
        uint256 fee = ( mFee * feePercentageForFeeTo ) / 100;

        if (fee > 0) {
            unchecked {
                _balances[feeTo] += fee;
                _totalSupply += fee;
            }
            emit Transfer(address(0), feeTo, fee);
        }
    }

    /** Swaps to underlying, must get at least `minOut` back from swap to be successful */
    function _purchaseUnderlying(uint256 minOut) internal returns (uint256) {
        // previous amount of Tokens before we received any
        uint256 prevTokenAmount = underlying.balanceOf(address(this));

        // swap BNB For stable of choice
        router.swapExactETHForTokens{value: address(this).balance}(
            minOut,
            path,
            address(this),
            block.timestamp + 300
        );

        // amount after swap
        uint256 currentTokenAmount = underlying.balanceOf(address(this));
        require(
            currentTokenAmount > prevTokenAmount,
            "Zero Underlying Received"
        );
        return currentTokenAmount - prevTokenAmount;
    }

    /** Requires The Price Of XUSD To Rise For The Transaction To Conclude */
    function _requirePriceRises(uint256 oldPrice) internal {
        // Calculate Price After Transaction
        uint256 newPrice = _calculatePrice();
        // Require Current Price >= Last Price
        require(newPrice >= oldPrice, "Price Cannot Fall");
        // Emit The Price Change
        emit PriceChange(oldPrice, newPrice, _totalSupply);
        // Log The New Price
        allPrices.push(newPrice);
        // Log The Time Of The New Price
        allPriceTimestamps.push(block.timestamp);
    }

    /** 
        Transfers `amount` of `token` in, verifies the transaction success, returns the amount received
        Also accounts for potential tx fees as it notes the contract balance before and after swap 
    */
    function _transferIn(
        uint256 amount
    ) internal returns (uint256) {
        require(
            underlying.balanceOf(msg.sender) >= amount,
            "Insufficient Balance"
        );
        require(
            underlying.allowance(msg.sender, address(this)) >= amount,
            "Insufficient Allowance"
        );

        // get underlying balance before and after
        uint before = underlying.balanceOf(address(this));
        underlying.transferFrom(msg.sender, address(this), amount);
        uint After = underlying.balanceOf(address(this));
        require(After > before, "Error On Transfer From");

        // return difference
        return After - before;
    }

    /** Mints Tokens to the Receivers Address */
    function _mint(address receiver, uint amount) internal {
        _balances[receiver] += amount;
        _totalSupply += amount;
        emit Transfer(address(0), receiver, amount);
    }

    /** Burns `amount` of tokens from `account` */
    function _burn(address account, uint amount) internal {
        _balances[account] -= amount;
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }

    /** Deletes All XUSD Tokens in XUSD contract */
    function _checkGarbageCollector() internal {
        uint256 bal = _balances[address(this)];
        if (bal > 10_000) {
            // Track Change In Price
            uint256 oldPrice = _calculatePrice();
            // take fee
            _takeFee(bal);
            // burn amount
            _burn(address(this), bal);
            // Emit Collection
            emit GarbageCollected(bal);
            // Require price rises
            _requirePriceRises(oldPrice);
        }
    }

    ///////////////////////////////////
    //////    READ FUNCTIONS    ///////
    ///////////////////////////////////

    /** Price Of XUSD in Underlying With 6 Points Of Precision */
    function calculatePrice() external view returns (uint256) {
        return _calculatePrice();
    }

    /** Returns the Current Price of 1 Token */
    function _calculatePrice() internal view returns (uint256) {
        if (_totalSupply == 0) {
            return precision;
        }
        uint256 backingValue = underlying.balanceOf(address(this));
        if (PROMISE_USD != address(0)) {
            backingValue += IERC20(PROMISE_USD).totalSupply();
        }
        return ( ( backingValue * precision ) / _totalSupply );
    }

    /** Number Of Tokens To Mint */
    function tokensToMint(
        uint256 received,
        uint256 totalBacking
    ) public view returns (uint256) {
        return
            _totalSupply == 0
                ? received // puts launch price at 1 `underlying`
                : isTransferFeeExempt[msg.sender]
                ? ( ( _totalSupply * received ) / totalBacking ) - 100 // sub 100 to avoid any round off error
                : ( ( ( _totalSupply * received ) / ( totalBacking + mintFeeTaken(received) ) ) * mintFee ) / feeDenominator;
    }

    function mintFeeTaken(uint256 amount) public view returns (uint256) {
        uint fee = (amount * mintFee) / feeDenominator;
        return amount - fee;
    }

    /**
        Amount Of Underlying To Receive For `numTokens` of XUSD
     */
    function amountOut(uint256 numTokens) public view returns (uint256) {
        return ( _calculatePrice() * numTokens ) / precision;
    }

    /** Returns the value of `holder`'s holdings */
    function getValueOfHoldings(address holder) public view returns (uint256) {
        return amountOut(_balances[holder]);
    }

    function numPricePoints() external view returns (uint256) {
        return allPrices.length;
    }

    function numPricePointTimestamps() external view returns (uint256) {
        return allPriceTimestamps.length;
    }

    function viewPricePoints(
        uint startIndex,
        uint endIndex
    ) external view returns (uint256[] memory pricePoints) {
        pricePoints = new uint256[](endIndex - startIndex);
        uint count = 0;
        for (uint i = startIndex; i < endIndex; ) {
            pricePoints[count] = allPrices[i];
            unchecked {
                ++count;
                ++i;
            }
        }
    }

    function viewSelectPricePoints(
        uint256[] calldata indexes
    ) external view returns (uint256[] memory pricePoints) {
        uint len = indexes.length;
        pricePoints = new uint256[](len);
        for (uint i = 0; i < len; ) {
            pricePoints[i] = allPrices[indexes[i]];
            unchecked {
                ++i;
            }
        }
    }

    function viewPricePointTimestamps(
        uint startIndex,
        uint endIndex
    ) external view returns (uint256[] memory pricePointTimestamps) {
        pricePointTimestamps = new uint256[](endIndex - startIndex);
        uint count = 0;
        for (uint i = startIndex; i < endIndex; ) {
            pricePointTimestamps[count] = allPriceTimestamps[i];
            unchecked {
                ++count;
                ++i;
            }
        }
    }

    function viewSelectPricePointTimestamps(
        uint256[] calldata indexes
    ) external view returns (uint256[] memory pricePointTimestamps) {
        uint len = indexes.length;
        pricePointTimestamps = new uint256[](len);
        for (uint i = 0; i < len; ) {
            pricePointTimestamps[i] = allPriceTimestamps[indexes[i]];
            unchecked {
                ++i;
            }
        }
    }

    ///////////////////////////////////
    //////   OWNER FUNCTIONS    ///////
    ///////////////////////////////////

    /** Activates Token, Enabling Trading For All */
    function activateToken() external onlyOwner {
        tokenActivated = true;
        emit TokenActivated(block.number);
    }

    /** Pauses Token Activation */
    function deActivateToken() external onlyOwner {
        tokenActivated = false;
        emit TokenDeActivated(block.number);
    }

    /** Updates The Address Of The Router To Purchase Underlying */
    function upgradeRouter(address newRouter) external onlyOwner {
        require(newRouter != address(0));
        router = IUniswapV2Router02(newRouter);
        emit SetRouter(newRouter);
    }

    /** Withdraws Tokens Incorrectly Sent To XUSD */
    function withdrawNonStableToken(IERC20 token) external onlyOwner {
        require(
            address(token) != address(underlying),
            "Cannot Withdraw Underlying Asset"
        );
        require(
            address(token) != address(0), 
            "Zero Address"
        );
        require(
            address(token) != PROMISE_USD,
            "Cannot Withdraw Promise USD"
        );
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    function withdrawETH() external onlyOwner {
        (bool s,) = payable(msg.sender).call{value: (address(this).balance)}("");
        require(s, "ETH Transfer Failed");
    }

    /** 
        Situation Where Tokens Are Un-Recoverable
            Example Situations: 
                Lost Wallet Keys
                Broken Contract Without Withdraw Fuctionality
                Exchange Hot Wallet Without XUSD Support
        Will Redeem Stables Tax Free On Behalf of Wallet
        Will Prevent Incorrectly 'Burnt' or Locked Up Tokens From Continuously Appreciating
     */
    function redeemForLostAccount(address account, uint256 amount) external nonReentrant onlyOwner {
        require(account != address(0));
        require(_balances[account] > 0 && _balances[account] >= amount);

        // make tax exempt
        isTransferFeeExempt[account] = true;

        // sell tokens tax free on behalf of frozen wallet
        _sell(
            amount == 0 ? _balances[account] : amount, 
            account
        );
        
        // remove tax exemption
        isTransferFeeExempt[account] = false;
    }

    /** 
        Sets Mint, Transfer, Sell Fee
        Must Be Within Bounds ( Between 0% - 10% ) 
    */
    function setFees(
        uint256 _mintFee,
        uint256 _transferFee,
        uint256 _sellFee
    ) external onlyOwner {
        require(_mintFee >= 90000); // capped at 10% fee
        require(_transferFee >= 90000); // capped at 10% fee
        require(_sellFee >= 90000); // capped at 10% fee

        mintFee = _mintFee;
        transferFee = _transferFee;
        sellFee = _sellFee;
        emit SetFees(_mintFee, _transferFee, _sellFee);
    }

    /** Excludes Contract From Transfer Fees */
    function setPermissions(
        address Contract,
        bool transferFeeExempt
    ) external onlyOwner {
        require(Contract != address(0), "Invalid Address");
        isTransferFeeExempt[Contract] = transferFeeExempt;
        emit SetPermissions(Contract, transferFeeExempt);
    }

    function setFeeTo(address newFeeTo) external {
        require(msg.sender == feeTo, "Only FeeTo");
        require(newFeeTo != address(0), "Zero Address");
        feeTo = newFeeTo;
        isTransferFeeExempt[newFeeTo] = true;
    }

    function setFlashLoanFee(uint256 newFeeAmount) external onlyOwner {
        require(newFeeAmount <= 2500, "Fee must not exceed 25%");
        flashLoanFee = newFeeAmount;
        emit FlashLoanFeeSet(newFeeAmount);
    }

    function setFeePercentageForFeeTo(uint256 newFeePercentage) external onlyOwner {
        require(newFeePercentage <= 100, "Fee must not exceed 100%");
        feePercentageForFeeTo = newFeePercentage;
        emit FeePercentageForFeeToSet(newFeePercentage);
    }

    function setPromiseUSD(address _promiseUSD) external onlyOwner {
        require(lockPromiseUSD == false, "PromiseUSD Locked");
        PROMISE_USD = _promiseUSD;
    }

    function permaLockPromiseUSD() external onlyOwner {
        lockPromiseUSD = true;
    }

    function setFlashLoanOn(bool _flashLoanOn) external onlyOwner {
        flashLoanOn = _flashLoanOn;
    }

    function setSwapContract(address _swap) external onlyOwner {
        swap = ISwap(_swap);
    }

    /** Mint Tokens to Buyer */
    receive() external payable {
        _checkGarbageCollector();
    }

    function goodAddress(address _target) internal pure returns (bool) {
        if (_target == DEAD || _target == ZERO) {
            return false;
        } else {
            return true;
        }
    }

    ///////////////////////////////////
    //////        EVENTS        ///////
    ///////////////////////////////////

    // Data Tracking
    event PriceChange(
        uint256 previousPrice,
        uint256 currentPrice,
        uint256 totalSupply
    );
    event TokenActivated(uint blockNo);
    event TokenDeActivated(uint blockNo);

    // Balance Tracking
    event Burn(address from, uint256 amountTokensErased);
    event GarbageCollected(uint256 amountTokensErased);
    event Redeemed(
        address seller,
        uint256 amountXUSD,
        uint256 amountUnderlying
    );
    event Minted(address recipient, uint256 numTokens);

    // Governance Tracking
    event SetPermissions(address Contract, bool feeExempt);
    event SetFees(uint mintFee, uint transferFee, uint sellFee);
    event FeePercentageForFeeToSet(uint256 newFeePercentage);

    // FlashLoans
    event FlashLoan(address target, address token, uint256 amount, uint256 fee);
    event FlashLoanFeeSet(uint256 newFeeAmount);
    
}