package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.repository.DonationRepository;

import pl.coderslab.charity.service.InstitutionService;


@Controller
public class HomeController {

    @Autowired
    private InstitutionService institutionService;
   // private DonationService donationService;
    private DonationRepository donationRepository;

    public HomeController(InstitutionService institutionService, DonationRepository donationRepository) {
        this.institutionService = institutionService;
        this.donationRepository = donationRepository;
    }

    @RequestMapping(path="/")
    public String homeAction(Model model){
        model.addAttribute("institutions", institutionService.getAllInstitutions());
        model.addAttribute("bags", donationRepository.countAllBags());
        model.addAttribute("donations", donationRepository.count());
        return "index";
    }


}
