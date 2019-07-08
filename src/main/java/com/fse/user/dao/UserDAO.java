package com.fse.user.dao;

import com.fse.user.model.User;

public interface UserDAO {

    User findUserByUsernameAndPassword(String username, String password);

    void registerNewUser(User user);

    int updateUserDetails(User user);
}
