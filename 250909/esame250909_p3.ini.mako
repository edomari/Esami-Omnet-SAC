[General]
ned-path = .;../queueinglib
network = esame250909
cmdenv-config-name = esame250909Base
qtenv-default-config = esame250909Base
repeat = 5
sim-time-limit = 10000s
**.vector-recording = false

# parameters of the simulation
[Config esame250909Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for server_type in ["tipo1", "tipo2"]:
%for N in ([30, 35, 40, 45, 50, 55] if server_type == "tipo1" else [15, 20, 25, 35, 45, 55]):
[Config esame250909_p3_N${N}_${server_type}]
extends=esame250909Base
**.N=${N}
**.server_type="${server_type}"
%endfor
%endfor