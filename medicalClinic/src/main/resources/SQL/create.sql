CREATE TABLE medical_inst.patient
(
    id bigserial NOT NULL,
    name text NOT NULL,
    gender text NOT NULL,
    age integer,
    sity text NOT NULL,
    addres text NOT NULL,
    birthday_dt date NOT NULL,
    birth_place text NOT NULL,
    registration text NOT NULL,
    passport_series text NOT NULL,
    passport_number text NOT NULL,
    phone_number text NOT NULL,
    another_document text,
    PRIMARY KEY (id)
);

CREATE TABLE medical_inst.medical_history
(
    id bigserial NOT NULL,
    patient_id bigint NOT NULL,
    doc_number text NOT NULL,
    create_dttm date NOT NULL,
    modify_dttm date NOT NULL,
    doctor text NOT NULL,
    diagnosis text,
    parent_id bigint,
    PRIMARY KEY (id),
    UNIQUE (doc_number),
    FOREIGN KEY (patient_id)
        REFERENCES medical_inst.patient (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);