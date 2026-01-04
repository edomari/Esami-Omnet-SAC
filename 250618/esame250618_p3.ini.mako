[General]
ned-path = .;../queueinglib
network = esame250618
cmdenv-config-name = esame250618Base
qtenv-default-config = esame250618Base
repeat = 5
sim-time-limit = 10000s
**.vector-recording = false

# parameters of the simulation
[Config esame250618Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for server_type in ["tipo1", "tipo2"]:
%for N in ([25, 30, 35, 40, 45, 50] if server_type == "tipo1" else [15, 20, 25, 30, 35, 40, 45, 50]):
[Config esame250618_p3_N${N}_${server_type}]
extends=esame250618Base
**.N=${N}
**.server_type="${server_type}"
%endfor
%endfor