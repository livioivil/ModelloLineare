pkgname <- "TextWiller"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('TextWiller')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("RTHound")
### * RTHound

flush(stderr()); flush(stdout())

### Name: RTHound
### Title: RTHound
### Aliases: RTHound
### Keywords: ~kwd1 ~kwd2

### ** Examples

 ## Not run: 
##D  testo=c(
##D  "RT @LAVonlus: Tre miti da sfatare sulla #vivisezione. Le risposte  ai luoghi comuni della sperimentazione animale  http://t.co/zHSfam16DT",
##D  "Tre miti da sfatare sulla #vivisezione. Le risposte  ai luoghi comuni della sperimentazione animale  http://t.co/zHSfam16DT",
##D  "RT @LAVonlus: Tre miti da sfatare sulla #vivisezione. Le risposte  ai luoghi comuni della sperimentazione animale  http://t.co/zHSfam16DT",
##D  "RT @orianoPER: La #sperimentazioneanimale è inutile perché non predittiva per la specie umana. MEDICI ANTI #VIVISEZIONE- LIMAV http://t.co/" ,
##D  "La #sperimentazioneanimale è inutile perché non predittiva per la specie umana. MEDICI ANTI #VIVISEZIONE- LIMAV http://t.co/3MwubXIH8g",
##D  "RT @orianoPER: La #ricerca in #Medicina con #sperimentazioneanimale non e' predittiva per la specie umana. MEDICI ANTI #VIVISEZIONE http://t",
##D  "RT @HuffPostItalia: Il Governo italiano non fermi la sperimentazione animale. Intervista a Elena Cattaneo http://t.co/q1dm430a9j",
##D  "RT @HuffPostItalia: \"Il Governo italiano non fermi la sperimentazione animale\". Intervista a Elena Cattaneo http://t.co/q1dm430a9j",
##D  "\"Il Governo italiano non fermi la sperimentazione animale\". Intervista a Elena Cattaneo http://t.co/q1dm430a9j",
##D  "RT @orianoPER: @EnricoLetta LA #VIVISEZIONE NON SERVE: PAROLA DI GLAXO-APTUIT http://t.co/mtsHJjDIvu #StopVivisection #SperimentazioneAnima&")
##D  
##D  testo=RTHound(testo, S = 3, L = 1, 
##D                  hclust.dist = 100, hclust.method = "complete",
##D                  showTopN=3)
##D 
## End(Not run)



cleanEx()
nameEx("TextWiller-package")
### * TextWiller-package

flush(stderr()); flush(stdout())

### Name: TextWiller-package
### Title: Collection of functions for text mining, specially devoted to
###   the italian language
### Aliases: TextWiller-package TextWiller
### Keywords: package

### ** Examples

 ## Not run: 
##D # install.packages("devtools") # if you don't already have it.
##D library(devtools)
##D install_github("TextWiller", "livioivil")
##D library(TextWiller)
## End(Not run)

normalizzaTesti(c('ciao bella!','www.associazionerospo.org','noooo, che grandeeeeee!!!!!','mitticooo', 'mai possibile?!?!'))

sentiment(c("ciao bella!","farabutto!","fofi sei figo!"))

classificaUtenti(c('livio','alessandra'))

#extract short urls and get the long ones
## Not run: urls=urlExtract("Influenza Vaccination | ONS - Oncology Nursing Society http://t.co/924sRKGBU9 See All http://t.co/dbtPJRMl00")

#extract users:
## Not run: extract("@livio: #ciao","@\w+")




cleanEx()
nameEx("classificaUtenti")
### * classificaUtenti

flush(stderr()); flush(stdout())

### Name: classificaUtenti
### Title: Associa i nomi in names ai valori indicati da
###   vocabolarioNomiPropri
### Aliases: classificaUtenti vocabolarioNomiPropri vocabolarioLuoghi
### Keywords: ~kwd1 ~kwd2

### ** Examples

 ## Not run: data(vocabolarioNomiPropri)
 ## Not run: str(vocabolarioNomiPropri)
classificaUtenti(c('livio','alessandra'))
data(vocabolarioLuoghi)
classificaUtenti(c('Bosa','Pordenone, Italy'),vocabolarioLuoghi)



cleanEx()
nameEx("extract")
### * extract

flush(stderr()); flush(stdout())

### Name: extract
### Title: Estrazione di regular expression (e quindi users, hashtag) e
###   shorturl
### Aliases: urlExtract shorturl2url patternExtract
### Keywords: ~kwd1 ~kwd2

### ** Examples

 ## Not run: 
##D  testo=c("Influenza Vaccination | ONS - Oncology Nursing Society http://t.co/924sRKGBU9 See All http://t.co/dbtPJRMl00,See All http://t.co/dbtPJRMl00")
##D  shorturl2url(testo,id=names(testo))
##D urls=urlExtract(testo)
##D patternExtract(c("@luca @paolo: buon giorno!", "@matteo: a te!"), pattern="@\w+")
## End(Not run)



cleanEx()
nameEx("normalizzaTesti")
### * normalizzaTesti

flush(stderr()); flush(stdout())

### Name: normalizzaTesti
### Title: Varie funzioni di normalizzazione del testo
### Aliases: normalizzaTesti normalizzacaratteri normalizzaemote
###   normalizzahtml normalizzaslang normalizzapunteggiatura tryTolower
###   itastopwords removeStopwords preprocessingEncoding
### Keywords: ~kwd1 ~kwd2

### ** Examples

testoNorm <- normalizzaTesti(c('ciao bella!','www.associazionerospo.org','noooo, che grandeeeeee!!!!!','mitticooo', 'mai possibile?!?!'))
testoNorm
attr(testoNorm,"counts")



cleanEx()
nameEx("sentiment")
### * sentiment

flush(stderr()); flush(stdout())

### Name: sentiment
### Title: Performs sentiment analysis
### Aliases: sentiment sentimentVocabularies vocabolariMadda
### Keywords: ~kwd1 ~kwd2

### ** Examples

sentiment(c("ciao bella", "ciao", "good","casa", "farabutto!"))



cleanEx()
nameEx("timeStamp")
### * timeStamp

flush(stderr()); flush(stdout())

### Name: TimeStamp
### Title: Funzioni di gestione delle date
### Aliases: fixTimeStamp selezionaIntervalloTimeStamp
### Keywords: ~kwd1 ~kwd2

### ** Examples

 ## Not run: TW=fixTimeStamp(TW)
 ## Not run: TW=selezionaIntervallo(TW,as.POSIXct(c("2013-12-27 17:54:42 CET", "2013-12-27 22:33:38 CET")))
 ## Not run: TW$created.round <- as.POSIXct(round(t$created,"hour"))





### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
