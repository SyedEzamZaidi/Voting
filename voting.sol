// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract voting {
    
    address electionComission;
    address[] public candidate;
    uint votes;
    mapping(address => uint) voteCount;
    uint public C0votes;
    uint public C1votes;
    uint public C2votes;


    address[] voter;
   

    constructor (){
        electionComission = msg.sender;
    }

    function addCandidate(address _candidate) public {
        require (msg.sender == electionComission, "Only election comission can add a candidate");
        require (candidate.length < 3, "Candidate limit exceeded");
        candidate.push(_candidate);
    }

function voteC0() public {
for (uint i=0; i< voter.length; i++){
    require (voter[i] != msg.sender, "You can only vote once");
}
    voter.push(msg.sender);
    voteCount[candidate[0]] += 1;
C0votes = voteCount[candidate[0]];

}

function voteC1() public {
    for (uint i=0; i< voter.length; i++){
    require (voter[i] != msg.sender, "You can only vote once");
}
    voter.push(msg.sender);
    voteCount[candidate[1]] += 1;
    C1votes = voteCount[candidate[1]];
    
}

function voteC2() public {
for (uint i=0; i< voter.length; i++){
    require (voter[i] != msg.sender, "You can only vote once");
}

    voter.push(msg.sender);
    voteCount[candidate[2]] += 1;
    C2votes = voteCount[candidate[2]];
}

function winner() public view returns (address Winner){
if (C0votes > C1votes && C0votes > C2votes){
    return candidate[0];
}

    else if (C1votes > C0votes && C1votes > C2votes) {
        return candidate[1];
    }

    else {
        return candidate[2];
    }
    
}


}








