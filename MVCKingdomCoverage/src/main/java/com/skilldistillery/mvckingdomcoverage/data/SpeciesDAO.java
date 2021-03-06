package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Species;

public interface SpeciesDAO {

	Species showSpecies(int id);

	Species create(Species species);

	Species update(int id, Species species);

	List<Insured> showClients(int id);

	List<Species> getAllSpecies();

}
