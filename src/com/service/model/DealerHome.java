package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Dealer.
 * @see com.service.model.Dealer
 * @author Hibernate Tools
 */
@Stateless
public class DealerHome {

    private static final Log log = LogFactory.getLog(DealerHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(Dealer transientInstance) {
        log.debug("persisting Dealer instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(Dealer persistentInstance) {
        log.debug("removing Dealer instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public Dealer merge(Dealer detachedInstance) {
        log.debug("merging Dealer instance");
        try {
            Dealer result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public Dealer findById( String id) {
        log.debug("getting Dealer instance with id: " + id);
        try {
            Dealer instance = entityManager.find(Dealer.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

