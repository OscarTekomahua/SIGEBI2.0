package mx.edu.utez.sigebi.utils;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.ejb.TimerService;
import javax.inject.Inject;

@Singleton
@Startup
public class TimerRegistrar {
    @Inject
    private TimerService timerService;

    @PostConstruct
    public void inicializar() {

    }

}
