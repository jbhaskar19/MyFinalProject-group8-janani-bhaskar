package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Carsale.
 * @see com.service.model.Carsale
 * @author Hibernate Tools
 */
@Stateless
public class CarsaleHome {

    private static final Log log = LogFactory.getLog(CarsaleHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(Carsale transientInstance) {
        log.debug("persisting Carsale instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(Carsale persistentInstance) {
        log.debug("removing Carsale instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public Carsale merge(Carsale detachedInstance) {
        log.debug("merging Carsale instance");
        try {
            Carsale result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public Carsale findById( String id) {
        log.debug("getting Carsale instance with id: " + id);
        try {
            Carsale instance = entityManager.find(Carsale.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

