    -- DROP TABLE AuditLog;

/*
    CREATE TABLE AuditLog (
        id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        operation_date           DATE,
        type           VARCHAR(255),
        plot_id INTEGER NOT NULL,
        system_user_id     INTEGER NOT NULL

    );



    ALTER TABLE AuditLog ADD CONSTRAINT FK_System_User FOREIGN KEY (system_user_id) REFERENCES SystemUser (id);
    --ALTER TABLE AuditLog ADD CONSTRAINT Fk_Plot FOREIGN KEY (plot_id) REFERENCES Plot (id);


 */
    CREATE OR REPLACE TRIGGER insert_log
        AFTER INSERT ON Plot
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :new.id , 1 ,'INSERT');

    END;

    CREATE OR REPLACE TRIGGER update_log
        AFTER UPDATE ON Plot
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :new.id, 1 ,'UPDATE');
    END;

    CREATE OR REPLACE TRIGGER delete_log
        AFTER DELETE ON Plot
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :old.id, 1, 'DELETE');
    END;

    COMMIT;


    -- select * from AuditLog order by operation_date;

    -- update Plot set area=200
    -- where area=400;

CREATE OR REPLACE TRIGGER insert_operation_log
        AFTER INSERT ON Operation
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :new.id , 1 ,'INSERT');

    END;

    CREATE OR REPLACE TRIGGER update_operation_log
        AFTER UPDATE ON Operation
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :new.id, 1 ,'UPDATE');
    END;

    CREATE OR REPLACE TRIGGER delete_operation_log
        AFTER DELETE ON Operation
        FOR EACH ROW
    BEGIN
            insert into AuditLog (operation_date, plot_id, system_user_id, type)
            values (SYSDATE, :old.id, 1, 'DELETE');
    END;
    commit;