package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class CardInformation.
 * @see com.service.model.CardInformation
 * @author Hibernate Tools
 */
@Stateless
public class CardInformationHome {

    private static final Log log = LogFactory.getLog(CardInformationHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(CardInformation transientInstance) {
        log.debug("persisting CardInformation instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(CardInformation persistentInstance) {
        log.debug("removing CardInformation instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public CardInformation merge(CardInformation detachedInstance) {
        log.debug("merging CardInformation instance");
        try {
            CardInformation result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public CardInformation findById( String id) {
        log.debug("getting CardInformation instance with id: " + id);
        try {
            CardInformation instance = entityManager.find(CardInformation.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

