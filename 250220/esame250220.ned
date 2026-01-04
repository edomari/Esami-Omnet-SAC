import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Router;

network esame250220
{
    parameters:
        int N = default(20); // numero di nodi
        double mu = default(10.0); 
        double cv = default(3.0); // coefficiente di variazione
        double lambda = default(100);

        src.interArrivalTime = exponential(1s/lambda); // ancora esponenziale
        srv[*].serviceTime = 1.0s*lognormal(log(1.0/(mu*sqrt(1+cv^2))), sqrt(log(1+cv^2))); 
        
    submodules:
        src: Source;
        srv[N]: Queue;
        r: Router;
        sink: Sink;
        
    connections:
        src.out --> r.in++;
        for i=0..N-1 {
            r.out++ --> srv[i].in++;
            srv[i].out --> sink.in++;
        }
}