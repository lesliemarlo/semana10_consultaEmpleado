package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.empresa.entity.Proveedor;

public interface ProveedorRepository extends JpaRepository<Proveedor, Integer>{
	
	@Query("select x from Proveedor x where x.nombre = ?1")
	public abstract List<Proveedor> listaPorNombreIgual(String nombre);
	
	@Query("select x from Proveedor x where x.dni = ?1")
	public abstract List<Proveedor> listaPorDniIgual(String dni);
	
}
