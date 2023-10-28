package com.empresa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Empleado;
import com.empresa.service.EmpleadoService;

//1.Agregar un @
@Controller

public class EmpleadoConsultaController {
	
	//semana 10 luegp del implements -- 
	@Autowired
	private EmpleadoService service;
	
	//2.Agregamos el metodo para LISTAR
	@GetMapping("/verConsultaEmpleado") //esto llama a la pagina para que se ejecute
	public String verInicio() {
		return "consultaEmpleado";
		}
	
	//sem 10-- PARA LA CONSULTA
	@GetMapping("/consultaEmpleado")
	@ResponseBody
	public List<Empleado> listaEmpleado(int estado){
		List<Empleado> lstSalida = service.listaEmpleadoConsulta(estado);
		return lstSalida;
	}

}
