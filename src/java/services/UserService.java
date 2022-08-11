package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;

public class UserService {

    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

    public void insert(String email, boolean active, String fName, String lName, String password, int roleID) throws Exception {
        User user = new User(email, active, fName, lName, password);
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.getRole(email);
        user.setRole(role);
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }

    public void update(String email, boolean active, String fName, String lName, String password, int roleID) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        user.setPassword(password);
        user.setActive(active);
        user.setFirstName(fName);
        user.setLastName(lName);
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.getRole(email);
        user.setRole(role);
        userDB.update(user);
    }

    public void delete(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        userDB.delete(user);
    }
}
