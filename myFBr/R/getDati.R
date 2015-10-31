#funzione per ricevere i dati anagrafici e dataset dei messaggi della singola persona
getDati <- function(percorso){
  a=getAnagrafica(percorso)
  per=paste(percorso,"/html/messages.htm", sep="")
  m=getMessaggi(per)
  return(c(a,m))
}
