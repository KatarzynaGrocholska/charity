package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Service
public class InstitutionServiceImp implements InstitutionService {

    @Autowired
    private InstitutionRepository institutionRepository;

    public InstitutionServiceImp(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Override
    public List<Institution> getAllInstitutions() {
        return institutionRepository.findAll();
    }
}
