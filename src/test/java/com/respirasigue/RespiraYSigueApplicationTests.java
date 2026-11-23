package com.respirasigue;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Disabled("Requiere MySQL activo. Se habilita junto con las pruebas de integración (S2-13).")
class RespiraYSigueApplicationTests {

	@Test
	void contextLoads() {
	}

}
