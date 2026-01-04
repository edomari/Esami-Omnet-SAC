[General]
ned-path = .;../queueinglib
network = esame250618
#cpu-time-limit = 10000s
cmdenv-config-name = esame250618Base
#tkenv-default-config = esame250618Base
qtenv-default-config = esame250618Base
repeat = 5
sim-time-limit = 10000s
#debug-on-errors = true
**.vector-recording = false

# parameters of the simulation
[Config esame250618Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for server_type in ["tipo1", "tipo2"]:
%for N in [40]:
[Config esame250618_N${N}_${server_type}]
extends=esame250618Base
**.N=${N}
**.server_type="${server_type}"
%endfor
%endfor