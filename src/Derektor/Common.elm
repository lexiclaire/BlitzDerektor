module Derektor.Common exposing (..)

import Set exposing (Set)

-- UPDATE

toggle : comparable -> Set comparable -> Set comparable
toggle x set =
  if Set.member x set then
    Set.remove x set
  else
    Set.insert x set