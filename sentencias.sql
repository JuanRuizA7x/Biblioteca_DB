-- Eliminación de la base de datos
DROP DATABASE IF EXISTS biblioteca;
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca;
-- Selección de la base de datos
USE biblioteca;

-- Creación de la tabla autores
CREATE TABLE IF NOT EXISTS autores(
    autor_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F') NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creación de la tabla libros
CREATE TABLE IF NOT EXISTS libros(
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(1000),
    paginas INTEGER UNSIGNED NOT NULL DEFAULT 0,
    anio_publicacion INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

-- Inserción de registros en la tabla autores
INSERT INTO autores(nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES
    ('Gabriel', 'García Márquez', 'M', '1927-03-06', 'Colombia'),
    ('Jorge Luis', 'Borges', 'M', '1899-08-24', 'Argentina'),
    ('Charles', 'Dickens', 'M', '1812-02-07', 'Inglaterra'),
    ('Franz', 'Kafka', 'M', '1883-07-03', 'Austria'),
    ('Jane', 'Austen', 'F', '1775-12-16', 'Inglaterra');

-- Inserción de registros en la tabla libros
INSERT INTO libros(autor_id, titulo, descripcion, anio_publicacion)
VALUES
    (1, 'Cien años de soledad', 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez, ganador del Premio Nobel de Literatura en 1982. Es considerada una obra maestra de la literatura hispanoamericana y universal, así como una de las obras más traducidas y leídas en español.', 1967),
    (1, 'El amor en los tiempos del cólera', 'Es una novela dedicada al verdadero amor. La novela se inspiró en la forma en que se desarrolló la relación de los padres de García Márquez. Para escribirla se entrevistó durante varios días con sus padres, cada uno por separado, para encontrar más detalles de cómo iba a escribir la novela.', 1985),
    (1, 'Crónica de una muerte anunciada', 'La novela representó un acercamiento entre lo periodístico, lo narrativo, y una aproximación a la novela policial. La historia contada se inspira en un suceso real, ocurrido en 1951 en el municipio de Sucre, ubicado al sur del departamento Homónimo, del que el autor tomó la acción central (el crimen), los protagonistas, el escenario y las circunstancias, alterándolo narrativamente, pero sin descuidar nunca los datos y las precisiones obligadas en toda crónica periodística.', 1981),
    (2, 'Ficciones', 'Ficciones es un libro de cuentos escrito por Jorge Luis Borges, publicado en 1944 y compuesto de dos partes: El jardín de senderos que se bifurcan y Artificios; posee dos prólogos.', 1944),
    (2, 'La biblioteca de Babel', 'La biblioteca de Babel es un cuento del escritor argentino Jorge Luis Borges. Fue publicado por primera vez en la colección de relatos El jardín de senderos que se bifurcan (1941), colección que más tarde fue incluida en Ficciones (1944). La biblioteca parece ser infinita a la vista de un ser humano común, pero al tener un límite de 410 páginas por libro, 40 renglones por página y 80 símbolos por renglón el número de posibilidades es vasto pero finito. El relato es la especulación de un universo compuesto de una biblioteca de todos los libros posibles, en la cual sus libros están arbitrariamente ordenados, o sin orden, y preexiste al hombre.', 1944),
    (2, 'Labyrinths', 'Labyrinths (1962, 1964, 1970, 1983) es una colección de cuentos y ensayos del escritor Jorge Luis Borges . Fue traducido al inglés, publicado poco después de que Borges ganó el Premio Internacional de Editores con Samuel Beckett.', 1962),
    (3, 'Tiempos difíciles', 'Tiempos difíciles es la décima novela escrita por Charles Dickens. Se publicó por primera vez en 1854 y transcurre en Inglaterra durante la primera industrialización. Su título original en inglés es Hard Times for This Times. Se publicó inicialmente de forma periódica en la revista Household Words, dirigida por el propio Dickens, entre el 1 de abril y el 12 de agosto de 1854.', 1854),
    (3, 'David Copperfield (novela)', 'David Copperfield es la octava novela escrita por Charles Dickens. Fue publicada por entregas en 1849, y en forma de libro en 1850.', 1839),
    (3, 'Grandes esperanzas', 'Grandes esperanzas (en inglés, Great Expectations) es una novela escrita por Charles Dickens. Fue publicada como serie, desde el 1 de diciembre de 1860 hasta agosto de 1861, en la revista literaria All the Year Round, que había sido fundada por el propio Dickens el año anterior.', 1860),
    (4, 'La metamorfosis', 'La metamorfosis (Die Verwandlung, en su título original en alemán) es un relato de Franz Kafka publicado en 1915 y que narra la historia de Gregorio Samsa, un comerciante de telas que mantiene a su familia con su sueldo, hasta que tras una noche que no recuerda, amanece convertido en un enorme insecto parecido a una cucaracha.', 1915),
    (4, 'El castillo (novela)', 'El castillo (Das Schloß) es una novela del escritor austrohúngaro Franz Kafka (1883-1924). Publicada póstumamente en 1926, se trata de una obra inconclusa que Kafka había empezado a escribir en enero de 1922.', 1926),
    (4, 'América (novela)', 'América (Amerika en alemán original, también conocida como «The Stoker», «El fogonero», o «El desaparecido») es una novela del escritor Franz Kafka, iniciada en 1911 que dejó inconclusa en 1912 y publicada póstumamente en 1927.', 1927),
    (5, 'Orgullo y prejuicio (novela)', 'Orgullo y prejuicio (en inglés, Pride and Prejudice), publicada por primera vez el 28 de enero de 1813 como una obra anónima, es la más famosa de las novelas de Jane Austen y una de las primeras comedias románticas en la historia de la novela. Su primera frase es, además, una de las más famosas en la literatura inglesa: «Es una verdad mundialmente reconocida que un hombre soltero, poseedor de una gran fortuna, necesita una esposa».', 1813),
    (5, 'Emma', 'Emma es una novela cómica escrita por Jane Austen, en inglés, publicada por vez primera en 1815 por el editor John Murray, sobre los peligros de malinterpretar el romance. El personaje principal, Emma Woodhouse, se describe como "hermosa, lista y rica" pero también es bastante mimada. Antes de comenzar la novela, Austen escribió: "Voy a elegir una heroína que, excepto a mí, no gustará mucho".', 1815),
    (5, 'Sense and Sensibility', 'Sense and Sensibility, título original en inglés, también conocida como Sensatez y sentimientos, Juicio y sentimiento, Juicio y sensibilidad o Sentido y sensibilidad, es una novela de la escritora británica Jane Austen publicada en 1811. Fue la primera de las novelas de Austen en ser publicadas, bajo el seudónimo de "A Lady" (una dama). Ha sido adaptada para el cine y la televisión numerosas veces, destacando la versión de Ang Lee en 1995.', 1811);

-- Agregación de columna num_paginas y num_ventas
ALTER TABLE libros ADD ventas INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER anio_publicacion;

-- Creación de funciones que llenan automáticamente las comunas paginas y ventas
DELIMITER //

CREATE FUNCTION obtener_paginas()
RETURNS INTEGER
BEGIN RETURN FLOOR(60 + (RAND() * 500));
END//

CREATE FUNCTION obtener_ventas()
RETURNS INTEGER
BEGIN RETURN FLOOR(0 + (RAND() * 10000000));
END//

DELIMITER ;

-- Inserción de datos en las columnas paginas y ventas
UPDATE libros SET paginas = obtener_paginas(), ventas = obtener_ventas();
