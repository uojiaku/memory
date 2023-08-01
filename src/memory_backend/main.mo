import Time "mo:base/Time";
import Int "mo:base/Int";

actor StableMem {
  var myFirstName : Text = "";
  stable var myLastName : Text = "";

  public shared(msg) func updateVars(): async Text {
    myFirstName := "Sherlock";
    myLastName := "Holmes";
  return "OK";
  }; // end updateVars

  public query({caller}) func greet(name : Text) : async Text {
    var now : Int = Time.now();

    return "Hello, " # name #
          " ! Nice to Meet you. My name is " #
          myFirstName # " " # myLastName # ". The time is: " # Int.toText(now);
  }
};

// dfx canister call memory_backend greet '("")'
// dfx canister call memory_backend updateVars '("")'
