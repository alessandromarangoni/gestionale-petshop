package it.betacom.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the psutenti database table.
 * 
 */
@Entity
@NamedQuery(name="Psutenti.findAll", query="SELECT p FROM Psutenti p")
public class Psutenti implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;

	private String cellulare;

	private String cognome;

	@Temporal(TemporalType.DATE)
	private Date datadinascita;

	private String email;

	private String nome;

	private String password;

	private String ruolo;

	private String stato;

	private String username;

	public Psutenti() {
	}

	/**
	 * @param cellulare
	 * @param cognome
	 * @param datadinascita
	 * @param email
	 * @param nome
	 * @param password
	 * @param ruolo
	 * @param stato
	 * @param username
	 */
	public Psutenti(String cellulare, String cognome, Date datadinascita, String email, String nome, String password,
			String ruolo, String stato, String username) {
		super();
		this.cellulare = cellulare;
		this.cognome = cognome;
		this.datadinascita = datadinascita;
		this.email = email;
		this.nome = nome;
		this.password = password;
		this.ruolo = ruolo;
		this.stato = stato;
		this.username = username;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCellulare() {
		return this.cellulare;
	}

	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDatadinascita() {
		return this.datadinascita;
	}

	public void setDatadinascita(Date datadinascita) {
		this.datadinascita = datadinascita;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRuolo() {
		return this.ruolo;
	}

	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}

	public String getStato() {
		return this.stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}