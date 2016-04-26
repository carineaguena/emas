
-- -----------------------------------------------------
-- Table `emas`.`instituicoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`instituicoes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`municipios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(50) NULL,
  `uf` CHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`submissores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`submissores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NULL,
  `email` VARCHAR(60) NULL,
  `senha` VARCHAR(60) NULL,
  `data_cadastro` DATE NULL,
  `ultimo_acesso` TIMESTAMP NULL,
  `id_instituicao` INT NOT NULL,
  `id_municipio` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_submissores_instituicoes_idx` (`id_instituicao` ASC),
  INDEX `fk_submissores_municipios1_idx` (`id_municipio` ASC),
  CONSTRAINT `fk_submissores_instituicoes`
    FOREIGN KEY (`id_instituicao`)
    REFERENCES `emas`.`instituicoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_submissores_municipios1`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `emas`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`eventos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(300) NULL,
  `data_inicio` DATE NULL,
  `data_termino` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`areas` (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `id_evento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_areas_eventos1_idx` (`id_evento` ASC),
  CONSTRAINT `fk_areas_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`formatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`formatos` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `id_evento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_formatos_eventos1_idx` (`id_evento` ASC),
  CONSTRAINT `fk_formatos_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`modalidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`modalidades` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `id_evento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_modalidades_eventos1_idx` (`id_evento` ASC),
  CONSTRAINT `fk_modalidades_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`tipos_trabalho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`tipos_trabalho` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `id_evento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipos_trabalho_eventos1_idx` (`id_evento` ASC),
  CONSTRAINT `fk_tipos_trabalho_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`categorias` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `id_evento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categorias_eventos1_idx` (`id_evento` ASC),
  CONSTRAINT `fk_categorias_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`trabalhos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`trabalhos` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(300) NULL,
  `resumo` TEXT NULL,
  `nome_orientador` VARCHAR(60) NULL,
  `email_orientador` VARCHAR(60) NULL,
  `nome_coorientador1` VARCHAR(60) NULL,
  `email_coorientador1` VARCHAR(60) NULL,
  `nome_coorientador2` VARCHAR(60) NULL,
  `email_coorientador2` VARCHAR(60) NULL,
  `id_submissor` INT NOT NULL,
  `selecionado` CHAR(1) NULL,
  `id_evento` INT NOT NULL,
  `id_area` INT NOT NULL,
  `id_formato` INT NOT NULL,
  `id_modalidade` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trabalhos_submissores1_idx` (`id_submissor` ASC),
  INDEX `fk_trabalhos_eventos1_idx` (`id_evento` ASC),
  INDEX `fk_trabalhos_areas1_idx` (`id_area` ASC),
  INDEX `fk_trabalhos_formatos1_idx` (`id_formato` ASC),
  INDEX `fk_trabalhos_modalidades1_idx` (`id_modalidade` ASC),
  INDEX `fk_trabalhos_tipos_trabalho1_idx` (`id_tipo` ASC),
  INDEX `fk_trabalhos_categorias1_idx` (`id_categoria` ASC),
  CONSTRAINT `fk_trabalhos_submissores1`
    FOREIGN KEY (`id_submissor`)
    REFERENCES `emas`.`submissores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_eventos1`
    FOREIGN KEY (`id_evento`)
    REFERENCES `emas`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_areas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `emas`.`areas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_formatos1`
    FOREIGN KEY (`id_formato`)
    REFERENCES `emas`.`formatos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_modalidades1`
    FOREIGN KEY (`id_modalidade`)
    REFERENCES `emas`.`modalidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_tipos_trabalho1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `emas`.`tipos_trabalho` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabalhos_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `emas`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`autores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NULL,
  `email` VARCHAR(60) NULL,
  `id_trabalho` INT NOT NULL,
  `id_instituicao` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_autores_trabalhos1_idx` (`id_trabalho` ASC),
  INDEX `fk_autores_instituicoes1_idx` (`id_instituicao` ASC),
  CONSTRAINT `fk_autores_trabalhos1`
    FOREIGN KEY (`id_trabalho`)
    REFERENCES `emas`.`trabalhos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autores_instituicoes1`
    FOREIGN KEY (`id_instituicao`)
    REFERENCES `emas`.`instituicoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`usuarios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NULL,
  `login` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(60) NULL,
  `email` VARCHAR(60) NULL,
  `data_cadastro` DATE NULL,
  `ultimo_acesso` TIMESTAMP NULL,
  `status` CHAR(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emas`.`arquivos_trabalho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emas`.`arquivos_trabalho` (
  `id` INT NOT NULL,
  `data_submissao` DATE NULL,
  `hora_submissao` TIME NULL,
  `extensao_arquivo` VARCHAR(4) NULL,
  `id_trabalho` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_arquivos_trabalho_trabalhos1_idx` (`id_trabalho` ASC),
  CONSTRAINT `fk_arquivos_trabalho_trabalhos1`
    FOREIGN KEY (`id_trabalho`)
    REFERENCES `emas`.`trabalhos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
