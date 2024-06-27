import CryptoPoops from 0x05
import NonFungibleToken from 0x05

transaction() {

  prepare(acct: AuthAccount) {
   
    acct.save(<- CryptoPoops.createEmptyCollection(), to: /storage/Collection)
    acct.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic, CryptoPoops.MyCollectionPublic}>(/public/Collection, target: /storage/Collection)
    
    
  }
  execute {
    log(" Collection Stored successfully!!")
  }
}
