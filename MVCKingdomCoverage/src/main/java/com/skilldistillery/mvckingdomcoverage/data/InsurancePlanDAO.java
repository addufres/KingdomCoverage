package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;

public interface InsurancePlanDAO {

	InsurancePlan show(int id);

	InsurancePlan create(InsurancePlan plan);

	InsurancePlan update(int id, InsurancePlan coverage);

	InsurancePlan deactivate(int id);

	InsurancePlan activate(int id);

	List<InsurancePlan> getAllPlans();

	double getTotalCostOfPlanAndMultiplier();

}
