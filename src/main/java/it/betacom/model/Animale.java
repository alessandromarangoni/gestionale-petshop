package it.betacom.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Animali")
public class Animale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int matricola;

    @Column(name = "nome_animale", nullable = false)
    private String nomeAnimale;

    @Column(name = "data_acquisto", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dataAcquisto;

    @Column(nullable = false)
    private double prezzo;

    @Column(name = "tipo_animale", nullable = false)
    private String tipoAnimale;

    @ManyToOne
    @JoinColumn(name = "idCliente")
    private Cliente cliente;

    
    
	/**
	 * 
	 */
	public Animale() {
		super();
	}

	/**
	 * @param nomeAnimale
	 * @param dataAcquisto
	 * @param prezzo
	 * @param tipoAnimale
	 * @param cliente
	 */
	public Animale(String nomeAnimale, Date dataAcquisto, double prezzo, String tipoAnimale, Cliente cliente) {
		super();
		this.nomeAnimale = nomeAnimale;
		this.dataAcquisto = dataAcquisto;
		this.prezzo = prezzo;
		this.tipoAnimale = tipoAnimale;
		this.cliente = cliente;
	}

	

	/**
	 * @param matricola
	 * @param nomeAnimale
	 * @param prezzo
	 * @param tipoAnimale
	 */
	public Animale(int matricola, String nomeAnimale, double prezzo, String tipoAnimale) {
		super();
		this.matricola = matricola;
		this.nomeAnimale = nomeAnimale;
		this.prezzo = prezzo;
		this.tipoAnimale = tipoAnimale;
	}

	public int getMatricola() {
		return matricola;
	}

	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}

	public String getNomeAnimale() {
		return nomeAnimale;
	}

	public void setNomeAnimale(String nomeAnimale) {
		this.nomeAnimale = nomeAnimale;
	}

	public Date getDataAcquisto() {
		return dataAcquisto;
	}

	public void setDataAcquisto(Date dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getTipoAnimale() {
		return tipoAnimale;
	}

	public void setTipoAnimale(String tipoAnimale) {
		this.tipoAnimale = tipoAnimale;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

    
}
