package com.codingdojo.assignments.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.assignments.models.Expense;
import com.codingdojo.assignments.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	// adding the expense repository as a dependency
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	// return all expense
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	// Create a new expense
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	// Retrieve an expense
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
	// update existing expense
	public Expense updateExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	// delete existing expense
	public void deleteExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			expenseRepository.deleteById(id);
		}
	}
}