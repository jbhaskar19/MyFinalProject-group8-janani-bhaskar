package com.service.Interfaces;

import java.util.Collection;
import java.util.List;

import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;

public interface CustomerManagement {
void addCarToCart(CarInventory car);
void addCarPartToCart(CarPartsInventory carparts);
List<CarInventory> getCarInCart();
List<CarPartsInventory> getCarPartsInCart();
}
