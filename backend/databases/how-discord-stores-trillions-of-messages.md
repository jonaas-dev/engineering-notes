# How Discord Stores Trillions of Messages

Source: [Discord Engineering Blog](https://discord.com/blog/how-discord-stores-trillions-of-messages) — Bo Ingram, March 2023.

## El problema

En 2017, Discord corria 12 nodes de Cassandra emmagatzemant bilions de missatges.
El 2022, eren 177 nodes amb trilions. El cluster era un sistema de alt toil:
l'on-call team era cridat constantment, la latència era imprevisible, i les
operacions de manteniment s'havien tornat massa cares.

## Per què Cassandra fallava

- **Lectures més cares que escriptures.** Les lectures necessiten consultar la
  memtable i potencialment múltiples SSTables. Quan un canal rep molt tràfic
  (un "hot partition"), la latència escala i afecta tot el node.
- **Compaction endarrerida.** Les SSTables s'acumulaven, degradant les lectures
  i causant cascades de latència.
- **GC pauses del JVM.** El garbage collector de Java causava picos de latència
  que requerien reinicis manuals del node.
- **Escalat manual.** De 12 a 177 nodes, cada un era una peça mòbil que requeria
  cura i coordinació.

## La solució: ScyllaDB + Rust

**ScyllaDB** (compatible amb Cassandra però escrit en C++):
- Sense garbage collector → elimina una de les fonts més importants de latència
- Shard-per-core → millor aïllament de càrregues
- Reparacions i consistència més eficients

**Data services en Rust** (intermediaris entre l'API i la base de dades):
- Request coalescing: si múltiples usuaris demanen la mateixa fila, es consulta
  la BD un sol cop
- Routing consistent per hash → redueix spikes de tràfic
- Sense lògica de negoci — només fan de buffer

## La migració

- Dual-write a Cassandra i ScyllaDB
- Migrador reescrit en Rust → de 3 mesos a **9 dies**
- Velocitat: 3.2 milions de missatges/segon
- Validació automàtica: lectures comparades a ambdues bases
- Zero downtime

## Resultats

| Mètrica | Cassandra | ScyllaDB |
|---|---|---|
| Nodes | 177 | 72 |
| Disk per node | ~4 TB | 9 TB |
| p99 lectura històrica | 40-125ms | 15ms |
| p99 inserció | 5-70ms | 5ms |

## Takeaway

L'elecció de base de dades decideix la realitat operacional. El dolor de
Discord (GC, compaction, tombstones) i les seves guanyes (coalescing,
super-disks) viuen per sota de la capa de queries. Canviar de BD no és
un capritx — és una inversió que es paga en estabilitat i cost operacional.
