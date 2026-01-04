[General]
ned-path = .;../queueinglib
network = esame240116
#cpu-time-limit = 10000s
cmdenv-config-name = esame240116Base
#tkenv-default-config = esame240116Base
qtenv-default-config = esame240116Base
repeat = 5
sim-time-limit = 10000s
#debug-on-errors = true
**.vector-recording = false

# parameters of the simulation
[Config esame240116Base]
description = "Global scenario"
**.srv.queueLength.result-recording-modes = +histogram
**.sink.lifeTime.result-recording-modes = +histogram

%for f_l in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
[Config esame240116_p3_fl${int(f_l*100)}]
extends=esame240116Base
**.f_l=${f_l}
%endfor