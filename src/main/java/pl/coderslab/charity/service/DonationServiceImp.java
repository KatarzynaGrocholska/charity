package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.List;

@Service
public class DonationServiceImp implements DonationService {

    @Autowired
    private DonationRepository donationRepository;

    public DonationServiceImp(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Override
    public int countAllBags() {
        return 0;
    }

    @Override
    public void saveDonation(Donation donation) {
this.donationRepository.save(donation);
    }




}
