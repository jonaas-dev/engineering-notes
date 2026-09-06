# Amazon Prime Video: de serverless a monolito (90% de estalvi)

Source: [Prime Video Tech](https://www.primevideotech.com/video-streaming/scaling-up-the-prime-video-audio-video-monitoring-service-and-reducing-costs-by-90) — Amazon Prime Video team, 2023.

## El servei

Prime Video necessita monitorar la qualitat de milers de streams en directe:
detecció de congelació de vídeo, corrupció, problemes de sincronització.
El procés té tres passos: conversor de mitjans, detector de defectes,
i notificació en temps real.

## L'arquitectura original (serverless)

Cada component era un Lambda o Step Function:
- El conversor de mitjans guardava frames a S3
- El detector de defectes descarregava de S3, processava, pujava resultats
- Una funció d'orquestació coordinava el pipeline

**Problemes:**
1. **Cost d'orquestació.** Step Functions cobra per state transitions —
   i l'orquestació feia múltiples transitions cada segon.
2. **Cost de transferència de dades.** Passar dades via S3 entre components
   era car amb volum alt.
3. **Límits d'escalat.** Van topar al 5% de la càrrega esperada.

## L'arquitectura nova (monolito)

Els tres components es van empaquetar en un sol procés:
- Conversor i detector dins del mateix procés → dades en memòria, sense S3
- Escalat vertical (servidors més grans)
- Layer d'orquestració lleuger

**Resultat:** 90% de reducció de costos.

## El debat real

Això **no vol dir que els microservicis siguin dolents**. Vol dir que
l'elecció arquitectònica depèn del cas d'ús:

| Quan serverless/microservicis | Quan monolito |
|---|---|
| Components amb necessitats d'escalat independents | Components que comparteixen dades intensament |
| Equips separats desplegant de forma independent | Pipeline on la comunicació intra-component és el coll d'ampolla |
| Càrrega previsible o tolerant a latència | Càrrega que exigeix baixa latència entre passos |

## Quotes

> "Building evolvable software systems is a strategy, not a religion.
> And revisiting your architectures with an open mind is a must."
> — Werner Vogels, Amazon CTO

> "The Prime Video team had followed a path I call Serverless First.
> I don't advocate Serverless Only."
> — Adrian Cockcroft, ex-Amazon VP Sustainability

## Takeaway

No adoptis microservicis perquè "està de moda". Analitza si els teus
components realment necessiten escalat independent. Si la comunicació
entre ells és intensa, un monolito pot ser més barat i més fàcil
d'operar.
