package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Dealership.
 * @see com.service.model.Dealership
 * @author Hibernate Tools
 */
@Stateless
public class DealershipHome {

    private static final Log log = LogFactory.getLog(DealershipHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(Dealership transientInstance) {
        log.debug("persisting Dealership instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(Dealership persistentInstance) {
        log.debug("removing Dealership instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public Dealership merge(Dealership detachedInstance) {
        log.debug("merging Dealership instance");
        try {
            Dealership result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public Dealership findById( String id) {
        log.debug("getting Dealership instance with id: " + id);
        try {
            Dealership instance = entityManager.find(Dealership.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

