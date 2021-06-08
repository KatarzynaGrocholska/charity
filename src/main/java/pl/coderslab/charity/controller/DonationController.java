package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;
    private CategoryService categoryService;
    private InstitutionService institutionService;

    public DonationController(DonationService donationService, CategoryService categoryService,
                              InstitutionService institutionService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

    @RequestMapping(path = "/form")
    public String showForm ( Model model){
       
            Donation donation = new Donation();
            List<Category> categories = categoryService.getAllCategories();
            List<Institution> institutions = institutionService.getAllInstitutions();
            model.addAttribute("donation", donation);
            model.addAttribute("categories", categories);
            model.addAttribute("institutions", institutions);
            return "forms";

    }

    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public String addDonation(@ModelAttribute("donation") Donation donation) {


            donationService.saveDonation(donation);

        return "form-confirmation";
    }
}
