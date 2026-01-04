[General]
ned-path = .;../queueinglib
network = esame250220
#cpu-time-limit = 10000s
cmdenv-config-name = esame250220Base
#tkenv-default-config = esame250220Base
qtenv-default-config = esame250220Base
repeat = 5
sim-time-limit = 10000s
#debug-on-errors = true
**.vector-recording = false

# parameters of the simulation
[Config esame250220Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for N in [20]:
[Config esame250220_N${"%d" % N}]
extends=esame250220Base
**.N=${N}
%endfor