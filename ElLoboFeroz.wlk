object lobo {
	var peso=10	
	
	method peso(){ return peso}
	method estaSaludable(){
		return (peso>20 and peso<150)
	}
	
	method aumentaPeso(cantidad){
		peso+=cantidad
	}
	
	method sufreCrisis(){
		peso=10
	}
	
	method come(algo){
		self.aumentaPeso(algo.peso()*0.1)
	}
	
	method correr(){
		peso-=1
	}
	method perderPeso(valor){
		peso = 0.max(peso- valor)
	}
	method escupe(algo){
		self.perderPeso(algo.peso()/10)
	}
	method soplar(casa){
		//peso-=casa.resistencia()+casa.ocupantes()*(cerdo.peso())
		peso=0.max(peso - (casa.resistencia()+casa.ocupantes()*(cerdo.peso())))
	}
}

object caperucita{
	var manzanas = 6
	method manzanas(){ return manzanas}
	method peso(){return 60+0.2*manzanas} 
	
	method perderManzana(){
		manzanas-=1//considero que solo se pierde una manzana a la vez y que nnuca se llama de 6 veces en total
	}
	method reset(){//vuelve las variable a posición inicial
		manzanas=6
	}
}

object abuelita{
	method peso() { return 50}
}

object cazador{
	method peso() {return 80} //Considero que el cazador pesa 80
}

object historiaCaperucita{
	method historia(){
		lobo.correr()
		lobo.correr()
		lobo.come(abuelita)
		caperucita.perderManzana()
		lobo.come(caperucita)
	}
	method final1(){ //lobo se como al cazador
		self.historia()
		lobo.come(cazador)
	} 
	method final2(){ //cazador le genera una crisis al lobo
		self.historia()
		lobo.sufreCrisis()
	}
	method final3(){ //rescata a la niña
		self.historia()
		lobo.escupe(caperucita)
	}
	method final4(){//rescata a la niña y a su abuela
		self.historia()
		self.final3()
		lobo.escupe(abuelita)
	}
	method reset(){
		self.final2()
		caperucita.reset()
	}
}

object solucionCaperucita{
	method resolver(){
		historiaCaperucita.reset()
		historiaCaperucita.final1()
		console.println("¿El lobo esta saludable si se come al cazador? " +(lobo.estaSaludable()).toString())
		historiaCaperucita.reset()
		historiaCaperucita.final2()
		console.println("¿El lobo esta saludable si le genera una crisis el cazador? " +(lobo.estaSaludable()).toString())
		historiaCaperucita.reset()
		historiaCaperucita.final3()
		console.println("¿El lobo esta saludable si el cazador rescata a caperucita? " +(lobo.estaSaludable()).toString())
		historiaCaperucita.reset()
		historiaCaperucita.final4()
		console.println("¿El lobo esta saludable si el cazador rescata a caperucita y a su abuela? " +(lobo.estaSaludable()).toString())
		historiaCaperucita.reset()
	}
}

object casaPaja{
	const resistencia =0
	var ocupantes=1
	
	method resistencia(){
		return resistencia
	}
	
	method ocupantes(){
		return ocupantes
	}
	
	method ocupantes(valor){
		ocupantes=valor
	}	
}

object casaMadera{
	const resistencia = 5
	var ocupantes=1
	
	method resistencia(){
		return resistencia
	}
	
	method ocupantes(){
		return ocupantes
	}
	
	method ocupantes(valor){
		ocupantes=valor
	}	
}

object casaLadrillos{
	const cantLadrillos = 1000
	var ocupantes=1
	
	method resistencia(){
		return 2*cantLadrillos
	}
	
	method ocupantes(){
		return ocupantes
	}
	
	method ocupantes(valor){
		ocupantes=valor
	}	
}

object cerdo{
	const peso=20 //considero que los cerditos siempre tiene un peso de 20
	method peso(){
		return peso
	}
}

object historiaCerditos{
	method historia(){
		lobo.soplar(casaPaja)
		casaPaja.ocupantes(0)
		casaMadera.ocupantes(2)
		lobo.soplar(casaMadera)
		}
	method final1(){//se como a los dos cerditos cuando intenta escapar
		self.historia()
		casaMadera.ocupantes(0)
		lobo.come(cerdo)
		lobo.come(cerdo)
		return lobo.estaSaludable()
	}
	method final2(){//los cerdos escapan a la casa de ladrillo y el lobo iintenta soplar la casa
		self.historia()
		casaMadera.ocupantes(0)
		casaLadrillos.ocupantes(3)
		lobo.soplar(casaLadrillos)
	}
	method reset(){
		lobo.sufreCrisis()
		casaPaja.ocupantes(1)
		casaMadera.ocupantes(1)
		casaLadrillos.ocupantes(1)
	}
}

object solucionCerditos{
	method resolver1(){
		historiaCerditos.reset()
		historiaCerditos.final1()
		console.println("¿El lobo esta saludable si se come a los dos cerditos? " +(lobo.estaSaludable()).toString())
		historiaCerditos.reset()
		historiaCerditos.final2()
		console.println("¿El lobo esta saludable si se escapna dos cerditos? " +(lobo.estaSaludable()).toString())
		historiaCerditos.reset()
	}
}
