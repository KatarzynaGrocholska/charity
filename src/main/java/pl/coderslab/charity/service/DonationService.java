package pl.coderslab.charity.service;

import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;

import java.util.List;

public interface DonationService {

    @Query("SELECT SUM(m.quantity) FROM Donation m")
    int  countAllBags();

    void saveDonation(Donation donation);
}
