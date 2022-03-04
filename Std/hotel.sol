// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract hotal {  

  mapping (bytes32 => bool) private listStudent;

  //---events---
  event NameAdded(
    address from,   
    string text,
    bytes32 hash,
    string time,
    string owner

  );
  
  event RegistrationError(
    address from,
    string text,
    string reason
  );

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listStudent[proof] = true;
  }
  
  // record a student name
  function registration(string memory name,string memory time,string memory owner) public payable {
    
    //---check if string was previously stored---
    if (listStudent[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, "This room has been reserved.");
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        //---exit the function---
        return;
    }



    if(keccak256(bytes(name)) == keccak256(bytes("hotel1"))) {
        if (msg.value != 0.001 ether) {
            //---fire the event---
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.001 ether");
            //---refund back to the sender---
            payable(msg.sender).transfer(msg.value);
            //---exit the function---
            return;
        } 

    }else if(keccak256(bytes(name)) == keccak256(bytes("hotel2"))){
        if (msg.value != 0.002 ether) {
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.002 ether");
            payable(msg.sender).transfer(msg.value);
            return;
        }     

    }else if(keccak256(bytes(name)) == keccak256(bytes("hotel3"))){
        if (msg.value != 0.003 ether) {
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.003 ether");
            payable(msg.sender).transfer(msg.value);
            return;
        }     

    }else if(keccak256(bytes(name)) == keccak256(bytes("hotel4"))){
        if (msg.value != 0.004 ether) {
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.004 ether");
            payable(msg.sender).transfer(msg.value);
            return;
        }     

    }else if(keccak256(bytes(name)) == keccak256(bytes("hotel5"))){
        if (msg.value != 0.005 ether) {
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.005 ether");
            payable(msg.sender).transfer(msg.value);
            return;
        }

    }else if(keccak256(bytes(name)) == keccak256(bytes("hotel6"))){
        if (msg.value != 0.006 ether) {
            emit RegistrationError(msg.sender, name, "Incorrect amout of Ether. You should pay 0.006 ether");
            payable(msg.sender).transfer(msg.value);
            return;
        }

    }else{
        emit RegistrationError(msg.sender, name, "Room not found, please contact staff");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    //---check if msg.value != 0.001 ether---

    recordProof(hashing(name));
    
    //---fire the event---
    emit NameAdded(msg.sender, name,hashing(name),time,owner);
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  // check name of student in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listStudent[hashing(name)];
  }
}
