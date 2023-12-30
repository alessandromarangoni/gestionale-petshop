package it.betacom.dao;

import java.util.List;

import it.betacom.model.Cliente;

public interface ClienteDao {
	 public List<Cliente> getAllClienti();
	 public void createCliente(Cliente cliente);
	 public Cliente readClienteById(int id);
	 public void updateCliente(Cliente cliente);
	 public void deleteCliente(Cliente cliente);
}
