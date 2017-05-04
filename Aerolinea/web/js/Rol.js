/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Rol(codigo,descripcion){
	this.Rol(codigo,descripcion);
}
Rol.prototype={
	Rol:function(codigo,descripcion){
		this.codigo=codigo;
		this.descripcion=descripcion;
	}
}
