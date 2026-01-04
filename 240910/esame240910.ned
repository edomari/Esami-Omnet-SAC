import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Delay;

network esame240910
{
    parameters:
        double lambda = default(10);
        double f_l = default(0.7);
        double mu = default(10);
        double lambda_l = lambda * f_l;
        double lambda_c = lambda * (1-f_l);
        
        local_src.interArrivalTime = 1.0s * exponential(1/lambda_l);
        cloud_src.interArrivalTime = 1.0s * exponential(1/lambda_c);
        
        // Processore locale: M/M/1 con μ=10
        local_proc.serviceTime = 1.0s * exponential(1/mu);
        
        // Rete cloud: M/M/1 con tempo servizio medio 70ms
        // Il rate è 1/0.07 = 14.286 req/s
        network_delay.serviceTime = 1.0s * exponential(0.07);
        
        // Funzione cloud: Delay center con Tc = 1/μ = 0.1s
        cloud_proc.delay = 1.0s * 1/mu;

    submodules:
        local_src: Source;
        cloud_src: Source;
        local_proc: Queue;
        network_delay: Queue;
        cloud_proc: Delay;
        sink: Sink;

    connections:
        local_src.out --> local_proc.in++;
        local_proc.out --> sink.in++;
        cloud_src.out --> network_delay.in++;
        network_delay.out --> cloud_proc.in++;
        cloud_proc.out --> sink.in++;
}