package com.empresa.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Proveedor;
import com.empresa.service.ProveedorService;

@Controller
public class ProveedorRegistraController {

	@Autowired
	private ProveedorService proveedorService;
	
	@GetMapping(value = "/verRegistraProveedor" )
	public String verProveedor() {return "registraProveedor";}

	
	@PostMapping("/registraProveedor")
	@ResponseBody
	public Map<String, String> registra(Proveedor obj) {
		HashMap<String, String> map = new HashMap<String, String>();
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(1);
		Proveedor objSalida = proveedorService.insertaProveedor(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		} else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	@GetMapping("/buscaProveedorNombre")
	@ResponseBody
	public String validaProvedorNombre(String nombre) {
		List<Proveedor> lstSalida = proveedorService.listaPorNombreIgual(nombre);
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaProveedorDNI")
	@ResponseBody
	public String validaProvedorDNI(String dni) {
		List<Proveedor> lstSalida = proveedorService.listaPorDniIgual(dni);
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}

}
