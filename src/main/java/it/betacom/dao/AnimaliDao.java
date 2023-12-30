package it.betacom.dao;

import java.util.List;

import it.betacom.model.Animale;

public interface AnimaliDao {
	public List<Animale> getAllAnimali();
	public void createAnimale(Animale animale);
	public Animale readAnimaleByMatricola(int matricola);
	public void updateAnimale(Animale animale);
	public void deleteAnimale(Animale animale);
}
