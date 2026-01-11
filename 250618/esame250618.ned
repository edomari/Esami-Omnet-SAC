import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Router;

network esame250618
{
    parameters:
        int N = default(40); // numero di nodi
        double mu1 = default(10.0);  // server tipo 1
        double mu2 = default(15.0);  // server tipo 2
        double lambda = default(200);
        string server_type = default("tipo1"); // "tipo1" o "tipo2"
        
        double selected_mu = (server_type == "tipo1") ? mu1 : mu2;

        src.interArrivalTime = 1s * exponential(1/lambda);
        srv[*].serviceTime = 1s * exponential(1/selected_mu);
        
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