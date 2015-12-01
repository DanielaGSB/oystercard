#quiero que journey records journey history
#start_journey should start a new journey with an entry station
#current_journey should return an incomplete journey or create a new journey
 #exit_journey should add a new exit station to the current_journey
 #journeys should return a list of all previous journeys without exposing the internal array to external modification
 #outstanding_charges should close an incomplete journey and return its fare
 # refactor to using Forwardable module from Standard Library to delegate the method #exit_journey to the current_journey's #exit method.

class Journey

def start_journey
end

def end_journey
end
