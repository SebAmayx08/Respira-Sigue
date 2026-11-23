package com.respirasigue;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.SpringBootApplication;

class EstructuraProyectoTests {

	@Test
	void clasePrincipalTieneSpringBootApplication() {
		assertTrue(RespiraYSigueApplication.class.isAnnotationPresent(SpringBootApplication.class));
	}

	@Test
	void claseSeEncuentraEnElPaqueteRaiz() {
		assertTrue(RespiraYSigueApplication.class.getPackageName().equals("com.respirasigue"));
	}

}
