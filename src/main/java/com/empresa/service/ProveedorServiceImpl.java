package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Proveedor;
import com.empresa.repository.ProveedorRepository;

@Service
public class ProveedorServiceImpl implements ProveedorService{

	@Autowired
	private ProveedorRepository repository;
	
	@Override
	public Proveedor insertaProveedor(Proveedor obj) {
		return repository.save(obj);
	}

	@Override
	public List<Proveedor> listaPorNombreIgual(String nombre) {
		return repository.listaPorNombreIgual(nombre);
	}

	@Override
	public List<Proveedor> listaPorDniIgual(String dni) {
		return repository.listaPorDniIgual(dni);
	}

}
