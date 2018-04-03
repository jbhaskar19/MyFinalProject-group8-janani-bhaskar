package com.service.Interfaces;

import java.util.List;

import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;
import com.service.model.Dealer;
import com.service.model.Dealership;

public interface ManageInventory {
public void	removeCar(CarInventory removedCar);
public void removeCarPart(CarPartsInventory removeCarPart);
public void addCar(CarInventory addCar);
public void addCarPart(CarPartsInventory addCarPart);
public List<CarPartsInventory> getCarParts(Dealer dealer,Dealership dealership);
public List<CarInventory> getCar(Dealer dealer,Dealership dealership);

}
