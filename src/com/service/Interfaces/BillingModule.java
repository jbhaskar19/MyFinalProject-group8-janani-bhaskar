package com.service.Interfaces;

import java.util.List;

import com.service.model.CarInventory;
import com.service.model.CarPartsInventory;
import com.service.model.Carpartssale;
import com.service.model.Carsale;

public interface BillingModule {
void makeCarPayment(List<CarInventory> carscheckout,Carsale sale);
void makeCarPartPayment(List<CarPartsInventory> carpartscheckout,int valueOfCapacity,Carpartssale partSale);
}
