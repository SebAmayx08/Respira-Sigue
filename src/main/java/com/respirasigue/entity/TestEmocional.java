package com.respirasigue.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.type.SqlTypes;

import java.time.LocalDateTime;

@Entity
@Table(name = "tests_emocionales")
public class TestEmocional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @JdbcTypeCode(SqlTypes.TINYINT)
    @Column(name = "puntaje_estres", nullable = false)
    private Integer puntajeEstres;

    @JdbcTypeCode(SqlTypes.TINYINT)
    @Column(name = "puntaje_ansiedad", nullable = false)
    private Integer puntajeAnsiedad;

    @Column(name = "nivel_estres", nullable = false)
    private String nivelEstres;

    @Column(name = "nivel_ansiedad", nullable = false)
    private String nivelAnsiedad;

    @Column(name = "categoria_recomendada", nullable = false)
    private String categoriaRecomendada;

    @Column(name = "categoria_slug")
    private String categoriaSlug;

    /** JSON con las respuestas del test, guardado como texto JSON. */
    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "respuestas")
    private String respuestas;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public TestEmocional() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Integer getPuntajeEstres() { return puntajeEstres; }
    public void setPuntajeEstres(Integer puntajeEstres) { this.puntajeEstres = puntajeEstres; }

    public Integer getPuntajeAnsiedad() { return puntajeAnsiedad; }
    public void setPuntajeAnsiedad(Integer puntajeAnsiedad) { this.puntajeAnsiedad = puntajeAnsiedad; }

    public String getNivelEstres() { return nivelEstres; }
    public void setNivelEstres(String nivelEstres) { this.nivelEstres = nivelEstres; }

    public String getNivelAnsiedad() { return nivelAnsiedad; }
    public void setNivelAnsiedad(String nivelAnsiedad) { this.nivelAnsiedad = nivelAnsiedad; }

    public String getCategoriaRecomendada() { return categoriaRecomendada; }
    public void setCategoriaRecomendada(String categoriaRecomendada) { this.categoriaRecomendada = categoriaRecomendada; }

    public String getCategoriaSlug() { return categoriaSlug; }
    public void setCategoriaSlug(String categoriaSlug) { this.categoriaSlug = categoriaSlug; }

    public String getRespuestas() { return respuestas; }
    public void setRespuestas(String respuestas) { this.respuestas = respuestas; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
