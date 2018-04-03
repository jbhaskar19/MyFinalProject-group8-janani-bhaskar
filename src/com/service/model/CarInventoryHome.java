package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class CarInventory.
 * @see com.service.model.CarInventory
 * @author Hibernate Tools
 */
@Stateless
public class CarInventoryHome {

    private static final Log log = LogFactory.getLog(CarInventoryHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(CarInventory transientInstance) {
        log.debug("persisting CarInventory instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(CarInventory persistentInstance) {
        log.debug("removing CarInventory instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public CarInventory merge(CarInventory detachedInstance) {
        log.debug("merging CarInventory instance");
        try {
            CarInventory result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public CarInventory findById( String id) {
        log.debug("getting CarInventory instance with id: " + id);
        try {
            CarInventory instance = entityManager.find(CarInventory.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

