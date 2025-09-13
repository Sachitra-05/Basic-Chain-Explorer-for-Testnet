module MyModule::ChainExplorer {
    /// Struct representing a chain explorer for testnet
    struct Explorer has store, key {
        total_transactions: u64,  // Total number of transactions tracked
        total_blocks: u64,        // Total number of blocks tracked
    }

    /// Function to create a new chain explorer
    public entry fun create_explorer(owner: &signer) {
        let explorer = Explorer {
            total_transactions: 0,
            total_blocks: 0,
        };
        move_to(owner, explorer);
    }

    /// Function to add new transaction data to the explorer
    public entry fun add_transaction_data(_user: &signer, explorer_owner: address, tx_count: u64) acquires Explorer {
        let explorer = borrow_global_mut<Explorer>(explorer_owner);
        
        // Update the transaction count
        explorer.total_transactions = explorer.total_transactions + tx_count;
        
        // Increment block count 
        explorer.total_blocks = explorer.total_blocks + 1;
    }
}