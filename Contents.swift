import UIKit

// CREATE BLOCK CLASS
class Block {
    var hash = String()
    var data = String()
    var prevHash = String()
    var index = Int()
    
    func createHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

// CREATE BLOCKCHAIN CLASS
class BlockChain {
    var chain = [Block]()
    
    func createGenesisBlock(data: String) {
        let gBlock = Block()
        gBlock.hash = gBlock.createHash()
        gBlock.data = data
        gBlock.prevHash = "nil - Genesis Block"
        gBlock.index = 0
        
        chain.append(gBlock)
    }
    
    func addBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.createHash()
        newBlock.data = data
        newBlock.prevHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        
        chain.append(newBlock)
    }
}

// CREATE CHAIN
let KOPCoin = BlockChain()
KOPCoin.createGenesisBlock(data: "From: PA; To: PB; Amount: 10KOP")
KOPCoin.addBlock(data: "From: PB; To: PC; Amount: 10KOP")
KOPCoin.addBlock(data: "From: PC; To: PA; Amount: 10KOP")
KOPCoin.addBlock(data: "From: PD; To: PC; Amount: 10KOP")

KOPCoin.chain[2].data

// PRINT CHAIN DATA

for i in 0...KOPCoin.chain.count-1 {
    print("\tBlock: \(KOPCoin.chain[i].index)\n\tHash: \(KOPCoin.chain[i].hash)\n\tPreviousHash: \(KOPCoin.chain[i].prevHash)\n\tData: \(KOPCoin.chain[i].data)\n")
}

// CHECK VALIDITY OF CHAIN
var isChainValid = true

for i in 1...KOPCoin.chain.count-1 {
    if KOPCoin.chain[i].prevHash != KOPCoin.chain[i-1].hash {
        isChainValid = false
    }
}

print("Chain is valid: \(isChainValid)")






