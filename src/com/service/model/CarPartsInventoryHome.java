package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class CarPartsInventory.
 * @see com.service.model.CarPartsInventory
 * @author Hibernate Tools
 */
@Stateless
public class CarPartsInventoryHome {

    private static final Log log = LogFactory.getLog(CarPartsInventoryHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(CarPartsInventory transientInstance) {
        log.debug("persisting CarPartsInventory instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(CarPartsInventory persistentInstance) {
        log.debug("removing CarPartsInventory instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public CarPartsInventory merge(CarPartsInventory detachedInstance) {
        log.debug("merging CarPartsInventory instance");
        try {
            CarPartsInventory result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public CarPartsInventory findById( String id) {
        log.debug("getting CarPartsInventory instance with id: " + id);
        try {
            CarPartsInventory instance = entityManager.find(CarPartsInventory.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

