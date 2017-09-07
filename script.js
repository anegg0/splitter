 var account_one = "0x392b75fa0a7a47a9ef331aeec04d4bcefb2a7210"; // an address
    var account_two = "0x4082235d188f5fe18797c90c3c096d11313c1c41"; // another address

    var meta;
    Splitter.deployed().then(function(instance) {
    meta = instance;  
    return meta.sendCoin(account_two, 0.2, {from: account_one});
    }).then(function(result) {
    // result is an object with the following values:
    //
    // result.tx      => transaction hash, string
    // result.logs    => array of decoded events that were triggered within this transaction
    // result.receipt => transaction receipt object, which includes gas used

    // We can loop through result.logs to see if we triggered the Transfer event.
    for (var i = 0; i < result.logs.length; i++) {
        var log = result.logs[i];

        if (log.event == "Transfer") {
        // We found the event!
        break;
        }
    }
    }).catch(function(err) {
    // There was an error! Handle it.
    });