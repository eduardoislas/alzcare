-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.12 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla alzcare_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_group: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(1, 'caregivers'),
	(2, 'psychologists');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_permission: ~68 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add Respuesta', 7, 'add_answer'),
	(26, 'Can change Respuesta', 7, 'change_answer'),
	(27, 'Can delete Respuesta', 7, 'delete_answer'),
	(28, 'Can view Respuesta', 7, 'view_answer'),
	(29, 'Can add Instrumento', 8, 'add_instrument'),
	(30, 'Can change Instrumento', 8, 'change_instrument'),
	(31, 'Can delete Instrumento', 8, 'delete_instrument'),
	(32, 'Can view Instrumento', 8, 'view_instrument'),
	(33, 'Can add Aplicación de Instrumentos', 9, 'add_instrumentapplication'),
	(34, 'Can change Aplicación de Instrumentos', 9, 'change_instrumentapplication'),
	(35, 'Can delete Aplicación de Instrumentos', 9, 'delete_instrumentapplication'),
	(36, 'Can view Aplicación de Instrumentos', 9, 'view_instrumentapplication'),
	(37, 'Can add Resultado de Instrumento', 10, 'add_instrumentresult'),
	(38, 'Can change Resultado de Instrumento', 10, 'change_instrumentresult'),
	(39, 'Can delete Resultado de Instrumento', 10, 'delete_instrumentresult'),
	(40, 'Can view Resultado de Instrumento', 10, 'view_instrumentresult'),
	(41, 'Can add Opción', 11, 'add_option'),
	(42, 'Can change Opción', 11, 'change_option'),
	(43, 'Can delete Opción', 11, 'delete_option'),
	(44, 'Can view Opción', 11, 'view_option'),
	(45, 'Can add Pregunta', 12, 'add_question'),
	(46, 'Can change Pregunta', 12, 'change_question'),
	(47, 'Can delete Pregunta', 12, 'delete_question'),
	(48, 'Can view Pregunta', 12, 'view_question'),
	(49, 'Can add Escala de Respuestas', 13, 'add_scale'),
	(50, 'Can change Escala de Respuestas', 13, 'change_scale'),
	(51, 'Can delete Escala de Respuestas', 13, 'delete_scale'),
	(52, 'Can view Escala de Respuestas', 13, 'view_scale'),
	(53, 'Can add Cuidador', 14, 'add_caregiver'),
	(54, 'Can change Cuidador', 14, 'change_caregiver'),
	(55, 'Can delete Cuidador', 14, 'delete_caregiver'),
	(56, 'Can view Cuidador', 14, 'view_caregiver'),
	(57, 'Can add Tutor', 15, 'add_tutor'),
	(58, 'Can change Tutor', 15, 'change_tutor'),
	(59, 'Can delete Tutor', 15, 'delete_tutor'),
	(60, 'Can view Tutor', 15, 'view_tutor'),
	(61, 'Can add Adulto', 16, 'add_adult'),
	(62, 'Can change Adulto', 16, 'change_adult'),
	(63, 'Can delete Adulto', 16, 'delete_adult'),
	(64, 'Can view Adulto', 16, 'view_adult'),
	(65, 'Can add Aplicación de Instrumentos', 17, 'add_interview'),
	(66, 'Can change Aplicación de Instrumentos', 17, 'change_interview'),
	(67, 'Can delete Aplicación de Instrumentos', 17, 'delete_interview'),
	(68, 'Can view Aplicación de Instrumentos', 17, 'view_interview');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_user: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$120000$QhwuaHHhHzjk$Otqvz5WNQRbhnspwrA4mEYLavoxROuGx3BiLibyvusU=', '2018-10-18 09:41:19.957026', 1, 'alzadmin', '', '', '', 1, 1, '2018-09-09 18:11:32.137735'),
	(2, 'pbkdf2_sha256$120000$Vet6y7SU3JNl$HjzSG2pXQ8D7fpyEKY3EtLF0HQsj2gCeUlY0gGHQQxU=', '2018-11-05 14:52:38.561512', 0, 'psicólogo', '', '', '', 1, 1, '2018-09-22 23:55:58.000000'),
	(3, 'pbkdf2_sha256$120000$gQxElBndqAvV$tzXbw/Bykh0ANb2g8L/8MKYub1c8riQXzMcugCGrhZ0=', '2018-10-31 19:56:27.954522', 0, 'cuidador', '', '', '', 0, 1, '2018-09-22 23:56:49.000000'),
	(4, 'pbkdf2_sha256$120000$LlwdXJsExSCQ$+0ND6mTqYd4/jQYCN8GY+Y86FPNrlTSm97rEB6c7rhc=', '2018-10-19 06:18:02.503559', 0, 'cuidador2', '', '', '', 0, 1, '2018-10-18 08:34:41.921289');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_user_groups: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(2, 2, 2),
	(1, 3, 1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.django_admin_log: ~139 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2018-09-09 18:15:54.693573', '1', 'Pregunta 1 del instrumento CES-D, Me molestaron las cosas que normalmente no me molestan.', 1, '[{"added": {}}]', 12, 1),
	(2, '2018-09-09 18:17:30.905093', '2', 'Pregunta 2 del instrumento CES-D, No me sentía con ganas de comer; no tenía apetito.', 1, '[{"added": {}}]', 12, 1),
	(3, '2018-09-09 18:19:05.088554', '3', 'Pregunta 3 del instrumento CES-D, Sentía que no podía quitarme la tristeza a pesar de la ayuda de mi familia o amigos.', 1, '[{"added": {}}]', 12, 1),
	(4, '2018-09-09 18:19:47.859818', '4', 'Pregunta 4 del instrumento CES-D, Sentía que yo era tan bueno como cualquier otra persona.', 1, '[{"added": {}}]', 12, 1),
	(5, '2018-09-09 18:20:38.623545', '5', 'Pregunta 5 del instrumento CES-D, Tenía dificultad de concentrarme en lo que estaba haciendo.', 1, '[{"added": {}}]', 12, 1),
	(6, '2018-09-09 18:21:32.075026', '6', 'Pregunta 6 del instrumento CES-D, Me sentía deprimido.', 1, '[{"added": {}}]', 12, 1),
	(7, '2018-09-09 18:22:15.752255', '7', 'Pregunta 7 del instrumento CES-D, Sentía que todo lo que hacía me suponía esfuerzo.', 1, '[{"added": {}}]', 12, 1),
	(8, '2018-09-09 18:23:29.892802', '8', 'Pregunta 8 del instrumento CES-D, Me sentía optimista sobre el futuro.', 1, '[{"added": {}}]', 12, 1),
	(9, '2018-09-09 18:24:07.328701', '9', 'Pregunta 9 del instrumento CES-D, Pensé que mi vida había sido un fracaso.', 1, '[{"added": {}}]', 12, 1),
	(10, '2018-09-09 18:24:36.916691', '10', 'Pregunta 10 del instrumento CES-D, Me sentía con miedo.', 1, '[{"added": {}}]', 12, 1),
	(11, '2018-09-09 18:24:57.244979', '11', 'Pregunta 11 del instrumento CES-D, Mi sueño era inquieto.', 1, '[{"added": {}}]', 12, 1),
	(12, '2018-09-09 18:25:16.349963', '12', 'Pregunta 12 del instrumento CES-D, Estaba contento.', 1, '[{"added": {}}]', 12, 1),
	(13, '2018-09-09 18:25:48.068372', '13', 'Pregunta 13 del instrumento CES-D, Hablé menos de lo habitual.', 1, '[{"added": {}}]', 12, 1),
	(14, '2018-09-09 18:26:02.631691', '14', 'Pregunta 14 del instrumento CES-D, Me sentí solo.', 1, '[{"added": {}}]', 12, 1),
	(15, '2018-09-09 18:26:38.393859', '15', 'Pregunta 15 del instrumento CES-D, La gente no era amigable.', 1, '[{"added": {}}]', 12, 1),
	(16, '2018-09-09 18:27:12.359936', '16', 'Pregunta 16 del instrumento CES-D, Disfruté de la vida.', 1, '[{"added": {}}]', 12, 1),
	(17, '2018-09-09 18:27:30.952745', '17', 'Pregunta 17 del instrumento CES-D, Pasé ratos llorando.', 1, '[{"added": {}}]', 12, 1),
	(18, '2018-09-09 18:27:52.885481', '18', 'Pregunta 18 del instrumento CES-D, Me sentí triste.', 1, '[{"added": {}}]', 12, 1),
	(19, '2018-09-09 18:28:42.206621', '19', 'Pregunta 19 del instrumento CES-D, Sentía que no le caía bien a la gente.', 1, '[{"added": {}}]', 12, 1),
	(20, '2018-09-09 18:29:30.426880', '20', 'Pregunta 20 del instrumento CES-D, No tenía ganas de hacer nada.', 1, '[{"added": {}}]', 12, 1),
	(21, '2018-09-09 18:31:12.047439', '21', 'Pregunta 1 del instrumento HAD-A, Me siento tenso o molesto', 1, '[{"added": {}}]', 12, 1),
	(22, '2018-09-09 18:33:08.139998', '22', 'Pregunta 2 del instrumento HAD-A, Tengo una gran sensación de miedo, como si algo horrible me fuera a suceder', 1, '[{"added": {}}]', 12, 1),
	(23, '2018-09-09 18:33:47.927918', '23', 'Pregunta 3 del instrumento HAD-A, Tengo la cabeza llena de preocupaciones', 1, '[{"added": {}}]', 12, 1),
	(24, '2018-09-09 18:35:03.998167', '24', 'Pregunta 4 del instrumento HAD-A, Puedo estar sentado tranquilamente y sentirme relajado', 1, '[{"added": {}}]', 12, 1),
	(25, '2018-09-09 18:36:31.129976', '25', 'Pregunta 5 del instrumento HAD-A, Tengo una sensación de miedo, como de "aleteo" en el estómago', 1, '[{"added": {}}]', 12, 1),
	(26, '2018-09-09 18:37:32.542569', '26', 'Pregunta 6 del instrumento HAD-A, Me siento inquieto, como si estuviera continuamente en movimiento', 1, '[{"added": {}}]', 12, 1),
	(27, '2018-09-09 18:38:33.999088', '27', 'Pregunta 7 del instrumento HAD-A, Me asaltan sentimientos repentinos de pánico', 1, '[{"added": {}}]', 12, 1),
	(28, '2018-09-09 18:57:29.692132', '28', 'Pregunta 1 del instrumento CD-RISC, Soy capaz de adaptarme a los cambios.', 1, '[{"added": {}}]', 12, 1),
	(29, '2018-09-09 18:58:06.985991', '29', 'Pregunta 2 del instrumento CD-RISC, Tengo relaciones cercanas y seguras.', 1, '[{"added": {}}]', 12, 1),
	(30, '2018-09-09 18:58:34.889279', '30', 'Pregunta 3 del instrumento CD-RISC, A veces el destino o Dios pueden ayudar.', 1, '[{"added": {}}]', 12, 1),
	(31, '2018-09-09 18:59:20.059595', '31', 'Pregunta 4 del instrumento CD-RISC, Puedo afrontar lo que venga.', 1, '[{"added": {}}]', 12, 1),
	(32, '2018-09-09 19:01:09.793426', '32', 'Pregunta 5 del instrumento CD-RISC, Los éxitos pasados dan confianza para los nuevos retos.', 1, '[{"added": {}}]', 12, 1),
	(33, '2018-09-09 19:06:05.064109', '33', 'Pregunta 6 del instrumento CD-RISC, Veo el lado divertido de las cosas.', 1, '[{"added": {}}]', 12, 1),
	(34, '2018-09-09 19:07:04.295907', '34', 'Pregunta 7 del instrumento CD-RISC, Hacer frente al estrés fortalece.', 1, '[{"added": {}}]', 12, 1),
	(35, '2018-09-09 19:07:46.900947', '35', 'Pregunta 8 del instrumento CD-RISC, Tiendo a recuperarme tras una enfermedad o una dificultad.', 1, '[{"added": {}}]', 12, 1),
	(36, '2018-09-09 19:09:37.942320', '36', 'Pregunta 9 del instrumento CD-RISC, Las cosas ocurren por una razón.', 1, '[{"added": {}}]', 12, 1),
	(37, '2018-09-09 19:10:17.279716', '37', 'Pregunta 10 del instrumento CD-RISC, Sea como sea, doy lo mejor de mí.', 1, '[{"added": {}}]', 12, 1),
	(38, '2018-09-09 19:11:21.530094', '38', 'Pregunta 11 del instrumento CD-RISC, Puedes alcanzar tus objetivos.', 1, '[{"added": {}}]', 12, 1),
	(39, '2018-09-09 19:12:08.168505', '39', 'Pregunta 12 del instrumento CD-RISC, Cuando las cosas parecen desesperadas, no me rindo.', 1, '[{"added": {}}]', 12, 1),
	(40, '2018-09-09 19:14:21.039551', '40', 'Pregunta 13 del instrumento CD-RISC, Sé a quien acudir a buscar ayuda.', 1, '[{"added": {}}]', 12, 1),
	(41, '2018-09-09 19:15:23.549666', '41', 'Pregunta 14 del instrumento CD-RISC, Bajo presión, me centro y pienso con claridad.', 1, '[{"added": {}}]', 12, 1),
	(42, '2018-09-09 19:16:03.305621', '42', 'Pregunta 15 del instrumento CD-RISC, Prefiero tomar el mando en la solución de problemas.', 1, '[{"added": {}}]', 12, 1),
	(43, '2018-09-09 19:16:54.700417', '43', 'Pregunta 16 del instrumento CD-RISC, No me desanimo fácilmente por los fallos.', 1, '[{"added": {}}]', 12, 1),
	(44, '2018-09-09 19:17:58.719348', '44', 'Pregunta 17 del instrumento CD-RISC, Pienso en mí mismo como una persona fuerte.', 1, '[{"added": {}}]', 12, 1),
	(45, '2018-09-09 19:18:29.910068', '45', 'Pregunta 18 del instrumento CD-RISC, Tomo decisiones impopulares o difíciles.', 1, '[{"added": {}}]', 12, 1),
	(46, '2018-09-09 19:19:06.823081', '46', 'Pregunta 19 del instrumento CD-RISC, Puedo manejar sentimientos desagradables.', 1, '[{"added": {}}]', 12, 1),
	(47, '2018-09-09 19:19:28.381617', '47', 'Pregunta 20 del instrumento CD-RISC, Tengo que actuar por corazonadas.', 1, '[{"added": {}}]', 12, 1),
	(48, '2018-09-09 19:20:09.900457', '48', 'Pregunta 21 del instrumento CD-RISC, Las cosas que hago tienen un sentido.', 1, '[{"added": {}}]', 12, 1),
	(49, '2018-09-09 19:20:35.741635', '49', 'Pregunta 22 del instrumento CD-RISC, Tengo el control de mi vida.', 1, '[{"added": {}}]', 12, 1),
	(50, '2018-09-09 19:21:02.059414', '50', 'Pregunta 23 del instrumento CD-RISC, Me gustan los retos.', 1, '[{"added": {}}]', 12, 1),
	(51, '2018-09-09 19:21:55.285767', '51', 'Pregunta 24 del instrumento CD-RISC, Trabajo para alcanzar mis objetivos.', 1, '[{"added": {}}]', 12, 1),
	(52, '2018-09-09 19:22:26.652325', '52', 'Pregunta 25 del instrumento CD-RISC, Estoy orgulloso de mis logros.', 1, '[{"added": {}}]', 12, 1),
	(53, '2018-09-09 19:25:34.751226', '53', 'Pregunta 1 del instrumento DUKE, Recibo visitas de mis amigos y familiares.', 1, '[{"added": {}}]', 12, 1),
	(54, '2018-09-09 19:26:07.648964', '54', 'Pregunta 2 del instrumento DUKE, Recibo ayuda en asuntos relacionados con mi casa.', 1, '[{"added": {}}]', 12, 1),
	(55, '2018-09-09 19:26:51.974596', '55', 'Pregunta 3 del instrumento DUKE, Recibo elogios o reconocimientos cuando hago bien mi trabajo.', 1, '[{"added": {}}]', 12, 1),
	(56, '2018-09-09 19:32:41.566045', '56', 'Pregunta 4 del instrumento DUKE, Cuento con personas que se preocupan de lo que me sucede.', 1, '[{"added": {}}]', 12, 1),
	(57, '2018-09-10 00:12:45.925592', '1', 'Escala CES-D', 1, '[{"added": {}}]', 13, 1),
	(58, '2018-09-10 00:12:54.081035', '2', 'Escala HAD-A', 1, '[{"added": {}}]', 13, 1),
	(59, '2018-09-10 00:13:08.600044', '3', 'Escala DUKE', 1, '[{"added": {}}]', 13, 1),
	(60, '2018-09-10 00:13:15.084478', '4', 'Escala CD-RISC', 1, '[{"added": {}}]', 13, 1),
	(61, '2018-09-10 00:13:52.076129', '5', 'Escala Zarit', 1, '[{"added": {}}]', 13, 1),
	(62, '2018-09-10 00:14:38.525006', '47', '5 - Tanto como deseo', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(63, '2018-09-10 00:14:43.264520', '47', '5 - Tanto como deseo', 2, '[]', 11, 1),
	(64, '2018-09-10 00:14:49.278079', '46', '4 - Casi como deseo', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(65, '2018-09-10 00:14:56.927751', '45', '3 - Ni mucho ni poco', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(66, '2018-09-10 00:15:03.531842', '44', '2 - Menos de lo que deseo', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(67, '2018-09-10 00:15:11.043003', '43', '1 - Mucho menos de lo que deseo', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(68, '2018-09-10 00:20:16.792348', '42', '4 - Verdadera casi siempre', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(69, '2018-09-10 00:20:22.636795', '41', '3 - Verdadera frecuentemente', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(70, '2018-09-10 00:20:29.641673', '41', '3 - Verdadera frecuentemente', 2, '[]', 11, 1),
	(71, '2018-09-10 00:20:36.562488', '40', '2 - Verdadera a veces', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(72, '2018-09-10 00:20:42.157219', '39', '1 - Verdadera ocasionalmente', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(73, '2018-09-10 00:20:51.630194', '38', '0 - No ha sido verdadera en absoluto', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(74, '2018-09-10 00:26:05.950830', '37', '4 - Casi siempre', 2, '[{"changed": {"fields": ["scale"]}}]', 11, 1),
	(75, '2018-09-10 00:28:22.157282', '2', 'Escala HAD-A - Q1', 2, '[{"changed": {"fields": ["description"]}}]', 13, 1),
	(76, '2018-09-10 00:28:32.223224', '6', 'Escala HAD-A - Q2', 1, '[{"added": {}}]', 13, 1),
	(77, '2018-09-10 00:28:37.914881', '7', 'Escala HAD-A - Q3', 1, '[{"added": {}}]', 13, 1),
	(78, '2018-09-10 00:28:42.793979', '8', 'Escala HAD-A - Q4', 1, '[{"added": {}}]', 13, 1),
	(79, '2018-09-10 00:28:47.235794', '9', 'Escala HAD-A - Q5', 1, '[{"added": {}}]', 13, 1),
	(80, '2018-09-10 00:28:52.762637', '10', 'Escala HAD-A - Q6', 1, '[{"added": {}}]', 13, 1),
	(81, '2018-09-10 00:28:57.465908', '11', 'Escala HAD-A - Q7', 1, '[{"added": {}}]', 13, 1),
	(82, '2018-09-10 00:39:20.625147', '57', 'Pregunta 5 del instrumento DUKE, Recibo amor y afecto', 1, '[{"added": {}}]', 12, 1),
	(83, '2018-09-10 00:39:52.423712', '58', 'Pregunta 6 del instrumento DUKE, Tengo la posibilidad de hablar con alguien de mis problemas en el trabajo o en la casa.', 1, '[{"added": {}}]', 12, 1),
	(84, '2018-09-10 00:40:36.716598', '59', 'Pregunta 7 del instrumento DUKE, Tengo la posibilidad de hablar con alguien de mis problemas personales y familiares.', 1, '[{"added": {}}]', 12, 1),
	(85, '2018-09-10 00:41:46.574555', '60', 'Pregunta 8 del instrumento DUKE, Tengo la posibilidad de hablar con alguien de mis problemas personales y familiares.', 1, '[{"added": {}}]', 12, 1),
	(86, '2018-09-10 00:42:12.826256', '61', 'Pregunta 9 del instrumento DUKE, Tengo la posibilidad de hablar con alguien de mis problemas económicos.', 1, '[{"added": {}}]', 12, 1),
	(87, '2018-09-10 00:42:52.149287', '62', 'Pregunta 10 del instrumento DUKE, Recibo consejos útiles cuando me ocurre algún acontecimiento importante en mi vida.', 1, '[{"added": {}}]', 12, 1),
	(88, '2018-09-10 00:43:18.133374', '63', 'Pregunta 11 del instrumento DUKE, Recibo ayuda cuando estoy enfermo en la cama.', 1, '[{"added": {}}]', 12, 1),
	(89, '2018-09-10 00:45:03.197303', '64', 'Pregunta 1 del instrumento Zarit, ¿Siente que su familiar solicita más ayuda de la que realmente necesita?', 1, '[{"added": {}}]', 12, 1),
	(90, '2018-09-10 00:47:54.819319', '65', 'Pregunta 2 del instrumento Zarit, ¿Siente que debido al tiempo que dedica a su familiar ya  no dispone de tiempo suficiente para usted?', 1, '[{"added": {}}]', 12, 1),
	(91, '2018-09-10 00:48:34.330267', '66', 'Pregunta 3 del instrumento Zarit, ¿Se siente tenso cuando tiene que cuidar a su familiar y atender además otras responsabilidades?', 1, '[{"added": {}}]', 12, 1),
	(92, '2018-09-10 00:49:05.896071', '67', 'Pregunta 4 del instrumento Zarit, ¿Se siente avergonzado por la conducta de su familiar?', 1, '[{"added": {}}]', 12, 1),
	(93, '2018-09-10 00:49:50.633272', '68', 'Pregunta 5 del instrumento Zarit, ¿Se siente enfadado cuando está cerca de su familiar?', 1, '[{"added": {}}]', 12, 1),
	(94, '2018-09-10 00:50:42.459614', '69', 'Pregunta 6 del instrumento Zarit, ¿Cree que la situación actual afecta de manera negativa a su relación con amigos y otros miembros de su familia?', 1, '[{"added": {}}]', 12, 1),
	(95, '2018-09-10 00:51:10.931232', '70', 'Pregunta 7 del instrumento Zarit, ¿Siente temor por el futuro que le espera a su familiar?', 1, '[{"added": {}}]', 12, 1),
	(96, '2018-09-10 00:53:06.154989', '71', 'Pregunta 8 del instrumento Zarit, ¿Siente que su familiar depende de usted?', 1, '[{"added": {}}]', 12, 1),
	(97, '2018-09-10 00:53:57.039153', '72', 'Pregunta 9 del instrumento Zarit, ¿Se siente agobiado cuando tiene que estar junto a su familiar?', 1, '[{"added": {}}]', 12, 1),
	(98, '2018-09-10 00:56:58.559653', '73', 'Pregunta 10 del instrumento Zarit, ¿Siente que su salud se ha resentido por cuidar a su familia?', 1, '[{"added": {}}]', 12, 1),
	(99, '2018-09-10 00:57:55.402627', '74', 'Pregunta 11 del instrumento Zarit, ¿Siente que no tiene la vida privada que desearía debido a su familiar?', 1, '[{"added": {}}]', 12, 1),
	(100, '2018-09-10 01:02:51.713243', '75', 'Pregunta 12 del instrumento Zarit, ¿Cree que su vida social se ha visto afectada por tener que cuidar de su familiar?', 1, '[{"added": {}}]', 12, 1),
	(101, '2018-09-10 01:03:22.625659', '76', 'Pregunta 13 del instrumento Zarit, ¿Se siente incómodo para invitar amigos a casa, a causa de su familiar?', 1, '[{"added": {}}]', 12, 1),
	(102, '2018-09-10 01:04:17.326540', '77', 'Pregunta 14 del instrumento Zarit, ¿Cree que su familiar espera que usted le cuide, como si fuera la única persona con la que puede contar?', 1, '[{"added": {}}]', 12, 1),
	(103, '2018-09-10 01:06:16.090150', '78', 'Pregunta 15 del instrumento Zarit, ¿Cree que no dispone de dinero suficiente para cuidar a su familiar además de sus otros gastos?', 1, '[{"added": {}}]', 12, 1),
	(104, '2018-09-10 01:06:55.633286', '79', 'Pregunta 16 del instrumento Zarit, ¿Siente que será incapaz de cuidar a su familiar por mucho más tiempo?', 1, '[{"added": {}}]', 12, 1),
	(105, '2018-09-10 01:07:35.178331', '80', 'Pregunta 17 del instrumento Zarit, ¿Siente que ha perdido el control sobre su vida desde que la enfermedad de su familiar se manifestó?', 1, '[{"added": {}}]', 12, 1),
	(106, '2018-09-10 01:09:54.371253', '81', 'Pregunta 18 del instrumento Zarit, ¿Desearía poder encargar el cuidado de su familiar a otras personas?', 1, '[{"added": {}}]', 12, 1),
	(107, '2018-09-10 01:10:46.807418', '82', 'Pregunta 19 del instrumento Zarit, ¿Se siente inseguro acerca de lo que debe hacer con su familiar?', 1, '[{"added": {}}]', 12, 1),
	(108, '2018-09-10 01:11:41.396007', '83', 'Pregunta 20 del instrumento Zarit, ¿Siente que debería hacer más de lo que hace por su familiar?', 1, '[{"added": {}}]', 12, 1),
	(109, '2018-09-10 01:12:13.973062', '84', 'Pregunta 21 del instrumento Zarit, ¿Cree que podría cuidar de su familiar mejor de lo que lo hace?', 1, '[{"added": {}}]', 12, 1),
	(110, '2018-09-10 01:12:52.184781', '85', 'Pregunta 22 del instrumento Zarit, En general: ¿Se siente muy sobrecargado por tener que cuidar de su familiar?', 1, '[{"added": {}}]', 12, 1),
	(111, '2018-09-10 04:38:49.558823', '1', 'Aplicación 2 del año 2018', 1, '[{"added": {}}]', 9, 1),
	(112, '2018-09-10 04:39:20.462277', '1', 'Resultado del instrumento CES-D, de la aplicación 2 del año 2018', 1, '[{"added": {}}]', 10, 1),
	(113, '2018-09-22 23:48:36.426179', '1', 'caregivers', 1, '[{"added": {}}]', 3, 1),
	(114, '2018-09-22 23:54:23.878001', '2', 'psychologists', 1, '[{"added": {}}]', 3, 1),
	(115, '2018-09-22 23:55:58.308304', '2', 'psicólogo', 1, '[{"added": {}}]', 4, 1),
	(116, '2018-09-22 23:56:49.236693', '3', 'cuidador', 1, '[{"added": {}}]', 4, 1),
	(117, '2018-09-22 23:57:13.405110', '3', 'cuidador', 2, '[{"changed": {"fields": ["groups"]}}]', 4, 1),
	(118, '2018-09-22 23:57:24.500893', '2', 'psicólogo', 2, '[{"changed": {"fields": ["groups"]}}]', 4, 1),
	(119, '2018-09-23 00:45:17.923531', '1', 'caregivers', 1, '[{"added": {}}]', 3, 1),
	(120, '2018-09-23 00:45:26.965827', '2', 'psychologists', 1, '[{"added": {}}]', 3, 1),
	(121, '2018-09-23 00:45:47.515185', '3', 'cuidador', 2, '[{"changed": {"fields": ["groups"]}}]', 4, 1),
	(122, '2018-09-23 00:45:54.917026', '2', 'psicólogo', 2, '[]', 4, 1),
	(123, '2018-09-23 00:57:28.335980', '2', 'psicólogo', 2, '[{"changed": {"fields": ["groups"]}}]', 4, 1),
	(124, '2018-09-23 01:11:19.446743', '2', 'psicólogo', 2, '[{"changed": {"fields": ["is_staff"]}}]', 4, 1),
	(125, '2018-09-23 02:49:15.406985', '1', 'Islas Cota, Cuidador 1', 2, '[{"changed": {"fields": ["religion", "availabilityHome", "user"]}}]', 14, 1),
	(126, '2018-10-18 06:21:53.828696', '12', 'Escala APGAR Familiar', 1, '[{"added": {}}]', 13, 1),
	(127, '2018-10-18 06:21:53.841686', '13', 'Escala APGAR Familiar', 1, '[{"added": {}}]', 13, 1),
	(128, '2018-10-18 06:27:02.717924', '6', 'Escala APGAR Familiar para medir Familiar', 1, '[{"added": {}}]', 8, 1),
	(129, '2018-10-18 06:27:02.915829', '7', 'Escala APGAR Familiar para medir Familiar', 1, '[{"added": {}}]', 8, 1),
	(130, '2018-10-18 06:28:48.599294', '48', '0 - Nunca', 1, '[{"added": {}}]', 11, 1),
	(131, '2018-10-18 06:29:31.184074', '49', '1 - Casi nunca', 1, '[{"added": {}}]', 11, 1),
	(132, '2018-10-18 06:29:50.844072', '50', '2 - Algunas veces', 1, '[{"added": {}}]', 11, 1),
	(133, '2018-10-18 06:30:03.527608', '51', '3 - Casi siempre', 1, '[{"added": {}}]', 11, 1),
	(134, '2018-10-18 06:30:17.805897', '52', '4 - Siempre', 1, '[{"added": {}}]', 11, 1),
	(135, '2018-10-18 06:31:27.619830', '86', 'Pregunta 1 del instrumento APGAR Familiar, Me satisface la ayuda que recibo de mi familia cuando tengo algún problema y/o necesidad.', 1, '[{"added": {}}]', 12, 1),
	(136, '2018-10-18 06:32:15.618045', '87', 'Pregunta 2 del instrumento APGAR Familiar, Me satisface la participación que mi familia brinda y permite.', 1, '[{"added": {}}]', 12, 1),
	(137, '2018-10-18 06:33:05.868022', '88', 'Pregunta 3 del instrumento APGAR Familiar, Me satisface cómo mi familia acepta y apoya mis deseos de emprender nuevas actividades.', 1, '[{"added": {}}]', 12, 1),
	(138, '2018-10-18 06:33:53.102030', '89', 'Pregunta 4 del instrumento APGAR Familiar, Me satisface como mi familia expresa afectos y responde a mis emociones como rabia, tristeza, amor.', 1, '[{"added": {}}]', 12, 1),
	(139, '2018-10-18 06:35:19.378193', '90', 'Pregunta 5 del instrumento APGAR Familiar, Me satisface como compartimos en familia: a) El tiempo para estar juntos, b) Los espacios en la casa, c) El dinero', 1, '[{"added": {}}]', 12, 1),
	(140, '2018-10-18 08:34:42.172144', '4', 'cuidador2', 1, '[{"added": {}}]', 4, 1),
	(141, '2018-10-18 08:34:54.272116', '2', 'Lopez Lopez, Pedro', 2, '[{"changed": {"fields": ["religion", "user"]}}]', 14, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.django_content_type: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(16, 'principal', 'adult'),
	(7, 'principal', 'answer'),
	(14, 'principal', 'caregiver'),
	(8, 'principal', 'instrument'),
	(9, 'principal', 'instrumentapplication'),
	(10, 'principal', 'instrumentresult'),
	(17, 'principal', 'interview'),
	(11, 'principal', 'option'),
	(12, 'principal', 'question'),
	(13, 'principal', 'scale'),
	(15, 'principal', 'tutor'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.django_migrations: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2018-09-09 17:05:27.360640'),
	(2, 'auth', '0001_initial', '2018-09-09 17:05:54.030169'),
	(3, 'admin', '0001_initial', '2018-09-09 17:06:04.593069'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2018-09-09 17:06:04.714006'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2018-09-09 17:06:04.956861'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2018-09-09 17:06:13.281484'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2018-09-09 17:06:20.359838'),
	(8, 'auth', '0003_alter_user_email_max_length', '2018-09-09 17:06:21.295277'),
	(9, 'auth', '0004_alter_user_username_opts', '2018-09-09 17:06:21.493164'),
	(10, 'auth', '0005_alter_user_last_login_null', '2018-09-09 17:06:25.212760'),
	(11, 'auth', '0006_require_contenttypes_0002', '2018-09-09 17:06:25.570741'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2018-09-09 17:06:25.937529'),
	(13, 'auth', '0008_alter_user_username_max_length', '2018-09-09 17:06:29.652324'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2018-09-09 17:06:32.992604'),
	(15, 'principal', '0001_initial', '2018-09-09 17:07:17.451890'),
	(16, 'principal', '0002_auto_20180908_2105', '2018-09-09 17:07:18.104500'),
	(17, 'sessions', '0001_initial', '2018-09-09 17:07:19.390760'),
	(18, 'principal', '0003_auto_20180909_1010', '2018-09-09 17:10:21.624684'),
	(19, 'principal', '0004_auto_20180909_1020', '2018-09-09 17:20:11.951888'),
	(20, 'principal', '0005_auto_20180909_1022', '2018-09-09 17:22:57.663913'),
	(21, 'principal', '0006_auto_20180909_1709', '2018-09-10 00:09:45.158776'),
	(22, 'principal', '0007_auto_20180909_1737', '2018-09-10 00:38:11.009144'),
	(23, 'principal', '0008_adult_caregiver_interview_tutor', '2018-09-11 03:18:26.932729'),
	(24, 'principal', '0009_auto_20180910_2037', '2018-09-11 03:38:07.365627'),
	(25, 'principal', '0010_instrumentresult_caregiver', '2018-09-11 19:12:17.297230'),
	(26, 'principal', '0011_auto_20180911_1227', '2018-09-11 19:27:59.883106'),
	(27, 'principal', '0012_instrument_style', '2018-09-15 23:34:53.756454'),
	(28, 'principal', '0013_instrumentresult_status', '2018-09-17 23:30:49.249141'),
	(29, 'principal', '0014_adult_isprincipal', '2018-09-18 05:32:17.041356'),
	(30, 'principal', '0015_auto_20180918_0013', '2018-09-18 07:14:00.248570'),
	(31, 'principal', '0016_auto_20180918_1121', '2018-09-18 18:22:15.814865'),
	(32, 'principal', '0017_caregiver_user', '2018-09-23 02:46:53.874511'),
	(33, 'principal', '0018_auto_20181016_2247', '2018-10-17 05:48:09.522134'),
	(34, 'principal', '0019_auto_20181018_0015', '2018-10-18 07:16:19.881965'),
	(35, 'principal', '0020_auto_20181018_0037', '2018-10-18 07:37:40.027745'),
	(36, 'principal', '0021_auto_20181018_0159', '2018-10-18 08:59:40.278568'),
	(37, 'principal', '0022_auto_20181018_0218', '2018-10-18 09:18:56.973340'),
	(38, 'principal', '0023_auto_20181018_0242', '2018-10-18 09:42:23.973162'),
	(39, 'principal', '0024_auto_20181018_2316', '2018-10-19 06:16:48.850467');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.django_session: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('3m73iiwnsjmn3ixe0j3okt9isbc888fb', 'ODNiODZjNTBiNzhlMmNiMGQwYzhlNmNjZTlkZDU1Yjk0YjJmMGQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmQyYjcyMDBkZDM4Mjg2OWI4NWI1MDg5MWJhZDIzZjFmMzZmMWUyIn0=', '2018-10-13 21:17:38.148319'),
	('f6q3kcm6upp32vk9083gcpzfljculk0g', 'ODNiODZjNTBiNzhlMmNiMGQwYzhlNmNjZTlkZDU1Yjk0YjJmMGQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmQyYjcyMDBkZDM4Mjg2OWI4NWI1MDg5MWJhZDIzZjFmMzZmMWUyIn0=', '2018-11-01 02:48:37.623519'),
	('medq22wo8ow2x92l7x2pa91zygd55v7e', 'ODNiODZjNTBiNzhlMmNiMGQwYzhlNmNjZTlkZDU1Yjk0YjJmMGQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmQyYjcyMDBkZDM4Mjg2OWI4NWI1MDg5MWJhZDIzZjFmMzZmMWUyIn0=', '2018-11-19 14:52:38.917451');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_adult
CREATE TABLE IF NOT EXISTS `principal_adult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `mLastName` varchar(60) NOT NULL,
  `birthDate` date NOT NULL,
  `civilStatus` varchar(1) NOT NULL,
  `phase` smallint(6) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `nacionality` varchar(60) NOT NULL,
  `religion` varchar(60) NOT NULL,
  `birthPlace` varchar(60) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla alzcare_db.principal_adult: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_adult` DISABLE KEYS */;
INSERT INTO `principal_adult` (`id`, `name`, `lastName`, `mLastName`, `birthDate`, `civilStatus`, `phase`, `gender`, `nacionality`, `religion`, `birthPlace`, `status`, `created`, `updated`) VALUES
	(1, 'Eduardo', 'Islas', 'Cota', '2018-09-14', 'S', 1, 'M', 'Mexicano', 'Católico', 'Obregón', 'A', '2018-09-14 02:08:30.000000', '2018-09-14 02:08:31.000000'),
	(2, 'Adulto2', 'su apellido', 'otro apellido', '2018-09-14', 'C', 2, 'F', 'Mexicano', 'Católico', 'Obregón', 'A', '2018-09-14 14:33:26.000000', '2018-09-14 14:33:27.000000'),
	(3, 'Adulto3', 'Prueba', 'Prueba', '1986-10-13', 'C', 1, 'M', 'México', 'Católica', 'Obregón', 'A', '2018-09-18 06:36:14.717803', '2018-09-18 06:36:14.717803'),
	(4, 'Juan', 'Perez', 'Test', '1986-10-13', 'C', 2, 'F', 'jkhkjb', 'jkbjb', 'bjhb', 'A', '2018-09-18 06:53:31.994911', '2018-09-18 06:53:31.994911');
/*!40000 ALTER TABLE `principal_adult` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_answer
CREATE TABLE IF NOT EXISTS `principal_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentResult_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_answer_instrumentResult_id_de6b0af0_fk_principal` (`instrumentResult_id`),
  KEY `principal_answer_option_id_162ad359_fk_principal_option_id` (`option_id`),
  KEY `principal_answer_question_id_6067fca0_fk_principal_question_id` (`question_id`),
  CONSTRAINT `principal_answer_instrumentResult_id_de6b0af0_fk_principal` FOREIGN KEY (`instrumentResult_id`) REFERENCES `principal_instrumentresult` (`id`),
  CONSTRAINT `principal_answer_option_id_162ad359_fk_principal_option_id` FOREIGN KEY (`option_id`) REFERENCES `principal_option` (`id`),
  CONSTRAINT `principal_answer_question_id_6067fca0_fk_principal_question_id` FOREIGN KEY (`question_id`) REFERENCES `principal_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_answer: ~132 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_answer` DISABLE KEYS */;
INSERT INTO `principal_answer` (`id`, `instrumentResult_id`, `option_id`, `question_id`) VALUES
	(1, 1, 47, 53),
	(2, 1, 46, 54),
	(3, 1, 47, 55),
	(4, 1, 47, 56),
	(5, 1, 46, 57),
	(6, 1, 47, 58),
	(7, 1, 46, 59),
	(8, 1, 47, 60),
	(9, 1, 47, 61),
	(10, 1, 46, 62),
	(11, 1, 47, 63),
	(12, 2, 4, 1),
	(13, 2, 3, 2),
	(14, 2, 4, 4),
	(15, 2, 4, 3),
	(16, 2, 3, 5),
	(17, 2, 4, 6),
	(18, 2, 3, 7),
	(19, 2, 4, 8),
	(20, 2, 4, 9),
	(21, 2, 4, 10),
	(22, 2, 3, 11),
	(23, 2, 4, 12),
	(24, 2, 4, 13),
	(25, 2, 3, 14),
	(26, 2, 4, 15),
	(27, 2, 3, 16),
	(28, 2, 4, 17),
	(29, 2, 3, 18),
	(30, 2, 4, 19),
	(31, 2, 3, 20),
	(32, 4, 42, 28),
	(33, 4, 41, 29),
	(34, 4, 41, 30),
	(35, 4, 42, 31),
	(36, 4, 40, 32),
	(37, 4, 41, 33),
	(38, 4, 42, 34),
	(39, 4, 41, 35),
	(40, 4, 42, 36),
	(41, 4, 42, 37),
	(42, 4, 42, 38),
	(43, 4, 41, 39),
	(44, 4, 42, 40),
	(45, 4, 41, 41),
	(46, 4, 42, 42),
	(47, 4, 41, 43),
	(48, 4, 42, 44),
	(49, 4, 41, 45),
	(50, 4, 42, 46),
	(51, 4, 42, 47),
	(52, 4, 42, 48),
	(53, 4, 42, 49),
	(54, 4, 42, 50),
	(55, 4, 42, 51),
	(56, 4, 42, 52),
	(57, 5, 37, 64),
	(58, 5, 36, 65),
	(59, 5, 37, 66),
	(60, 5, 36, 67),
	(61, 5, 36, 68),
	(62, 5, 37, 69),
	(63, 5, 36, 70),
	(64, 5, 37, 71),
	(65, 5, 36, 72),
	(66, 5, 36, 73),
	(67, 5, 36, 74),
	(68, 5, 35, 75),
	(69, 5, 37, 76),
	(70, 5, 36, 77),
	(71, 5, 36, 78),
	(72, 5, 37, 79),
	(73, 5, 36, 80),
	(74, 5, 37, 81),
	(75, 5, 36, 82),
	(76, 5, 37, 83),
	(77, 5, 36, 84),
	(78, 5, 37, 85),
	(79, 6, 8, 21),
	(80, 6, 11, 22),
	(81, 6, 15, 23),
	(82, 6, 18, 24),
	(83, 6, 24, 25),
	(84, 6, 27, 26),
	(85, 6, 31, 27),
	(130, 9, 37, 64),
	(131, 9, 36, 65),
	(132, 9, 37, 66),
	(133, 9, 36, 67),
	(134, 9, 37, 68),
	(135, 9, 36, 69),
	(136, 9, 37, 70),
	(137, 9, 36, 71),
	(138, 9, 37, 72),
	(139, 9, 36, 73),
	(140, 9, 37, 74),
	(141, 9, 36, 75),
	(142, 9, 37, 76),
	(143, 9, 36, 77),
	(144, 9, 37, 78),
	(145, 9, 36, 79),
	(146, 9, 37, 80),
	(147, 9, 36, 81),
	(148, 9, 37, 82),
	(149, 9, 36, 83),
	(150, 9, 37, 84),
	(151, 9, 36, 85),
	(152, 10, 42, 28),
	(153, 10, 41, 29),
	(154, 10, 42, 30),
	(155, 10, 42, 31),
	(156, 10, 42, 32),
	(157, 10, 42, 33),
	(158, 10, 42, 34),
	(159, 10, 41, 35),
	(160, 10, 42, 36),
	(161, 10, 42, 37),
	(162, 10, 42, 39),
	(163, 10, 42, 38),
	(164, 10, 42, 40),
	(165, 10, 41, 41),
	(166, 10, 42, 42),
	(167, 10, 41, 43),
	(168, 10, 42, 44),
	(169, 10, 42, 45),
	(170, 10, 42, 47),
	(171, 10, 42, 46),
	(172, 10, 42, 48),
	(173, 10, 41, 49),
	(174, 10, 42, 50),
	(175, 10, 42, 51),
	(176, 10, 42, 52),
	(177, 11, 47, 53),
	(178, 11, 46, 54),
	(179, 11, 47, 55),
	(180, 11, 47, 56),
	(181, 11, 46, 57),
	(182, 11, 47, 58),
	(183, 11, 46, 59),
	(184, 11, 47, 60),
	(185, 11, 46, 61),
	(186, 11, 47, 62),
	(187, 11, 46, 63),
	(188, 12, 52, 86),
	(189, 12, 51, 87),
	(190, 12, 52, 88),
	(191, 12, 52, 89),
	(192, 12, 51, 90);
/*!40000 ALTER TABLE `principal_answer` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_caregiver
CREATE TABLE IF NOT EXISTS `principal_caregiver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `mLastName` varchar(60) NOT NULL,
  `relationship` varchar(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL,
  `civilStatus` varchar(1) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `religion` varchar(40) NOT NULL,
  `ocupation` varchar(60) NOT NULL,
  `availability` longtext,
  `availabilityHome` longtext,
  `reason` longtext,
  `status` varchar(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `adult_id` int(11) NOT NULL,
  `isPrincipal` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `principal_caregiver_adult_id_9c4972d8_fk_principal_adult_id` (`adult_id`),
  CONSTRAINT `principal_caregiver_adult_id_9c4972d8_fk_principal_adult_id` FOREIGN KEY (`adult_id`) REFERENCES `principal_adult` (`id`),
  CONSTRAINT `principal_caregiver_user_id_d15e5a41_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla alzcare_db.principal_caregiver: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_caregiver` DISABLE KEYS */;
INSERT INTO `principal_caregiver` (`id`, `name`, `lastName`, `mLastName`, `relationship`, `email`, `phone`, `address`, `civilStatus`, `gender`, `religion`, `ocupation`, `availability`, `availabilityHome`, `reason`, `status`, `created`, `updated`, `adult_id`, `isPrincipal`, `user_id`) VALUES
	(1, 'Cuidador 1', 'Islas', 'Cota', 'E', 'dfgd', '545436', 'dfgdfg', 'C', 'M', 'youi', 'dfgdfg', 'dfghdfg', 'uio', 'dfgdf', 'A', '2018-09-21 07:20:52.475373', '2018-09-23 02:49:15.391995', 3, 1, 3),
	(2, 'Pedro', 'Lopez', 'Lopez', 'H', 'a@a.com', '65465456456', 'dfgdfgdf', 'C', 'M', 'Católica', 'Doctor', 'dgfsdfasd', '', 'asdfsdfsd', 'A', '2018-09-26 04:10:20.271521', '2018-10-18 08:34:54.201156', 4, 1, 4);
/*!40000 ALTER TABLE `principal_caregiver` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_instrument
CREATE TABLE IF NOT EXISTS `principal_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `indicator` varchar(80) NOT NULL,
  `instructions` varchar(350) NOT NULL,
  `status` varchar(1) NOT NULL,
  `maxValue` smallint(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `style` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_instrument: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_instrument` DISABLE KEYS */;
INSERT INTO `principal_instrument` (`id`, `name`, `indicator`, `instructions`, `status`, `maxValue`, `created`, `updated`, `style`) VALUES
	(1, 'CES-D', 'Depresión', 'Este cuestionario contiene 20 afirmaciones. Por favor, lea con atención cada una y a continuación señale con qué frecuencia se ha sentido así en la ÚLTIMA SEMANA.', 'A', 60, '2018-09-09 10:14:33.000000', '2018-09-09 10:14:41.000000', 1),
	(2, 'HAD-A', 'Ansiedad', 'Este cuestionario ha sido diseñado para ayudarnos a saber cómo se siente usted. Lea cada frase y marque la respuesta que más se ajusta a cómo se sintió durante la ÚLTIMA SEMANA. No piense mucho las respuestas. Lo más seguro es que si responde deprisa sus respuestas podrán reflejar mejor cómo se encontraba usted durante la semana pasada.', 'A', 21, '2018-09-09 10:24:52.000000', '2018-09-09 10:24:53.000000', 2),
	(3, 'Zarit', 'Sobrecarga', 'Conteste con base en la tabla que se muestra.', 'A', 110, '2018-09-09 10:28:08.000000', '2018-09-09 10:28:09.000000', 1),
	(4, 'CD-RISC', 'Resiliencia', 'Hasta qué punto las siguientes afirmaciones han sido verdaderas para usted DURANTE EL ÚLTIMO MES:', 'A', 100, '2018-09-09 10:30:17.000000', '2018-09-09 10:30:18.000000', 1),
	(5, 'DUKE', 'Apoyo social funcional', 'En la siguiente lista se muestran algunas cosas que otras personas hacen por nosotros o nos proporcionan. Elija cada una de la respuesta que mejor refleje su situación, según los siguientes criterios.', 'A', 55, '2018-09-09 10:32:53.000000', '2018-09-09 10:32:58.000000', 1),
	(6, 'APGAR Familiar', 'Familiar', 'Contesta lo siguiente:', 'A', 20, '2018-10-18 06:27:02.689940', '2018-10-18 06:27:02.689940', 1);
/*!40000 ALTER TABLE `principal_instrument` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_instrumentapplication
CREATE TABLE IF NOT EXISTS `principal_instrumentapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` smallint(6) NOT NULL,
  `year` varchar(4) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_instrumentapplication: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_instrumentapplication` DISABLE KEYS */;
INSERT INTO `principal_instrumentapplication` (`id`, `period`, `year`, `status`, `created`, `updated`) VALUES
	(1, 2, '2018', 'A', '2018-09-29 21:18:46.619033', '2018-09-29 21:18:46.619033');
/*!40000 ALTER TABLE `principal_instrumentapplication` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_instrumentresult
CREATE TABLE IF NOT EXISTS `principal_instrumentresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` smallint(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `iapplication_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  `caregiver_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `percentage` decimal(4,1) DEFAULT NULL,
  `range` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_instrument_caregiver_id_caa0407f_fk_principal` (`caregiver_id`),
  KEY `principal_instrument_iapplication_id_5f7d09da_fk_principal` (`iapplication_id`),
  KEY `principal_instrument_instrument_id_fc48e457_fk_principal` (`instrument_id`),
  CONSTRAINT `principal_instrument_caregiver_id_caa0407f_fk_principal` FOREIGN KEY (`caregiver_id`) REFERENCES `principal_caregiver` (`id`),
  CONSTRAINT `principal_instrument_iapplication_id_5f7d09da_fk_principal` FOREIGN KEY (`iapplication_id`) REFERENCES `principal_instrumentapplication` (`id`),
  CONSTRAINT `principal_instrument_instrument_id_fc48e457_fk_principal` FOREIGN KEY (`instrument_id`) REFERENCES `principal_instrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_instrumentresult: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_instrumentresult` DISABLE KEYS */;
INSERT INTO `principal_instrumentresult` (`id`, `score`, `created`, `updated`, `iapplication_id`, `instrument_id`, `caregiver_id`, `status`, `percentage`, `range`) VALUES
	(1, 51, '2018-10-02 22:26:00.981319', '2018-10-02 22:26:04.442875', 1, 5, 1, 'A', 92.7, NULL),
	(2, 52, '2018-10-02 22:35:19.667305', '2018-10-02 22:35:22.595094', 1, 1, 1, 'A', 86.7, NULL),
	(3, 0, '2018-10-18 07:50:14.375921', '2018-10-18 07:50:14.600817', 1, 2, 1, 'A', 0.0, NULL),
	(4, 90, '2018-10-18 08:17:18.756370', '2018-10-18 08:17:21.190800', 1, 4, 1, 'A', 90.0, NULL),
	(5, 96, '2018-10-18 08:33:13.902651', '2018-10-18 08:33:16.278918', 1, 3, 1, 'A', 87.3, NULL),
	(6, 15, '2018-10-18 09:06:54.888856', '2018-10-18 09:06:56.127990', 1, 2, 2, 'A', 71.4, NULL),
	(9, 0, '2018-10-19 06:24:57.616538', '2018-10-19 06:24:57.617530', 1, 3, 2, 'A', NULL, NULL),
	(10, 0, '2018-10-19 06:28:17.835603', '2018-10-19 06:28:17.835603', 1, 4, 2, 'A', NULL, NULL),
	(11, 50, '2018-10-19 06:36:12.519601', '2018-10-19 06:36:14.282774', 1, 5, 2, 'A', 90.9, 'bajo'),
	(12, 18, '2018-10-31 19:56:49.172944', '2018-10-31 19:56:50.801393', 1, 6, 1, 'A', 90.0, 'bajo');
/*!40000 ALTER TABLE `principal_instrumentresult` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_interview
CREATE TABLE IF NOT EXISTS `principal_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q1` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `q2` varchar(1) NOT NULL,
  `q3` varchar(100) DEFAULT NULL,
  `q4` varchar(1) NOT NULL,
  `q5` varchar(100) DEFAULT NULL,
  `caregiver_id` int(11) NOT NULL,
  `q10` longtext,
  `q11` varchar(100) DEFAULT NULL,
  `q12` longtext,
  `q6` int(10) unsigned NOT NULL,
  `q7` varchar(100) DEFAULT NULL,
  `q8` longtext,
  `q9` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caregiver_id` (`caregiver_id`),
  CONSTRAINT `principal_interview_caregiver_id_f96049fa_fk_principal` FOREIGN KEY (`caregiver_id`) REFERENCES `principal_caregiver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla alzcare_db.principal_interview: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `principal_interview` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_option
CREATE TABLE IF NOT EXISTS `principal_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(80) NOT NULL,
  `value` smallint(6) NOT NULL,
  `scale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_option_scale_id_1ea3063c_fk_principal_scale_id` (`scale_id`),
  CONSTRAINT `principal_option_scale_id_1ea3063c_fk_principal_scale_id` FOREIGN KEY (`scale_id`) REFERENCES `principal_scale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_option: ~47 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_option` DISABLE KEYS */;
INSERT INTO `principal_option` (`id`, `description`, `value`, `scale_id`) VALUES
	(1, 'Raramente o ninguna vez (menos de un día)', 0, 1),
	(2, 'Alguna o pocas veces (de 1 a 2 días)', 1, 1),
	(3, 'Ocasionalmente (de 3 a 4 días)', 2, 1),
	(4, 'La mayor parte del tiempo (de 5 a 7 días)', 3, 1),
	(5, 'Todos los días', 0, 2),
	(6, 'Muchas veces', 1, 2),
	(7, 'A veces', 2, 2),
	(8, 'Nunca', 3, 2),
	(9, 'Totalmente y es muy fuerte', 0, 6),
	(10, 'Sí, pero no es muy fuerte', 1, 6),
	(11, 'Un poco, pero no me preocupa', 2, 6),
	(12, 'Nada', 3, 6),
	(13, 'La mayoría de las veces', 0, 7),
	(14, 'Con bastante frecuencia', 1, 7),
	(15, 'A veces aunque no muy a menudo', 2, 7),
	(16, 'Solo en ocasiones', 3, 7),
	(17, 'Siempre', 0, 8),
	(18, 'Por lo general', 1, 8),
	(19, 'No muy a menudo', 2, 8),
	(20, 'Nunca', 3, 8),
	(21, 'Nunca', 0, 9),
	(22, 'En ciertas ocasiones', 1, 9),
	(23, 'Con bastante frecuencia', 2, 9),
	(24, 'Muy a menudo', 3, 9),
	(25, 'Mucho', 0, 10),
	(26, 'Bastante', 1, 10),
	(27, 'No mucho', 2, 10),
	(28, 'Nada', 3, 10),
	(29, 'Muy frecuentemente', 0, 11),
	(30, 'Bastante a menudo', 1, 11),
	(31, 'No muy a menudo', 2, 11),
	(32, 'Nada', 3, 11),
	(33, 'Nunca', 1, 5),
	(34, 'Casi nunca', 2, 5),
	(35, 'A veces', 3, 5),
	(36, 'Bastantes veces', 4, 5),
	(37, 'Casi siempre', 5, 5),
	(38, 'No ha sido verdadera en absoluto', 0, 4),
	(39, 'Verdadera ocasionalmente', 1, 4),
	(40, 'Verdadera a veces', 2, 4),
	(41, 'Verdadera frecuentemente', 3, 4),
	(42, 'Verdadera casi siempre', 4, 4),
	(43, 'Mucho menos de lo que deseo', 1, 3),
	(44, 'Menos de lo que deseo', 2, 3),
	(45, 'Ni mucho ni poco', 3, 3),
	(46, 'Casi como deseo', 4, 3),
	(47, 'Tanto como deseo', 5, 3),
	(48, 'Nunca', 0, 12),
	(49, 'Casi nunca', 1, 12),
	(50, 'Algunas veces', 2, 12),
	(51, 'Casi siempre', 3, 12),
	(52, 'Siempre', 4, 12);
/*!40000 ALTER TABLE `principal_option` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_question
CREATE TABLE IF NOT EXISTS `principal_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` smallint(6) NOT NULL,
  `description` varchar(150) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  `scale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_question_instrument_id_ee1df733_fk_principal` (`instrument_id`),
  KEY `principal_question_scale_id_dfa9f488_fk_principal_scale_id` (`scale_id`),
  CONSTRAINT `principal_question_instrument_id_ee1df733_fk_principal` FOREIGN KEY (`instrument_id`) REFERENCES `principal_instrument` (`id`),
  CONSTRAINT `principal_question_scale_id_dfa9f488_fk_principal_scale_id` FOREIGN KEY (`scale_id`) REFERENCES `principal_scale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_question: ~85 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_question` DISABLE KEYS */;
INSERT INTO `principal_question` (`id`, `item`, `description`, `instrument_id`, `scale_id`) VALUES
	(1, 1, 'Me molestaron las cosas que normalmente no me molestan.', 1, 1),
	(2, 2, 'No me sentía con ganas de comer; no tenía apetito.', 1, 1),
	(3, 3, 'Sentía que no podía quitarme la tristeza a pesar de la ayuda de mi familia o amigos.', 1, 1),
	(4, 4, 'Sentía que yo era tan bueno como cualquier otra persona.', 1, 1),
	(5, 5, 'Tenía dificultad de concentrarme en lo que estaba haciendo.', 1, 1),
	(6, 6, 'Me sentía deprimido.', 1, 1),
	(7, 7, 'Sentía que todo lo que hacía me suponía esfuerzo.', 1, 1),
	(8, 8, 'Me sentía optimista sobre el futuro.', 1, 1),
	(9, 9, 'Pensé que mi vida había sido un fracaso.', 1, 1),
	(10, 10, 'Me sentía con miedo.', 1, 1),
	(11, 11, 'Mi sueño era inquieto.', 1, 1),
	(12, 12, 'Estaba contento.', 1, 1),
	(13, 13, 'Hablé menos de lo habitual.', 1, 1),
	(14, 14, 'Me sentí solo.', 1, 1),
	(15, 15, 'La gente no era amigable.', 1, 1),
	(16, 16, 'Disfruté de la vida.', 1, 1),
	(17, 17, 'Pasé ratos llorando.', 1, 1),
	(18, 18, 'Me sentí triste.', 1, 1),
	(19, 19, 'Sentía que no le caía bien a la gente.', 1, 1),
	(20, 20, 'No tenía ganas de hacer nada.', 1, 1),
	(21, 1, 'Me siento tenso o molesto', 2, 2),
	(22, 2, 'Tengo una gran sensación de miedo, como si algo horrible me fuera a suceder', 2, 6),
	(23, 3, 'Tengo la cabeza llena de preocupaciones', 2, 7),
	(24, 4, 'Puedo estar sentado tranquilamente y sentirme relajado', 2, 8),
	(25, 5, 'Tengo una sensación de miedo, como de "aleteo" en el estómago', 2, 9),
	(26, 6, 'Me siento inquieto, como si estuviera continuamente en movimiento', 2, 10),
	(27, 7, 'Me asaltan sentimientos repentinos de pánico', 2, 11),
	(28, 1, 'Soy capaz de adaptarme a los cambios.', 4, 4),
	(29, 2, 'Tengo relaciones cercanas y seguras.', 4, 4),
	(30, 3, 'A veces el destino o Dios pueden ayudar.', 4, 4),
	(31, 4, 'Puedo afrontar lo que venga.', 4, 4),
	(32, 5, 'Los éxitos pasados dan confianza para los nuevos retos.', 4, 4),
	(33, 6, 'Veo el lado divertido de las cosas.', 4, 4),
	(34, 7, 'Hacer frente al estrés fortalece.', 4, 4),
	(35, 8, 'Tiendo a recuperarme tras una enfermedad o una dificultad.', 4, 4),
	(36, 9, 'Las cosas ocurren por una razón.', 4, 4),
	(37, 10, 'Sea como sea, doy lo mejor de mí.', 4, 4),
	(38, 11, 'Puedes alcanzar tus objetivos.', 4, 4),
	(39, 12, 'Cuando las cosas parecen desesperadas, no me rindo.', 4, 4),
	(40, 13, 'Sé a quien acudir a buscar ayuda.', 4, 4),
	(41, 14, 'Bajo presión, me centro y pienso con claridad.', 4, 4),
	(42, 15, 'Prefiero tomar el mando en la solución de problemas.', 4, 4),
	(43, 16, 'No me desanimo fácilmente por los fallos.', 4, 4),
	(44, 17, 'Pienso en mí mismo como una persona fuerte.', 4, 4),
	(45, 18, 'Tomo decisiones impopulares o difíciles.', 4, 4),
	(46, 19, 'Puedo manejar sentimientos desagradables.', 4, 4),
	(47, 20, 'Tengo que actuar por corazonadas.', 4, 4),
	(48, 21, 'Las cosas que hago tienen un sentido.', 4, 4),
	(49, 22, 'Tengo el control de mi vida.', 4, 4),
	(50, 23, 'Me gustan los retos.', 4, 4),
	(51, 24, 'Trabajo para alcanzar mis objetivos.', 4, 4),
	(52, 25, 'Estoy orgulloso de mis logros.', 4, 4),
	(53, 1, 'Recibo visitas de mis amigos y familiares.', 5, 3),
	(54, 2, 'Recibo ayuda en asuntos relacionados con mi casa.', 5, 3),
	(55, 3, 'Recibo elogios o reconocimientos cuando hago bien mi trabajo.', 5, 3),
	(56, 4, 'Cuento con personas que se preocupan de lo que me sucede.', 5, 3),
	(57, 5, 'Recibo amor y afecto', 5, 3),
	(58, 6, 'Tengo la posibilidad de hablar con alguien de mis problemas en el trabajo o en la casa.', 5, 3),
	(59, 7, 'Tengo la posibilidad de hablar con alguien de mis problemas personales y familiares.', 5, 3),
	(60, 8, 'Tengo la posibilidad de hablar con alguien de mis problemas personales y familiares.', 5, 3),
	(61, 9, 'Tengo la posibilidad de hablar con alguien de mis problemas económicos.', 5, 3),
	(62, 10, 'Recibo consejos útiles cuando me ocurre algún acontecimiento importante en mi vida.', 5, 3),
	(63, 11, 'Recibo ayuda cuando estoy enfermo en la cama.', 5, 3),
	(64, 1, '¿Siente que su familiar solicita más ayuda de la que realmente necesita?', 3, 5),
	(65, 2, '¿Siente que debido al tiempo que dedica a su familiar ya  no dispone de tiempo suficiente para usted?', 3, 5),
	(66, 3, '¿Se siente tenso cuando tiene que cuidar a su familiar y atender además otras responsabilidades?', 3, 5),
	(67, 4, '¿Se siente avergonzado por la conducta de su familiar?', 3, 5),
	(68, 5, '¿Se siente enfadado cuando está cerca de su familiar?', 3, 5),
	(69, 6, '¿Cree que la situación actual afecta de manera negativa a su relación con amigos y otros miembros de su familia?', 3, 5),
	(70, 7, '¿Siente temor por el futuro que le espera a su familiar?', 3, 5),
	(71, 8, '¿Siente que su familiar depende de usted?', 3, 5),
	(72, 9, '¿Se siente agobiado cuando tiene que estar junto a su familiar?', 3, 5),
	(73, 10, '¿Siente que su salud se ha resentido por cuidar a su familia?', 3, 5),
	(74, 11, '¿Siente que no tiene la vida privada que desearía debido a su familiar?', 3, 5),
	(75, 12, '¿Cree que su vida social se ha visto afectada por tener que cuidar de su familiar?', 3, 5),
	(76, 13, '¿Se siente incómodo para invitar amigos a casa, a causa de su familiar?', 3, 5),
	(77, 14, '¿Cree que su familiar espera que usted le cuide, como si fuera la única persona con la que puede contar?', 3, 5),
	(78, 15, '¿Cree que no dispone de dinero suficiente para cuidar a su familiar además de sus otros gastos?', 3, 5),
	(79, 16, '¿Siente que será incapaz de cuidar a su familiar por mucho más tiempo?', 3, 5),
	(80, 17, '¿Siente que ha perdido el control sobre su vida desde que la enfermedad de su familiar se manifestó?', 3, 5),
	(81, 18, '¿Desearía poder encargar el cuidado de su familiar a otras personas?', 3, 5),
	(82, 19, '¿Se siente inseguro acerca de lo que debe hacer con su familiar?', 3, 5),
	(83, 20, '¿Siente que debería hacer más de lo que hace por su familiar?', 3, 5),
	(84, 21, '¿Cree que podría cuidar de su familiar mejor de lo que lo hace?', 3, 5),
	(85, 22, 'En general: ¿Se siente muy sobrecargado por tener que cuidar de su familiar?', 3, 5),
	(86, 1, 'Me satisface la ayuda que recibo de mi familia cuando tengo algún problema y/o necesidad.', 6, 12),
	(87, 2, 'Me satisface la participación que mi familia brinda y permite.', 6, 12),
	(88, 3, 'Me satisface cómo mi familia acepta y apoya mis deseos de emprender nuevas actividades.', 6, 12),
	(89, 4, 'Me satisface como mi familia expresa afectos y responde a mis emociones como rabia, tristeza, amor.', 6, 12),
	(90, 5, 'Me satisface como compartimos en familia: a) El tiempo para estar juntos, b) Los espacios en la casa, c) El dinero', 6, 12);
/*!40000 ALTER TABLE `principal_question` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_scale
CREATE TABLE IF NOT EXISTS `principal_scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla alzcare_db.principal_scale: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_scale` DISABLE KEYS */;
INSERT INTO `principal_scale` (`id`, `description`) VALUES
	(1, 'CES-D'),
	(2, 'HAD-A - Q1'),
	(3, 'DUKE'),
	(4, 'CD-RISC'),
	(5, 'Zarit'),
	(6, 'HAD-A - Q2'),
	(7, 'HAD-A - Q3'),
	(8, 'HAD-A - Q4'),
	(9, 'HAD-A - Q5'),
	(10, 'HAD-A - Q6'),
	(11, 'HAD-A - Q7'),
	(12, 'APGAR Familiar');
/*!40000 ALTER TABLE `principal_scale` ENABLE KEYS */;

-- Volcando estructura para tabla alzcare_db.principal_tutor
CREATE TABLE IF NOT EXISTS `principal_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `mLastName` varchar(60) NOT NULL,
  `relationship` varchar(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `reason` longtext,
  `knowledge` tinyint(1) NOT NULL,
  `observation` longtext NOT NULL,
  `status` varchar(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `adult_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_tutor_adult_id_cc9d741e_fk_principal_adult_id` (`adult_id`),
  CONSTRAINT `principal_tutor_adult_id_cc9d741e_fk_principal_adult_id` FOREIGN KEY (`adult_id`) REFERENCES `principal_adult` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla alzcare_db.principal_tutor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `principal_tutor` DISABLE KEYS */;
INSERT INTO `principal_tutor` (`id`, `name`, `lastName`, `mLastName`, `relationship`, `email`, `phone`, `address`, `gender`, `reason`, `knowledge`, `observation`, `status`, `created`, `updated`, `adult_id`) VALUES
	(1, 'Juan', 'Perez', 'Lopez', 'A', 'a@a.com', '12354564', 'dgdfgd', 'M', 'dfgdfgdf', 1, 'dfgdsfgsdg', 'A', '2018-09-21 07:17:06.318089', '2018-09-21 07:17:06.318089', 1);
/*!40000 ALTER TABLE `principal_tutor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
