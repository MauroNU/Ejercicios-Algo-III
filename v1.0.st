!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:55:36'!
intentarReproducirse
	HabitatDeAvispas cantidadDeHuevosDeAvispaOmega > 0 ifTrue:  [self robarHuevoOmega].
		
	HabitatDeAvispas cantidadDeHuevosDeAvispaPi > 0 ifTrue: [self robarHuevoPi]! !

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:52:59'!
robarHuevoOmega
	HabitatDeAvispas cambiarLineaGeneticaDeOmegaALambda.! !

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:53:55'!
robarHuevoPi
	HabitatDeAvispas cambiarLineaGeneticaDePiALambda.! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'BS 4/21/2022 20:20:36'!
comerUnaOruga
	HabitatDeAvispas quitarUnaOruga.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:42:34'!
intentarReproducirse
	HabitatDeAvispas cantidadDeOrugas > 0 ifTrue: [
		self comerUnaOruga.
		HabitatDeAvispas agregarUnHuevoDeAvispaOmega.
	]! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:38:39'!
comerUnaPolilla
	HabitatDeAvispas quitarUnaPolilla.! !

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:42:38'!
intentarReproducirse
	HabitatDeAvispas cantidadDePolillas > 0 ifTrue: [
		self comerUnaPolilla.
		HabitatDeAvispas agregarUnHuevoDeAvispaPi.
	]
	! !


!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeOrugas cantidadDeHuevosDeAvispaOmega cantidadDeHuevosDeAvispaPi cantidadDeHuevosDeAvispaLambda cantidadDePolillas'!

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:52:09'!
agregarUnHuevoDeAvispa
	cantidadDeHuevosDeAvispa := cantidadDeHuevosDeAvispa + 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:41:55'!
agregarUnHuevoDeAvispaOmega
	cantidadDeHuevosDeAvispaOmega := cantidadDeHuevosDeAvispaOmega + 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:42:04'!
agregarUnHuevoDeAvispaPi
	cantidadDeHuevosDeAvispaPi := cantidadDeHuevosDeAvispaPi + 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:40:19'!
agregarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:31:45'!
agregarUnaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:52:28'!
cambiarLineaGeneticaDeOmegaALambda
	cantidadDeHuevosDeAvispaLambda := cantidadDeHuevosDeAvispaLambda + 1.
	cantidadDeHuevosDeAvispaOmega := cantidadDeHuevosDeAvispaOmega - 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:52:42'!
cambiarLineaGeneticaDePiALambda
	cantidadDeHuevosDeAvispaLambda := cantidadDeHuevosDeAvispaLambda + 1.
	cantidadDeHuevosDeAvispaPi := cantidadDeHuevosDeAvispaPi - 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 14:29:45'!
cantidadDeHuevosDeAvispaLambda
	^cantidadDeHuevosDeAvispaLambda ! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:43:40'!
cantidadDeHuevosDeAvispaOmega
	^cantidadDeHuevosDeAvispaOmega! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:43:47'!
cantidadDeHuevosDeAvispaPi
	^cantidadDeHuevosDeAvispaPi! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/23/2022 13:47:01'!
cantidadDeHuevosDeAvispas	| cantidadTotalDeHuevosDeAvispa |.
	cantidadTotalDeHuevosDeAvispa := cantidadDeHuevosDeAvispaOmega + cantidadDeHuevosDeAvispaPi.
	^cantidadTotalDeHuevosDeAvispa ! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/21/2022 20:23:05'!
cantidadDeOrugas
	^cantidadDeOrugas ! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:37:41'!
cantidadDePolillas
	^cantidadDePolillas.
	! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/25/2022 09:36:35'!
eliminarHuevos
	cantidadDeHuevosDeAvispaOmega := 0.
	cantidadDeHuevosDeAvispaPi := 0.
	cantidadDeHuevosDeAvispaLambda := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/21/2022 20:22:30'!
eliminarOrugas
	cantidadDeOrugas := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:32:42'!
eliminarPolillas
	cantidadDePolillas := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'BS 4/21/2022 20:21:12'!
quitarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'MU 4/22/2022 12:35:41'!
quitarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'MU 4/25/2022 09:40:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 0.
	cantidadDeHuevosDeAvispaOmega := 0.
	cantidadDeHuevosDeAvispaPi := 0.
	cantidadDeHuevosDeAvispaLambda := 0.
	cantidadDePolillas := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'BS 4/21/2022 19:50:34'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'BS 4/21/2022 19:50:34'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'BS 4/21/2022 19:50:34'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'BS 4/21/2022 19:50:34'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'BS 4/21/2022 19:50:34'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'BS 4/21/2022 19:50:34'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'BS 4/21/2022 19:50:34'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'BS 4/21/2022 19:50:34'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/25/2022 09:37:33'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ HabitatDeAvispas cantidadDeHuevosDeAvispaLambda.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/23/2022 13:49:35'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ HabitatDeAvispas cantidadDeHuevosDeAvispaOmega.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/23/2022 13:51:05'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ HabitatDeAvispas cantidadDeHuevosDeAvispaOmega.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/23/2022 13:50:24'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ HabitatDeAvispas cantidadDeHuevosDeAvispaPi.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/21/2022 19:51:33'!
habitat
	^HabitatDeAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:42:18'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas.
	self queElHabitatTengaDosPolillasMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/23/2022 14:54:47'!
laAvispaLara	^AvispaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/21/2022 20:07:44'!
laAvispaOriana
	^AvispaOriana ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/23/2022 13:35:35'!
laAvispaOrnella
	^AvispaOrnella ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:10:09'!
laAvispaPolly
	^AvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'BS 4/21/2022 20:25:20'!
queElHabitatTengaDosOrugasMas
	self queElHabitatTengaUnaOrugaMas.
	self queElHabitatTengaUnaOrugaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:43:28'!
queElHabitatTengaDosPolillasMas
	self queElHabitatTengaUnaPolillaMas.
	self queElHabitatTengaUnaPolillaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:40:19'!
queElHabitatTengaUnaOrugaMas
	HabitatDeAvispas agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:33:16'!
queElHabitatTengaUnaPolillaMas
	HabitatDeAvispas agregarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MU 4/22/2022 12:32:15'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatDeAvispas eliminarHuevos.
	HabitatDeAvispas eliminarOrugas.
	HabitatDeAvispas eliminarPolillas.! !

HabitatDeAvispas initializeAfterFileIn!