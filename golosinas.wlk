object bombon {
    var property precio = 5
    var property peso = 15
    var property sabor = "frutilla"
    var property libreGluten = true

    method mordisco(){
       self.peso((peso * 0.8) - 1) 
    } 
}
object alfajor {
    var property peso = 300
    var property precio = 12
    var property  sabor = "chocolate"
    var property libreGluten = false  
    
    method mordisco(){
       self.peso((peso * 0.8)) 
    }
}

object caramelo {
     var property peso = 5
    var property precio = 1
    var property  sabor = "frutilla"
    var property libreGluten = true

    method mordisco(){
       self.peso((peso -1) )
    }
}

object chupetin{
     var property peso = 2
    var property precio = 7
    var property  sabor = "naranja"
    var property libreGluten = true

    method mordisco(){
    if (peso>2){
       self.peso((peso * 0.1) ) 
    }
       
    }
}

object oblea{
     var property peso = 250
    var property precio = 5
    var property  sabor = "vainilla"
    var property libreGluten = false

    method mordisco(){
    if (peso>70){
       self.peso((peso * 0.5) ) 
    }else{
       self.peso((peso * 0.25) )  
    }
       
    }
}

object chocolatin{
    var property peso = 0
    var property pesoInicial = 0
    var property precio = 0.50
    var property  sabor = "chocolate"
    var property libreGluten = false
  
    method precioPeso(){
        return self.pesoInicial() * self.precio()
    }

    method mordisco(){
        self.peso(peso - 2)
    }
       
    }

object golosinaB{
    var property golosinaBase = alfajor 
    var property pesoInicial = self.golosinaBase().peso()+4 
    var property pesoGlaseado = 4

    method goloBase(golob){
        golosinaBase = golob
    }

    method gusto() {
        return self.golosinaBase().sabor()
    }
    
    method precio() {
        return self.golosinaBase().precio()+2
    }

    method libreGluten() {
        return self.golosinaBase().libreGluten()
    }

    method mordisco() {
        self.golosinaBase().mordisco()

        if(self.pesoGlaseado()>=2) {
            return self.pesoGlaseado()-2
        } else {
            return 0
        }
    }       
}

object tutti {
    var property pesoInicial = 5
    var property peso = self.pesoInicial()
    var property libreGluten = false
    var property sabor = self.sabores().get(0) 
    const property sabores = ["frutilla", "chocolate", "naranja"] 
    var property index = 0 
    var property precio = 0
    
    method libre(gluten){
        libreGluten = gluten
    }

    method precio(){
        if(libreGluten != false){
            precio = 7 
            return  precio 
        }else{
            precio = 10
            return precio
        }
    }

    method mordisco() {
        self.index(self.index()+1)
        if(self.index()!=self.sabores().size()) {
            self.sabor(self.sabores().get(self.index()))
        } else {
            self.index(0)
            self.sabor(self.sabores().first())
        }
    }

}

// self.sabores().add(self.sabor)
// self.sabores.remove(self.sabor)
// self.sabor(self.sabores().first())

object mariano {
    const property bolsaGolosinas = [] 
    const property golosinasDesea = #{}

    method comprar(unagolosina){
        self.bolsaGolosinas().add(unagolosina)
    }
     
    method desechar(unaGolosina){
        self.bolsaGolosinas().remove(unaGolosina)
    }

    method probarGolosinas(){
        bolsaGolosinas.forEach({golosina => golosina.mordisco()})
    }

    method hayGolosinaSinTACC(){
      return bolsaGolosinas.forEach({golosina => golosina.libreGluten()}).contains(false)
    }

    method preciosCuidados(){
        return !(bolsaGolosinas.forEach({golosina => golosina.precio() <= 10 }).contains(false))  
    }

    method golosinaDeSaborPrimero(unSabor){
        return (bolsaGolosinas.filter({golosina => golosina.sabor()})).first()
    }

    method golosinaDeSaborTodos(unSabor) {
        return bolsaGolosinas.filter({golosina => golosina.sabor()})
    }

    
    method sabores() {
        return bolsaGolosinas.map({golosina => golosina.sabor()}).toSet()
    }

    method golosinaMasCara(){
        return (bolsaGolosinas.map({golosina => golosina.precio()})).max()
    }

    method pesoGolosinas(){
        return (bolsaGolosinas.map({golosina => golosina.peso()})).sum()
    }

    method golosinasFaltantes(golosinasDeseadas){
        return golosinasDesea.add(golosinasDeseadas)
    }
    
    }
    object julieta {
        method devolverGolosinas(golosina){
           mariano.golosinasDesea().remove(golosina)
        }
    }
