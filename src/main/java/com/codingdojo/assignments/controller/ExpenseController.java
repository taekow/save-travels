package com.codingdojo.assignments.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.assignments.models.Expense;
import com.codingdojo.assignments.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		return "index.jsp";
	}
	
	@PostMapping("/expenses")
	public String index(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		}else {
			expenseService.createExpense(expense);
			
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense expenses = expenseService.findExpense(id);
		model.addAttribute("expense", expenses);
		
		return "edit.jsp";
	}
	
	@PutMapping("/expenses/edit/{id}")
	public String update(
			@Valid @ModelAttribute("expense") Expense expense, BindingResult result,
			@PathVariable("id") Long id, Model model) {
		if(result.hasErrors()) {
			
			return "/expenses/edit/{id}";
		} else {
			expenseService.updateExpense(expense);
			
			return "redirect:/expenses";
		}
	}
	
	@RequestMapping(value="/expenses/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		
		return "redirect:/expenses";
	}
	
	@GetMapping("expenses/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		Expense expenses = expenseService.findExpense(id);
		model.addAttribute("expense", expenses);
		
		return "detail.jsp";
	}
	
//	@DeleteMapping("/expenses/{id}")
//	public String delete(@PathVariable("id") Long id) {
//		expenseService.deleteExpense(id);
//		
//		return "redirect:/expenses";
//	}
}