[General]
ned-path = .;../queueinglib
network = esame250220
#cpu-time-limit = 10000s
cmdenv-config-name = esame250220_p3Base
#tkenv-default-config = esame250220_p3Base
qtenv-default-config = esame250220_p3Base
repeat = 5
sim-time-limit = 10000s
#debug-on-errors = true
**.vector-recording = false

# parameters of the simulation
[Config esame250220_p3Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for N in [15, 20, 25, 30, 35, 40, 45, 50]:
[Config esame250220_p3_N${"%d" % N}]
extends=esame250220_p3Base
**.N=${N}
%endfor