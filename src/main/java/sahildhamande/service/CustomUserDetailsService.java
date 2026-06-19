package sahildhamande.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import sahildhamande.model.RegisterModel;
import sahildhamande.repository.RepositoryImple;


//@Service
/*public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	RepositoryImple repository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		RegisterModel user =
	            repository.getUserByUsername(username);

	    if(user == null)
	        throw new UsernameNotFoundException("User not found");

	    return User.builder()
	            .username(user.getUsername())
	            .password(user.getPassword())
	            .roles("USER")
	            .build();
	}

}
*/
