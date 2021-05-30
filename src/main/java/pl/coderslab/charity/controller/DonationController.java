package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.DonationService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;

    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }

    @GetMapping(path = "/form", produces = "text/html;charset=UTF-8")
    public String showForm (Model model){
        Donation donation= new Donation();
        List<Category> categories = new ArrayList<>();
        List<Institution> institutions = new ArrayList<>();
        model.addAttribute("donation", donation);
        model.addAttribute("categories", categories);
        model.addAttribute("institutions", institutions);
        return "addDonation";
    }

    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public String addDonation(@ModelAttribute("donation") Donation donation ){
        donationService.saveDonation(donation);

        return "redirect:index";
    }
}
