package it.betacom.dao;

import java.util.List;

import it.betacom.model.Psutenti;

public interface UserDao {
	List<Psutenti> getAllUser();
	void createUser(Psutenti user);
	Psutenti readUserById(int id);
	void updateUser(Psutenti user);
	void deleteUser(Psutenti user);
	
}
