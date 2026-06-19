package sahildhamande.repository;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

import sahildhamande.model.RegisterModel;



@Repository
public interface UserDefinedRepo extends JpaRepository<RegisterModel, Integer> {
	RegisterModel findByUsername(String username);

}