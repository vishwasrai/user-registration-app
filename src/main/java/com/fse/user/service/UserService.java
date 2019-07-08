package com.fse.user.service;

import com.fse.user.model.Login;
import com.fse.user.model.User;

public interface UserService {

  void register(User user);

  User validateUser(Login login);

  int accountUpdate(User user);
}
