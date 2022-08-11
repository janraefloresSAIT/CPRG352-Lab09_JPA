package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Role;
import models.User;
import services.RoleService;
import services.UserService;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoleService rs = new RoleService();
        UserService us = new UserService();

        String action = request.getParameter("action");

        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);

            List<Role> roles = rs.getAll();
            request.setAttribute("roles", roles);

            if (action != null) {
                if (action.equals("edit")) {
                    String email = request.getParameter("email");
                    
                    User user = us.get(email);
                    
                    request.setAttribute("user", user);
                } else if (action.equals("delete")) {
                    String email = request.getParameter("email");
                    
                    us.delete(email);
                    
                    users = us.getAll();
                    request.setAttribute("users", users);
                    
                    response.sendRedirect("users");
                    return;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService us = new UserService();
        RoleService rs = new RoleService();

        String action = request.getParameter("action");

        try {
            List<Role> roles = rs.getAll();
            request.setAttribute("roles", roles);

            switch (action) {
                case "add":
                    String addRName = request.getParameter("addRole");
                    int addRID = 0;

                    switch (addRName) {
                        case "system admin":
                            addRID = 1;
                            break;

                        case "regular user":
                            addRID = 2;
                            break;

                        case "company admin":
                            addRID = 3;
                            break;
                    }

                    us.insert(request.getParameter("addEmail"), 
                            Boolean.parseBoolean(request.getParameter("isActive")),
                            request.getParameter("addFName"),
                            request.getParameter("addLName"),
                            request.getParameter("addPass"), addRID);

                    break;

                case "edit":
                    String editRName = request.getParameter("editRole");
                    int editRID = 0;
                    
                    switch (editRName) {
                        case "system admin":
                            editRID = 1;
                            break;

                        case "regular user":
                            editRID = 2;
                            break;

                        case "company admin":
                            editRID = 3;
                            break;
                    }
                    
                    us.update(request.getParameter("email"),
                            Boolean.parseBoolean(request.getParameter("editActive")),
                            request.getParameter("editFName"),
                            request.getParameter("editLName"),
                            request.getParameter("editPass"), editRID);
                    
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("users");
        return;
    }
}
