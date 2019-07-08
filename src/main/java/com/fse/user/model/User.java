package com.fse.user.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

public class User {

  @Size(min = 1, message = "Name is required")
  private String name;
  @Size(min = 1, message = "Username is required")
  private String username;
  @Size(min = 1, message = "Password is required")
  private String password;
  @Email
  @Size(min = 1, message = "Email is required")
  private String email;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }
}
