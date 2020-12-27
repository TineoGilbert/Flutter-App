
class Experiencias{
  List<Map<String, dynamic>> _expe;

  Experiencias._privado(){
    _expe = [];
  }


  List<Map<String, dynamic>> get misExperiencias{
    return _expe;
  }

  void agregarExperiencias(Map<String, dynamic> nuevaExperiencia){
    _expe.add(nuevaExperiencia);
  }
















  static final Experiencias _instancia = Experiencias._privado();

  factory Experiencias(){
    return _instancia;
  }
}














