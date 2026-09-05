# How slow is SELECT *?

Source: <https://medium.com/@hnasr/how-slow-is-select-8d4308ca1f0c>
Steps:

- Read Page
- Deserialize inline columns
- External Storage (e.g. TOAST)
- Network transmission
- Client Deserialization

## Kiss Index-Only Scans Goodbye

- Using SELECT * means that the database optimizer cannot choose index-only scans

:warning: Para obtener por ejemplo los identificadores de los estudiantes, no tendrias que acceder a todas las paginas. Pero usar * fuerza a tener mas E/S para devolver la información que se ha pedido.

## Deserialization Cost

- Deserialization, or decoding, is the process of converting raw bytes into data types.

:warning: When you perform a SELECT * query, the database needs to deserialize all columns, even those you may not need for your specific use case.

## Not All Columns Are Inline

 Large columns, such as text or blobs, may be stored in external tables and only retrieved when requested (Postgres TOAST tables are example).

## Network Cost

Before the query result is sent to the client, it must be serialized according to the communication protocol supported by the database. The more data needs to be serialized, the more work is required from the CPU. After the bytes are serialized, they are transmitted through TCP/IP. The more segments you need to send, the higher the cost of transmission, which ultimately affects network latency.

## Client Deserialization

Once the client receives the raw bytes, the client app must deserialize the data to whatever language the client uses, adding to the overall processing time. The more data is in the pipe the slower this process.

## Unpredictability

:warning: Cambios en la tabla puede generar problemas. Imagina que el select devuelve dos enteros de manera ultrarápida pero, si decides añadir un campo blob, se verá afectada la velocidad.

## Summary

In conclusion, a SELECT \* **query involves many complex processes**, so it’s best to only select the fields you need to avoid unnecessary overhead. Keep in mind that if your table has few columns with simple data types, the overhead of a SELECT* query might be negligible. However, it’s generally good practice to be selective about the columns you retrieve in your queries.
