package com.service.Interfaces;

import com.service.model.Customer;

public interface UserManagementServices {
String registration(Object user);
void resetPassword(String newPassword,Object user);
void forgotPassword();
void editProfile(Object editProfile);
}
