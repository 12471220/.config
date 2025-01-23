1. 用idea自带的数据库工具连接mysql数据库时，会出现如下错误：
- 错误信息：
    ```
    DBMS: Amazon Aurora MySQL (no ver.)
    Case sensitivity: plain=mixed, delimited=exact
    [S1009] RSA public key is not available client side (option serverRsaPublicKeyFile not set).
    ```
- 解决方法：在连接数据库的时候，选择MySQL，而不是Amazon Aurora MySQL。
- 问题原因：Amazon Aurora MySQL是亚马逊自家的数据库，可能有一些特殊的配置，导致idea无法连接。
