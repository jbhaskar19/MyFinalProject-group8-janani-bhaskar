package com.service.model;
// Generated Mar 31, 2018 2:39:23 AM by Hibernate Tools 5.2.8.Final


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Admin.
 * @see com.service.model.Admin
 * @author Hibernate Tools
 */
@Stateless
public class AdminHome {

    private static final Log log = LogFactory.getLog(AdminHome.class);

    @PersistenceContext private EntityManager entityManager;
    
    public void persist(Admin transientInstance) {
        log.debug("persisting Admin instance");
        try {
            entityManager.persist(transientInstance);
            log.debug("persist successful");
        }
        catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }
    
    public void remove(Admin persistentInstance) {
        log.debug("removing Admin instance");
        try {
            entityManager.remove(persistentInstance);
            log.debug("remove successful");
        }
        catch (RuntimeException re) {
            log.error("remove failed", re);
            throw re;
        }
    }
    
    public Admin merge(Admin detachedInstance) {
        log.debug("merging Admin instance");
        try {
            Admin result = entityManager.merge(detachedInstance);
            log.debug("merge successful");
            return result;
        }
        catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }
    
    public Admin findById( String id) {
        log.debug("getting Admin instance with id: " + id);
        try {
            Admin instance = entityManager.find(Admin.class, id);
            log.debug("get successful");
            return instance;
        }
        catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
}

