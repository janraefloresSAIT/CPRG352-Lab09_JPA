package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import models.Role;

public class RoleDB {

    public List<Role> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            List<Role> roleList = em.createNamedQuery("Role.findAll", Role.class).getResultList();
            return roleList;
        } finally {
            em.close();
        }
    }
    
    public Role getRole(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Role role = em.find(Role.class, email);
            return role;
        } finally {
            em.close();
        }
    }
}
