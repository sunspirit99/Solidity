pragma solidity >=0.4.22 <0.7.0;

contract account {
    struct Account {
        uint id;
        string name;
        string accountAddress;
        string phoneNumber;
        uint balance;
        uint status;
        string createdTime;
    }
    Account[] public accounts;

    
    function create(uint id, string memory name, string memory accountAddress, string memory phoneNumber, uint balance, uint status, string memory createdTime) public {
        accounts.push(Account(id, name, accountAddress, phoneNumber, balance, status, createdTime)) ;

    }
    
    function read(uint id) view public returns(uint, string memory, string memory, string memory, uint, uint, string memory) {
        uint index = find(id);
        return (accounts[index].id, accounts[index].name, accounts[index].accountAddress, accounts[index].phoneNumber, accounts[index].balance, accounts[index].status, accounts[index].createdTime);
    }
    
    function update(uint id, string memory name, string memory accountAddress, string memory phoneNumber, uint balance, uint status, string memory createdTime) public {
        uint index = find(id);
        accounts[index].name = name;
        accounts[index].accountAddress = accountAddress;
        accounts[index].phoneNumber = phoneNumber;
        accounts[index].balance = balance;
        accounts[index].status = status;
        accounts[index].createdTime = createdTime;
    }
    
    function deleteAccount(uint id) public {
        uint index = find(id);
        delete accounts[index];
    }
    
    function find(uint id) view internal returns(uint) {
        for(uint i = 0; i < accounts.length; i++) {
            if(accounts[i].id == id) {
                return i;
            }
        }
        revert('Account does not exits');
    }
}
