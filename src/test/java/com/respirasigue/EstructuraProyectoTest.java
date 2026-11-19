package com.respirasigue;

import static org.assertj.core.api.Assertions.assertThat;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import org.junit.jupiter.api.Test;

class EstructuraProyectoTest {

    private static final List<String> PAQUETES =
            List.of("config", "controller", "service", "repository", "entity", "dto");

    @Test
    void existenLosPaquetesBase() {
        for (String paquete : PAQUETES) {
            Path ruta = Path.of("src/main/java/com/respirasigue", paquete);
            assertThat(Files.isDirectory(ruta))
                    .as("Falta el paquete %s", paquete)
                    .isTrue();
        }
    }
}
