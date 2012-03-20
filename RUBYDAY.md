Domain On Rails
---------------

Abstract
--------
Durante lo sviluppo di un progetto web piuttosto esteso che sta durando da oltre un anno e mezzo ci si può
accorgere
La molti attori importanti della comunità Ruby/Rails stanno andando verso un raffinamento di principi di OO dell'object
orientation.


Idee in libertà
---------------
Lavorando full time su di un progetto Rails per più di un anno si comincia ad in cappare nei problemi
che riguardano lo sviluppo software in generale: manutenibilità che nel tempo decresce nonostante il
continuo refactoring, difficoltà nel testare dovuta al numero dei test ed alla loro lentezza. Ma non solo.
Ci si rende facilmente conto che alcune delle pratiche di object orientation e buona programmazione in
generale nel Rails più classico non sono rispettate o son lascaite totalmente in mano alle capacità
dell'utente. Esempi più comuni e controversi:
  gli helpers alla fine sono degli staticoni
  le variabili di istanza che fanno comunicare controller e view che rompono l'incapsulamento delle classi
  active record che come primo smell non permette un testing della logica di business senza testare anche il sql
  ovvero in totale isolamento dall'infrastruttura esterna come vorrebbero le architetture esagonali
    Perché questo è bene? Perché la bontà di un'architettura la si vede su quanto si riesce a rimandare le
    decisioni difficili. Rimandarle il più possibile permette di prendere le decisioni quando si hanno
    maggiori informazioni e quindi con una migliore consapevolezza. Ancora meglio sarebbe avere sempre un
    indicatore di quelle che sono le decisioni IRREVERSIBILI e che andranno a caratterizzare tutta
    l'applicazione e che il costo del loro cambiamento sarebbe insostenibile dai committenti.
    ...

  una volta stabilito che il dominio è centrale nelle applicazioni problema: spesso le tecniche di DDD
   sono pesanterrime e non sono sostenibili per domini piccoli. In java molto vero. Vero anche in ruby?
   Un'applicazione CLI piccola potrebbe essere più sensata crearla in stile totalmente procedurale più
   che OO. Ma al crescere anche minimo dell'applicazione e soprattutto alle prime modifiche dei requisiti
   ciò che può succedere è che occorre rivedere la struttura e quello che p[rima non era sensato vedere
   come un oggetto oggi è fondamentale che lo sia perché sia abbatsnaza robusto da sostenere un cambiamento.
   Caro amico che parlando mi disse: una fattura non è sempre la stessa entità in due differenti applicazioni
   ma muta al variare del business perché non è la REALTà la sono la migliore modellizzazione necessaria.


  Una volta che accettiamo tutto ciò facciamo la lista della spesa dei pattern e delle regole di coding
  che ci interessano all'interno della nostra applicazione:

  FactoryPattern - non voglio legarmi al modo in cui creo un oggetto
  Legge di Demetrio - non voglio chiamare catene di metodi
  Open Closed Principle
  DIP
  DCI - Uno Use case rappresentato da un oggetto.
  CQRS
  ...

  in un'applicazione la cosa più complessa è scegliere l'astrazione corretta del modello nel
  codice e contemporaneamente astrarre le parti giuste del modello tralasciando quelle che al momento non servono.
  dato che il modello è per definizione differente dalla realtà (londra modellizzata come
  mappa cartografica mappa geografica o pianta della metropolitana)

  Il dominio non deve dipendere da elementi esterni ed accessori come la sua visualizzazione (UI) o
  la sua persistenza. E per questo deve risultare testabile in isolamento con facilità


  In Rails ci sono molti alibi sul mancato utilizzo di principi e pattern che alla fine vengono al pettine.
  Clean Code - passiamo il tempo a leggere codice nostro e/o degli altri e molto meno tempo a scriverlo
  deve essere molto leggibile. E' sempre così in ruby? IL codice Rails è sempre molto leggibile?

  Esempi.

  Vediamo un po' di DDD. Concetti fondanti
  principi. Vediamo come sia possibile testare un'applicazione in pochissimo tempo tirando su la parte
  di rails che ci interessa.

  Testo l'infrastruttura che parla con il db? aggiungo dei tag che tirino su solo ar :persistence => true
  ho bisogno di tutta l'inizializzazione? tag :initialization => true
  sto testando il modello e rails non mi interessa? non metto tag!

  Divido secondo DCI il context (use case) dal behavior (mixin) dal dato (object) ecco come viene la
  mia applicazione.

  Creiamo adesso un blog.
  Facciamo una visualizzazione a riga di comando.
  Cambiamo la persistenza
  Creiamo Un videopost dopo aver creato un post.
  Andiamo più veloci? Perché?