// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.10;

 
contract TP
{
  string private _nombre;
 
  string private _apellido;
 
  string private _curso;
 
  address private _docente;
 
  mapping(string => uint) private  _notas_materias;
 
  string[] private _materias; 

  constructor(string memory nombre , string memory apellido, string memory curso)
  {
     _nombre = nombre;
 
     _apellido = apellido;
 
     _curso = curso;
 
     _docente = msg.sender;
  }
 
  function Apellido() public view returns(string memory)
  {
      return _apellido;
  }
 
  function nombre_completo() public view returns(string memory)
  {
     return string(abi.encodePacked(_nombre, " ", _apellido));
  }
 
  function Curso() public view returns(string memory)
  {
      return _curso;
  }
 
  // materia es un int que va del 1 - 100
  function set_nota_materia(uint nota, string memory materia) public
  {
     require(_docente == msg.sender, "solo el docente puede settear materias");
     _materias.push(materia);
     _notas_materias[materia] = nota;
  }
 
  function nota_materia(string memory materia) public view returns(uint)
  {
      return _notas_materias[materia];
  }
 
  function aprobo(string memory materia) public view returns(bool)
  {
     bool b_aprobo = true;

     if(_notas_materias[materia] < 60)
     {
        b_aprobo = false;
     }

      return b_aprobo;
  }
 
  function promedio() public view returns(uint)
  {
     uint notas_f = 0;
     for(uint i = 0; i < _materias.length; ++i)
     {
        notas_f += _notas_materias[_materias[i]];
     }
     notas_f /= _materias.length;
     return notas_f;
  }
}
