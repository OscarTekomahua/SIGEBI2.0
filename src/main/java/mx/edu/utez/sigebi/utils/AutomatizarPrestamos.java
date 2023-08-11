package mx.edu.utez.sigebi.utils;

import mx.edu.utez.sigebi.model.DAO.PrestamoSalasDao;

import javax.ejb.*;

@Singleton
public class AutomatizarPrestamos implements TimedObject {

    @EJB
    private PrestamoSalasDao daoprestamo;

    @Override
    @Timeout
    public void ejbTimeout(Timer timer) {

    }

    @Schedule (hour = "*", minute = "*/10", persistent = false)
    public void scheduleTimeout(Timer timer) {
        ejbTimeout(timer);
    }
}
