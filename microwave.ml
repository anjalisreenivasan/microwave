(* microwave *)

type state = 
| Off of bool
| Cooking of int
| Paused of int
| DoorOpen of bool
| DoorClosed of bool

type action = 
| OpenDoor of bool
| SetTime of int
| StartButton of bool
| StopButton of bool
| PauseButton of bool

type transition = {
  action: action
  states: (state * state)
}

(* None for a state means its in an action
   None for an action means its in a state*)
type microwave = {
  mutable CurrState : state
  mutable CurrAction: action
  time : int
  transList: transition list
}

(* init microwave *)

let cook microwave action = match (microwave.state, action) with
| (Off, OpenDoor) -> microwave.state = DoorOpen && microwave.action = None
| (DoorClosed, SetTime) -> microwave.state = DoorClosed && microwave.time = SetTime

