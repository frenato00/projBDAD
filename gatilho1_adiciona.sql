CREATE TRIGGER NUM_EQUIPAMENTO_INSERT
AFTER INSERT ON R_EQUIPAMENTO_SALA_DE_EXAME
FOR EACH ROW
BEGIN
    UPDATE R_EQUIPAMENTO_SALA_DE_EXAME
    SET exemplares = CASE
        WHEN NEW.exemplares > (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento) THEN
            (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento)
        ELSE
            NEW.exemplares
        END
    WHERE equipamento = NEW.equipamento;

    UPDATE R_ESPECIALIDADE_EQUIPAMENTO
    SET exemplaresEmStock = CASE
        WHEN NEW.exemplares > (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento) THEN
            0
        ELSE
            (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento) - NEW.exemplares
        END
    WHERE equipamento = NEW.equipamento;
END;
