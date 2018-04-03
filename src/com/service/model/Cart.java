package com.service.model;

import java.util.ArrayList;
import java.util.List;

import com.service.Interfaces.CustomerManagement;

public class Cart implements CustomerManagement {

	public List<CarInventory> carpurchased=new ArrayList<CarInventory>();
	public List<CarPartsInventory> carpartspurchased=new ArrayList<CarPartsInventory>();;
	@Override
	public void addCarToCart (CarInventory car){
		 carpurchased.add(car);

	}
	@Override
	public List<CarInventory> getCarInCart (){
		 return carpurchased;

	}
	@Override
	public void addCarPartToCart (CarPartsInventory carparts){
		carpartspurchased.add(carparts);

	}
	@Override
	public List<CarPartsInventory> getCarPartsInCart (){
		 return carpartspurchased;

	}
	
	public void printCart() {
		
if(carpurchased.size()!=0) {
	for(CarInventory c:carpurchased) {
		
		System.out.println("Car:"+c.getVid());
	}
}
	if(carpartspurchased.size()!=0) {
		for(CarPartsInventory cp:carpartspurchased) {
			System.out.println("Carparts:"+cp.getPid());
		}
	}
		
	}

/*	@Override
	public void purchaseCar(CarInventory car) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void purchaseCarParts(CarPartsInventory carparts) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CarInventory> getpurchasedCar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CarPartsInventory> getpurchasedCarParts() {
		// TODO Auto-generated method stub
		return null;
	}*/
	
}
