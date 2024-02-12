
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns


df = pd.read_csv("dataset_climatico.csv")
#print(df)


'''
1. Normalizzazione dei Dati: 

#Pulire i dati per rimuovere eventuali valori mancanti o errati. 
'''
# Rimuovi righe contenenti valori mancanti
df = df.dropna()

# Converte le date in formato datetime
df["data_osservazione"] = pd.to_datetime(df["data_osservazione"])




'''
#Applicare la normalizzazione Z-score alla 
temperatura_media, precipitazioni, umidità e velocità_vento per standardizzarle.
'''

# Seleziona le colonne 
colonne_norm = ["temperatura_media", "precipitazioni", "umidita", "velocita_vento"]

# Calcola la media e la deviazione standard delle colonne selezionate
media = df[colonne_norm].mean()
deviazione_standard = df[colonne_norm].std()

# Applica la normalizzazione Z-score utilizzando la formula
df[colonne_norm] = (df[colonne_norm] - media) / deviazione_standard

# Visualizza le prime righe del DataFrame dopo la normalizzazione
print(df.head())




'''
2. Analisi Esplorativa dei Dati: 

Calcolare statistiche descrittive (media, mediana, deviazione standard) per ogni variabile. 
'''

# Calcola statistiche descrittive per ogni variabile
statistiche = df.describe()

# Visualizza le statistiche descrittive
print(statistiche)




'''
Creare grafici (istogrammi, box plots) per visualizzare la distribuzione di ciascuna variabile normalizzata.
'''

# Crea un istogramma e un boxplot per ogni variabile
for colonna in colonne_norm:
    plt.figure(figsize=(10, 4))
    # Istogramma
    plt.subplot(1, 2, 1)
    sns.histplot(df[colonna], bins=30, kde=True)
    plt.title('Istogramma di ' + colonna)
    # Box plot
    plt.subplot(1, 2, 2)
    sns.boxplot(x=df[colonna])
    plt.title('Box plot di ' + colonna)
    plt.show()





'''
3. Analisi di Correlazione:
 
Utilizzare una heatmap per visualizzare la correlazione tra le diverse variabili meteorologiche. 
'''

# Seleziona solo le colonne numeriche desiderate
colonne_numeriche = ["temperatura_media", "precipitazioni", "umidita", "velocita_vento"]
#df_numerico = df[colonne_numeriche]

# Calcola la matrice di correlazione tra le variabili
matrice_correlazione = df[colonne_numeriche].corr()

# Crea una heatmap della matrice di correlazione
plt.figure(figsize=(10, 8))
sns.heatmap(matrice_correlazione, annot=True, cmap='coolwarm', fmt=".2f", linewidths=.5)
plt.title('Heatmap della Correlazione tra Variabili Meteorologiche')
plt.show()


corr=df["temperatura_media"].corr(other=df["precipitazioni"])
print(corr)





'''
Identificare eventuali correlazioni significative (es. tra temperatura e umidità).
'''


# Calcola la correlazione tra "temperatura_media" e "umidità"
corr_temperatura_umidita = df["temperatura_media"].corr(other=df["umidita"])
# Visualizza il valore di correlazione
print(f"Correlazione tra temperatura_media e umidita: {corr_temperatura_umidita}")


# Calcola la correlazione tra "temperatura_media" e "precipitazioni"
corr_temperatura_precipitazioni = df["temperatura_media"].corr(other=df["precipitazioni"])
# Visualizza il valore di correlazione
print(f"Correlazione tra temperatura_media e precipitazioni: {corr_temperatura_precipitazioni}")


# Calcola la correlazione tra "velocita_vento" e "precipitazioni"
corr_vento_precipitazioni = df["velocita_vento"].corr(other=df["precipitazioni"])
# Visualizza il valore di correlazione
print(f"Correlazione tra velocita_vento e precipitazioni: {corr_vento_precipitazioni}")



# Creazione di un grafico di dispersione tra "temperatura_media" e "precipitazioni"
plt.figure(figsize=(8, 6))
sns.scatterplot(x="temperatura_media", y="precipitazioni", data=df)
plt.title('Grafico di Dispersione tra Temperatura Media e Precipitazioni')
plt.xlabel('Temperatura Media')
plt.ylabel('Precipitazioni')
plt.show()

# Creazione di un grafico di regressione lineare con correlazione annotata
plt.figure(figsize=(8, 6))
#sns.regplot(x="temperatura_media", y="precipitazioni", data=df)     # oppure come sotto
sns.regplot(x=df["temperatura_media"], y=df["precipitazioni"])
plt.title('Grafico di Regressione tra Temperatura Media e Precipitazioni')
plt.xlabel('Temperatura Media')
plt.ylabel('Precipitazioni')
plt.show()


