[General]
ned-path = .;../queueinglib
network = esame250909
#cpu-time-limit = 10000s
cmdenv-config-name = esame250909Base
#tkenv-default-config = esame250909Base
qtenv-default-config = esame250909Base
repeat = 5
sim-time-limit = 10000s
#debug-on-errors = true
**.vector-recording = false

# parameters of the simulation
[Config esame250909Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for server_type in ["tipo1", "tipo2"]:
%for N in [45]:
[Config esame250909_N${N}_${server_type}]
extends=esame250909Base
**.N=${N}
**.server_type="${server_type}"
%endfor
%endfor