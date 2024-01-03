package it.betacom.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Clienti")
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idCliente;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String cognome;

    private String indirizzo;
    private String citta;
    private String telefono;

    @OneToMany(mappedBy = "cliente")
    private Set<Animale> animali;

    // Costruttori, getter e setter

	public Cliente() {
	}

	/**
	 * @param nome
	 * @param cognome
	 * @param indirizzo
	 * @param citta
	 * @param telefono
	 */
	
	public Cliente(String nome, String cognome, String indirizzo, String citta, String telefono) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.telefono = telefono;
	}

	public String getCitta() {
		return this.citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public int getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public String getIndirizzo() {
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Set<Animale> getAnimali() {
		return animali;
	}

	public void setAnimali(Set<Animale> animali) {
		this.animali = animali;
	}

}