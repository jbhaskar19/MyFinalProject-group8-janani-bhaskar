package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Carpartssale.
 * @see com.service.model.Carpartssale
 * @author Hibernate Tools
 */
@Stateless
public class CarpartssaleHome {

    private static final Log log = LogFactory.getLog(CarpartssaleHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(Carpartssale transientInstance) {
        log.debug("persisting Carpartssale instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(Carpartssale persistentInstance) {
        log.debug("removing Carpartssale instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public Carpartssale merge(Carpartssale detachedInstance) {
        log.debug("merging Carpartssale instance");
        try {
            Carpartssale result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public Carpartssale findById( String id) {
        log.debug("getting Carpartssale instance with id: " + id);
        try {
            Carpartssale instance = entityManager.find(Carpartssale.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

