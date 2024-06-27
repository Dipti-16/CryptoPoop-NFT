import CryptoPoops from 0x05
import NonFungibleToken from 0x05

transaction(recipient: Address, id: UInt64) {
 // the NFTMinter will sign this transaction
  prepare(acct: AuthAccount) {
   let collection =  acct.borrow<&CryptoPoops.Collection>(from: /storage/Minter)!

   let publicReference = getAccount(recipient).getCapability(/public/Collection)
                        .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
                         ?? panic("This account does not have a Collection")
  
    publicReference.deposit(token: <- collection.withdraw(id: id))
  }
  execute {
    log("Stored newly minted NFT into Collection")
  }
}
