package com.fse.user.service;

import com.fse.user.dao.UserDAO;
import com.fse.user.model.Login;
import com.fse.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

  @Autowired
  public UserDAO userDao;

  @Override
  public void register(User user) {

    userDao.registerNewUser(user);
  }

  @Override
  public int accountUpdate(User user) {

    return userDao.updateUserDetails(user);
  }

  @Override
  public User validateUser(Login login) {

    return userDao.findUserByUsernameAndPassword(login.getUsername(), login.getPassword());
  }
}
