 import CryptoPoops from 0x05
 import NonFungibleToken from 0x05

pub fun main(account: Address, id: UInt64): String {
  let publicReference = getAccount(account).getCapability(/public/Collection)
                                     .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
                                   ?? panic("This account does not have a Collection")
  
  return publicReference.borrowAuthNFT(id: id).name
}
