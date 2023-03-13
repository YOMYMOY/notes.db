-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Clase_30_PG
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Clase_30_PG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clase_30_PG` DEFAULT CHARACTER SET utf8 ;
USE `Clase_30_PG` ;

-- -----------------------------------------------------
-- Table `Clase_30_PG`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clase_30_PG`.`users` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clase_30_PG`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clase_30_PG`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `created_date` DATE NOT NULL,
  `modificated_date` DATE,
  `description` TEXT NOT NULL,
  `can_delete` TINYINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Clase_30_PG`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clase_30_PG`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clase_30_PG`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clase_30_PG`.`categories_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clase_30_PG`.`categories_notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notes_id` INT NOT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_idx` (`notes_id` ASC) VISIBLE,
  INDEX `fk_categories_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes`
    FOREIGN KEY (`notes_id`)
    REFERENCES `Clase_30_PG`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `Clase_30_PG`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- LLenado de tabla USERS

insert into users (id, name, email) values (1, 'Reba', 'rwhittam0@businesswire.com');
insert into users (id, name, email) values (2, 'Madalyn', 'mtooth1@chron.com');
insert into users (id, name, email) values (3, 'Iver', 'isherborn2@flavors.me');
insert into users (id, name, email) values (4, 'Rozalin', 'rnorthley3@theatlantic.com');
insert into users (id, name, email) values (5, 'Ermina', 'eflieger4@unicef.org');
insert into users (id, name, email) values (6, 'Ave', 'aoneil5@friendfeed.com');
insert into users (id, name, email) values (7, 'Brigida', 'bpiatti6@usda.gov');
insert into users (id, name, email) values (8, 'Casper', 'ctomasik7@marriott.com');
insert into users (id, name, email) values (9, 'Irma', 'imounfield8@spotify.com');
insert into users (id, name, email) values (10, 'Irwinn', 'ifourman9@apple.com');


-- LLenado de tabla CATEGORIES

insert into categories (id, category) values (1, 'Política');
insert into categories (id, category) values (2, 'Deporte');
insert into categories (id, category) values (3, 'Economía');
insert into categories (id, category) values (4, 'Cultura');
insert into categories (id, category) values (5, 'Sociedad');
insert into categories (id, category) values (6, 'Actualidad');
insert into categories (id, category) values (7, 'Policial');
insert into categories (id, category) values (8, 'Ciencia');
insert into categories (id, category) values (9, 'Música');
insert into categories (id, category) values (10, 'Salud');


-- LLenado de tabla NOTES

insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (1, 'El impacto de la música en la salud mental', '2022-06-21', '2023-03-01', 'La música puede tener un impacto significativo en la salud mental de las personas. Se ha demostrado que escuchar música puede mejorar el estado de ánimo, reducir la ansiedad y el estrés, y aumentar la motivación y la concentración. Además, tocar un instrumento musical y participar en actividades musicales en grupo puede mejorar la autoestima y la confianza en uno mismo, y proporcionar un sentido de comunidad y conexión social. La música también puede ser utilizada como una forma de terapia, ayudando a tratar trastornos mentales como la depresión y el trastorno de estrés postraumático.', 1, 1);
insert into notes (id, title, created_date, description, can_delete, user_id) values (2, 'Los retos del cambio climático en la agenda política global', '2022-04-27', 'El cambio climático representa uno de los mayores retos a nivel global, y ha sido reconocido como una amenaza para la estabilidad económica, social y ambiental. Los esfuerzos políticos para abordar el cambio climático han incluido la reducción de emisiones de gases de efecto invernadero, el desarrollo de tecnologías sostenibles y la implementación de políticas de adaptación. Sin embargo, aún se requiere de un compromiso global para alcanzar los objetivos climáticos establecidos en el Acuerdo de París. La lucha contra el cambio climático sigue siendo un reto crucial en la agenda política global.', 0, 8);
insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (3, 'La importancia de la educación emocional en la sociedad actual', '2022-10-22', '2023-02-06', 'La educación emocional es fundamental en la sociedad actual para ayudar a las personas a desarrollar habilidades sociales y emocionales, y para promover su bienestar mental y emocional. La educación emocional puede mejorar la resiliencia, la empatía y la compasión, y puede ayudar a prevenir problemas como la depresión, la ansiedad y el acoso escolar. Además, la educación emocional puede mejorar la calidad de las relaciones interpersonales y puede fomentar la cooperación y el trabajo en equipo en el entorno laboral y en la sociedad en general.', 1, 7);
insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (4, 'Las bandas sonoras que marcaron la historia del cine', '2022-08-04', '2023-02-10', 'Las bandas sonoras son una parte fundamental del cine, y han sido utilizadas para crear momentos icónicos y emocionales en la pantalla grande. Desde la música clásica de películas como "2001: Una odisea del espacio", hasta los temas icónicos de películas de culto como "Star Wars", las bandas sonoras han sido esenciales para el éxito de muchas películas. La música también puede ser utilizada para crear un ambiente y ambiente emocional específico, y para ayudar a establecer la época y el lugar de la película. Las bandas sonoras continúan siendo una parte vital del cine actual y han dejado una marca indeleble en la historia del cine.', 1, 4);
insert into notes (id, title, created_date, description, can_delete, user_id) values (5, 'El impacto de la tecnología en el rendimiento deportivo', '2022-08-31', 'La tecnología ha tenido un impacto significativo en el rendimiento deportivo en las últimas décadas. Los avances tecnológicos han permitido el desarrollo de nuevos materiales deportivos, equipos de entrenamiento especializados y dispositivos de medición y análisis de datos. Esto ha llevado a mejoras en la precisión, velocidad y seguridad en los deportes. También se ha utilizado la tecnología para mejorar la transmisión y visualización de eventos deportivos, lo que ha aumentado su alcance global. Sin embargo, algunos han planteado preocupaciones sobre la equidad en el deporte debido a la brecha tecnológica entre los equipos y deportistas.', 0, 9);
insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (6, '¿Qué hace a un deporte olímpico?', '2022-04-13', '2023-02-24', 'La inclusión de un deporte en los Juegos Olímpicos depende de varios factores. El Comité Olímpico Internacional (COI) considera la popularidad del deporte, su capacidad para atraer audiencias internacionales, la presencia de un organismo internacional que regule y promueva el deporte, y su compromiso con los valores olímpicos de respeto, amistad y excelencia. Además, los deportes deben cumplir con ciertos criterios deportivos, como la presencia de competiciones internacionales y un número mínimo de federaciones nacionales. El proceso de selección de deportes para los Juegos Olímpicos es muy riguroso y solo los deportes más adecuados son incluidos.', 0, 5);
insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (7, 'La inteligencia artificial y su impacto en la sociedad', '2022-10-26', '2023-01-02', 'La inteligencia artificial (IA) ha transformado la sociedad, desde la forma en que las personas se comunican hasta la manera en que se llevan a cabo las operaciones comerciales. La IA ha mejorado la eficiencia y la precisión de la toma de decisiones en una amplia gama de campos, desde la atención médica hasta la manufactura y el transporte. Sin embargo, también ha generado preocupaciones sobre la privacidad de los datos, la automatización del trabajo y la posible discriminación. Es importante equilibrar los beneficios y los riesgos de la IA para maximizar su impacto positivo en la sociedad.', 1, 8);
insert into notes (id, title, created_date, description, can_delete, user_id) values (8, 'El futuro del empleo en la era digital', '2022-10-23', 'El avance de la tecnología ha llevado a la automatización de muchos trabajos y ha generado preocupaciones sobre el futuro del empleo. Mientras que algunos trabajos se volverán obsoletos, otros surgirán debido al desarrollo de nuevas tecnologías y habilidades requeridas. La capacitación en habilidades digitales y la adaptación a los cambios en el mercado laboral serán claves para mantenerse empleable en la era digital. También se necesitan políticas y programas para apoyar la transición de los trabajadores a nuevas oportunidades de empleo y para mitigar los impactos negativos de la automatización.', 1, 6);
insert into notes (id, title, created_date, description, can_delete, user_id) values (9, 'El arte callejero: de la marginalidad a la aceptación social', '2022-09-18', 'El arte callejero ha evolucionado desde ser visto como un acto de vandalismo y marginalidad, a ser aceptado y reconocido como una forma de arte legítima. Las técnicas y estilos de graffiti, murales y arte urbano han sido utilizados para embellecer y revitalizar las ciudades, y para transmitir mensajes políticos y sociales. Muchas ciudades han creado espacios públicos específicos para el arte callejero y han organizado festivales y eventos para celebrarlo. Sin embargo, la controversia en torno a la propiedad y la legalidad del arte callejero sigue siendo un tema importante en la discusión sobre su papel en la sociedad.', 0, 6);
insert into notes (id, title, created_date, modificated_date, description, can_delete, user_id) values (10, 'La investigación espacial y el futuro de la humanidad en el universo', '2022-04-22', '2023-01-12', 'La investigación espacial ha sido fundamental para nuestra comprensión del universo y para la exploración del espacio. Los avances en tecnología han permitido la exploración de planetas y cuerpos celestes en nuestro sistema solar, así como el estudio de las estrellas y galaxias más allá. La investigación espacial también tiene el potencial de llevar a la humanidad a otros planetas y establecer una presencia sostenible fuera de la Tierra. Sin embargo, los desafíos tecnológicos y de financiamiento deben ser superados para lograr estos objetivos ambiciosos.', 0, 10);


-- LLenado de tabla CATEGORIES_NOTES

insert into categories_notes (id, notes_id, categories_id) values (1, 1, 9);
insert into categories_notes (id, notes_id, categories_id) values (2, 1, 10);
insert into categories_notes (id, notes_id, categories_id) values (3, 2, 1);
insert into categories_notes (id, notes_id, categories_id) values (4, 2, 8);
insert into categories_notes (id, notes_id, categories_id) values (5, 3, 5);
insert into categories_notes (id, notes_id, categories_id) values (6, 4, 9);
insert into categories_notes (id, notes_id, categories_id) values (7, 4, 4);
insert into categories_notes (id, notes_id, categories_id) values (8, 5, 2);
insert into categories_notes (id, notes_id, categories_id) values (9, 5, 8);
insert into categories_notes (id, notes_id, categories_id) values (10, 5, 6);
insert into categories_notes (id, notes_id, categories_id) values (11, 7, 8);
insert into categories_notes (id, notes_id, categories_id) values (12, 7, 5);
insert into categories_notes (id, notes_id, categories_id) values (13, 8, 3);
insert into categories_notes (id, notes_id, categories_id) values (14, 9, 4);
insert into categories_notes (id, notes_id, categories_id) values (15, 10, 8);
insert into categories_notes (id, notes_id, categories_id) values (16, 10, 6);

SELECT title
FROM users
INNER JOIN notes ON users.id = user_id
LEFT JOIN categories_notes ON notes_id = notes.id
LEFT JOIN categories ON categories_id = categories.id
GROUP BY title;