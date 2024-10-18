DROP DATABASE IF EXISTS checks;
CREATE DATABASE checks;
use checks;

CREATE TABLE checks(
a INT CHECK (a>=3),
b,
c,
CHECK(b<10),
CHECK(a<>b),
CHECK(a<>b),
-- PARA DAR UN NOMBRE AL CHECK
CONSTRAINT chk_nombre CHECK (b >a AND b >c)
);


