CREATE TRIGGER NUM_EQUIPAMENTO_UPDATE
AFTER UPDATE OF exemplares ON R_EQUIPAMENTO_SALA_DE_EXAME
FOR EACH ROW
BEGIN
    UPDATE R_ESPECIALIDADE_EQUIPAMENTO
    SET exemplaresEmStock = CASE
        WHEN NEW.exemplares - OLD.exemplares > (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento) THEN
            RAISE(ABORT, 'Não existem exemplares suficientes em stock')
        ELSE
            (SELECT exemplaresEmStock FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = NEW.equipamento) - (NEW.exemplares - OLD.exemplares)
        END
    WHERE equipamento = NEW.equipamento;
END;
